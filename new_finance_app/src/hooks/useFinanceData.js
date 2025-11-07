import { useCallback, useEffect, useMemo, useState } from 'react';
import AsyncStorage from '@react-native-async-storage/async-storage';

const STORAGE_KEY = 'niruma_finance_state/v1';

const seedCategories = [
  {
    id: 'groceries',
    name: 'අත්‍යාවශ්‍ය භාණ්ඩ',
    target: 25000,
    spent: 0,
    color: '#22C55E',
    unitPrice: 0,
    updatedAt: Date.now(),
  },
  {
    id: 'transport',
    name: 'දුම්රිය / බස්',
    target: 8000,
    spent: 0,
    color: '#0EA5E9',
    unitPrice: 0,
    updatedAt: Date.now(),
  },
  {
    id: 'leisure',
    name: 'ප්‍රාසංගික',
    target: 12000,
    spent: 0,
    color: '#F59E0B',
    unitPrice: 0,
    updatedAt: Date.now(),
  },
];

const defaultState = {
  bankBalance: 50000,
  cashBalance: 15000,
  categories: seedCategories,
  transactions: [],
  nextCategoryIndex: seedCategories.length,
};

const categoryPalette = ['#6366F1', '#DB2777', '#0EA5E9', '#22C55E', '#F59E0B', '#14B8A6'];

const coerceNumber = (value) => {
  const parsed = typeof value === 'number' ? value : parseFloat(value);
  return Number.isNaN(parsed) ? 0 : parsed;
};

export const useFinanceData = () => {
  const [state, setState] = useState(defaultState);
  const [hydrated, setHydrated] = useState(false);
  const [loading, setLoading] = useState(true);

  const loadState = useCallback(async () => {
    try {
      const stored = await AsyncStorage.getItem(STORAGE_KEY);
      if (stored) {
        const parsed = JSON.parse(stored);
        setState((prev) => ({
          ...prev,
          ...parsed,
          categories: parsed.categories ?? prev.categories,
          transactions: parsed.transactions ?? prev.transactions,
        }));
      }
    } catch (error) {
      console.warn('Failed to load finance state', error);
    } finally {
      setHydrated(true);
      setLoading(false);
    }
  }, []);

  useEffect(() => {
    loadState();
  }, [loadState]);

  const persistState = useCallback(async (nextState) => {
    try {
      await AsyncStorage.setItem(STORAGE_KEY, JSON.stringify(nextState));
    } catch (error) {
      console.warn('Failed to persist finance state', error);
    }
  }, []);

  useEffect(() => {
    if (hydrated) {
      persistState(state);
    }
  }, [hydrated, persistState, state]);

  const addTransaction = useCallback((payload) => {
    const { type, amount, description, categoryId } = payload;
    const numericAmount = coerceNumber(amount);

    if (numericAmount <= 0) {
      throw new Error('වැලංගු මුදලක් ඇතුළත් කරන්න');
    }

    setState((prev) => {
      let { bankBalance, cashBalance, categories } = prev;
      const timestamp = Date.now();
      const baseTransaction = {
        id: `${timestamp}`,
        type,
        amount: numericAmount,
        description: description?.trim() || '',
        createdAt: timestamp,
      };

      if (type === 'bank-deposit') {
        bankBalance += numericAmount;
      } else if (type === 'cash-withdrawal') {
        if (bankBalance < numericAmount) {
          throw new Error('බැංකු ශේෂය ප්‍රමාණවත් නොවේ');
        }
        bankBalance -= numericAmount;
        cashBalance += numericAmount;
      } else if (type === 'income') {
        cashBalance += numericAmount;
      } else if (type === 'expense') {
        if (cashBalance < numericAmount) {
          throw new Error('මුදල් ශේෂය ප්‍රමාණවත් නොවේ');
        }
        cashBalance -= numericAmount;

        if (categoryId) {
          categories = categories.map((category) => {
            if (category.id === categoryId) {
              return {
                ...category,
                spent: coerceNumber(category.spent) + numericAmount,
                updatedAt: timestamp,
              };
            }
            return category;
          });
        }
      } else {
        throw new Error('වලංගු නොවන ගනුදෙනුවකි');
      }

      const category = categoryId ? categories.find((item) => item.id === categoryId) : null;
      const transaction = {
        ...baseTransaction,
        categoryId: category?.id ?? null,
        categoryName: category?.name ?? null,
      };

      return {
        ...prev,
        bankBalance,
        cashBalance,
        categories,
        transactions: [transaction, ...prev.transactions].slice(0, 100),
      };
    });
  }, []);

  const upsertCategory = useCallback((category) => {
    const { id, name, target, unitPrice } = category;
    const cleanName = name?.trim();

    if (!cleanName) {
      throw new Error('කාණ්ඩ නාමයක් ඇතුළත් කරන්න');
    }

    const numericTarget = Math.max(0, coerceNumber(target));
    const numericUnitPrice = Math.max(0, coerceNumber(unitPrice));

    setState((prev) => {
      const timestamp = Date.now();
      if (id) {
        return {
          ...prev,
          categories: prev.categories.map((existing) =>
            existing.id === id
              ? {
                  ...existing,
                  name: cleanName,
                  target: numericTarget,
                  unitPrice: numericUnitPrice,
                  updatedAt: timestamp,
                }
              : existing
          ),
        };
      }

      const paletteIndex = prev.nextCategoryIndex % categoryPalette.length;
      const newCategory = {
        id: `category-${prev.nextCategoryIndex + 1}`,
        name: cleanName,
        target: numericTarget,
        unitPrice: numericUnitPrice,
        spent: 0,
        color: categoryPalette[paletteIndex],
        updatedAt: timestamp,
      };

      return {
        ...prev,
        categories: [...prev.categories, newCategory],
        nextCategoryIndex: prev.nextCategoryIndex + 1,
      };
    });
  }, []);

  const removeCategory = useCallback((categoryId) => {
    setState((prev) => ({
      ...prev,
      categories: prev.categories.filter((category) => category.id !== categoryId),
      transactions: prev.transactions.map((transaction) =>
        transaction.categoryId === categoryId
          ? { ...transaction, categoryId: null, categoryName: null }
          : transaction
      ),
    }));
  }, []);

  const totals = useMemo(() => {
    const totalTargets = state.categories.reduce((sum, category) => sum + coerceNumber(category.target), 0);
    const totalSpent = state.categories.reduce((sum, category) => sum + coerceNumber(category.spent), 0);

    return {
      totalTargets,
      totalSpent,
      remaining: Math.max(0, totalTargets - totalSpent),
    };
  }, [state.categories]);

  return {
    data: {
      bankBalance: state.bankBalance,
      cashBalance: state.cashBalance,
      categories: state.categories,
      transactions: state.transactions,
      summary: totals,
    },
    actions: {
      addTransaction,
      upsertCategory,
      removeCategory,
    },
    status: {
      loading,
      hydrated,
    },
  };
};
