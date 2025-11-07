import { useCallback, useEffect, useMemo, useRef, useState } from 'react';
import { Alert } from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';
import { categoryColors } from '../theme/colors';

const STORAGE_KEY = 'sinhalaFinanceState@1';

export const TRANSACTION_TYPES = {
  BANK_DEPOSIT: 'bank-deposit',
  CASH_WITHDRAWAL: 'cash-withdrawal',
  CASH_EXPENSE: 'expense',
};

const categoryTemplates = [
  {
    name: 'අත්‍යාවශ්‍ය වියදම්',
    target: 15000,
    unitPrice: 1000,
    color: categoryColors[0],
  },
  {
    name: 'අහාර',
    target: 20000,
    unitPrice: 500,
    color: categoryColors[3],
  },
  {
    name: 'ප්‍රවාහන',
    target: 8000,
    unitPrice: 200,
    color: categoryColors[2],
  },
];

const buildDefaultCategories = () =>
  categoryTemplates.map((template, index) => ({
    id: index + 1,
    name: template.name,
    target: template.target,
    spent: 0,
    unitPrice: template.unitPrice,
    color: template.color,
    createdAt: new Date().toISOString(),
  }));

export const useFinanceData = () => {
  const [bankBalance, setBankBalance] = useState(50000);
  const [cashBalance, setCashBalance] = useState(5000);
  const [categories, setCategories] = useState(() => buildDefaultCategories());
  const [transactions, setTransactions] = useState([]);
  const [nextCategoryId, setNextCategoryId] = useState(categoryTemplates.length + 1);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  const hasHydrated = useRef(false);

  useEffect(() => {
    const hydrate = async () => {
      try {
        const raw = await AsyncStorage.getItem(STORAGE_KEY);
        if (raw) {
          const snapshot = JSON.parse(raw);
          if (snapshot.bankBalance !== undefined) setBankBalance(snapshot.bankBalance);
          if (snapshot.cashBalance !== undefined) setCashBalance(snapshot.cashBalance);
          if (Array.isArray(snapshot.categories) && snapshot.categories.length > 0) {
            setCategories(snapshot.categories);
          }
          if (Array.isArray(snapshot.transactions)) {
            setTransactions(snapshot.transactions);
          }
          if (snapshot.nextCategoryId) {
            setNextCategoryId(snapshot.nextCategoryId);
          }
        }
      } catch (err) {
        console.error('Failed to hydrate data', err);
        setError('දත්ත ලබා ගැනීමේදී දෝෂයක් ඇතිවිය.');
      } finally {
        hasHydrated.current = true;
        setLoading(false);
      }
    };

    hydrate();
  }, []);

  useEffect(() => {
    if (!hasHydrated.current || loading) {
      return;
    }
    const persist = async () => {
      try {
        const snapshot = JSON.stringify({
          bankBalance,
          cashBalance,
          categories,
          transactions,
          nextCategoryId,
          savedAt: new Date().toISOString(),
        });
        await AsyncStorage.setItem(STORAGE_KEY, snapshot);
      } catch (err) {
        console.error('Failed to persist data', err);
      }
    };

    persist();
  }, [bankBalance, cashBalance, categories, transactions, nextCategoryId, loading]);

  const addTransaction = useCallback(
    ({ type, amount, description, categoryId }) => {
      const amountValue = Number(amount);
      if (!Number.isFinite(amountValue) || amountValue <= 0) {
        Alert.alert('වලංගු මුදලක් ඇතුළත් කරන්න');
        return false;
      }

      if (type === TRANSACTION_TYPES.CASH_WITHDRAWAL && amountValue > bankBalance) {
        Alert.alert('බැංකු ශේෂය ප්‍රමාණවත් නොවේ');
        return false;
      }

      if (type === TRANSACTION_TYPES.CASH_EXPENSE && amountValue > cashBalance) {
        Alert.alert('Cash ශේෂය ප්‍රමාණවත් නොවේ');
        return false;
      }

      const now = new Date();
      const categorySnapshot = categoryId
        ? categories.find((category) => category.id === categoryId)
        : null;

      if (type === TRANSACTION_TYPES.CASH_EXPENSE && categoryId && !categorySnapshot) {
        Alert.alert('වලංගු කාණ්ඩයක් තෝරන්න');
        return false;
      }

      const transaction = {
        id: `${now.getTime()}`,
        type,
        amount: amountValue,
        description: description?.trim() || '',
        createdAt: now.toISOString(),
        categoryId: categorySnapshot?.id ?? null,
        categoryName: categorySnapshot?.name ?? null,
      };

      setTransactions((prev) => [transaction, ...prev].slice(0, 60));

      switch (type) {
        case TRANSACTION_TYPES.BANK_DEPOSIT:
          setBankBalance((prev) => prev + amountValue);
          break;
        case TRANSACTION_TYPES.CASH_WITHDRAWAL:
          setBankBalance((prev) => prev - amountValue);
          setCashBalance((prev) => prev + amountValue);
          break;
        case TRANSACTION_TYPES.CASH_EXPENSE:
          setCashBalance((prev) => prev - amountValue);
          if (categorySnapshot) {
            setCategories((prev) =>
              prev.map((category) =>
                category.id === categorySnapshot.id
                  ? {
                      ...category,
                      spent: Number(category.spent || 0) + amountValue,
                      lastUpdated: now.toISOString(),
                    }
                  : category,
              ),
            );
          }
          break;
        default:
          break;
      }

      return true;
    },
    [bankBalance, cashBalance, categories],
  );

  const saveCategory = useCallback(
    ({ id, name, target, unitPrice, color }) => {
      const trimmedName = name?.trim();
      if (!trimmedName) {
        Alert.alert('කාණ්ඩ නම ඇතුළත් කරන්න');
        return false;
      }

      const targetValue = Number(target);
      if (!Number.isFinite(targetValue) || targetValue <= 0) {
        Alert.alert('වලංගු මසකට වෙන්කල මුදලක් ඇතුළත් කරන්න');
        return false;
      }

      const unitPriceValue = Number(unitPrice) > 0 ? Number(unitPrice) : 0;
      const selectedColor = color || categoryColors[(nextCategoryId - 1) % categoryColors.length];

      if (id) {
        setCategories((prev) =>
          prev.map((category) =>
            category.id === id
              ? {
                  ...category,
                  name: trimmedName,
                  target: targetValue,
                  unitPrice: unitPriceValue,
                  color: selectedColor,
                }
              : category,
          ),
        );

        setTransactions((prev) =>
          prev.map((transaction) =>
            transaction.categoryId === id
              ? { ...transaction, categoryName: trimmedName }
              : transaction,
          ),
        );
      } else {
        const now = new Date().toISOString();
        const newCategory = {
          id: nextCategoryId,
          name: trimmedName,
          target: targetValue,
          spent: 0,
          unitPrice: unitPriceValue,
          color: selectedColor,
          createdAt: now,
        };

        setCategories((prev) => [...prev, newCategory]);
        setNextCategoryId((prev) => prev + 1);
      }

      return true;
    },
    [nextCategoryId],
  );

  const deleteCategory = useCallback((categoryId) => {
    Alert.alert(
      'කාණ්ඩය මකා දමන්න',
      'මෙම කාණ්ඩය මැකූ විට, එයට අදාළ ගනුදෙනු ඉතිහාසයෙහි නමින් පමණක් පවතිනු ඇත.',
      [
        { text: 'අවලංගු කරන්න', style: 'cancel' },
        {
          text: 'මකන්න',
          style: 'destructive',
          onPress: () => {
            setCategories((prev) => prev.filter((category) => category.id !== categoryId));
            setTransactions((prev) =>
              prev.map((transaction) =>
                transaction.categoryId === categoryId
                  ? { ...transaction, categoryId: null }
                  : transaction,
              ),
            );
          },
        },
      ],
    );
  }, []);

  const categorySummaries = useMemo(() => {
    const totalTarget = categories.reduce((total, category) => total + Number(category.target || 0), 0);
    const totalSpent = categories.reduce((total, category) => total + Number(category.spent || 0), 0);
    const remaining = Math.max(totalTarget - totalSpent, 0);
    const progress = totalTarget > 0 ? (totalSpent / totalTarget) * 100 : 0;
    return {
      totalTarget,
      totalSpent,
      remaining,
      progress,
    };
  }, [categories]);

  const resetData = useCallback(() => {
    Alert.alert('පද්ධතිය යළි සකස් කරන්න', 'සියලුම දත්ත මකා දමන ලද යුතුද?', [
      { text: 'ඇත', style: 'destructive', onPress: async () => {
        try {
          await AsyncStorage.removeItem(STORAGE_KEY);
        } catch (err) {
          console.error(err);
        }
        setBankBalance(50000);
        setCashBalance(5000);
        setCategories(buildDefaultCategories());
        setTransactions([]);
        setNextCategoryId(categoryTemplates.length + 1);
      }},
      { text: 'නැත', style: 'cancel' },
    ]);
  }, []);

  return {
    bankBalance,
    cashBalance,
    categories,
    transactions,
    loading,
    error,
    summary: categorySummaries,
    addTransaction,
    saveCategory,
    deleteCategory,
    resetData,
  };
};
