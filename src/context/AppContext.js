import React, { createContext, useState, useEffect, useContext } from 'react';
import AsyncStorage from '@react-native-async-storage/async-storage';

const AppContext = createContext();

export const useApp = () => {
  const context = useContext(AppContext);
  if (!context) {
    throw new Error('useApp must be used within AppProvider');
  }
  return context;
};

export const AppProvider = ({ children }) => {
  const [accounts, setAccounts] = useState([
    { id: 1, name: "People's Bank", number: '1234567890', balance: 155000, type: 'bank' },
    { id: 2, name: "Commercial Bank", number: '0987654321', balance: 0, type: 'bank' },
    { id: 3, name: "පිබිදී", number: '2558', balance: 20800, type: 'bank' },
    { id: 4, name: "මුදල්", number: 'CASH-001', balance: 42500, type: 'cash' }
  ]);

  const [transactions, setTransactions] = useState([]);
  const [categories, setCategories] = useState([
    { id: 1, name: 'ආහාර', icon: 'food', color: '#10B981' },
    { id: 2, name: 'ප්‍රවාහන', icon: 'car', color: '#3B82F6' },
    { id: 3, name: 'විනෝදාත්මක', icon: 'gamepad-variant', color: '#F59E0B' },
    { id: 4, name: 'විදුලිය/ජලය', icon: 'lightning-bolt', color: '#EF4444' },
    { id: 5, name: 'අනෙකුත්', icon: 'dots-horizontal', color: '#6B7280' }
  ]);

  const [loading, setLoading] = useState(true);

  useEffect(() => {
    loadData();
  }, []);

  useEffect(() => {
    if (!loading) {
      saveData();
    }
  }, [accounts, transactions, categories]);

  const loadData = async () => {
    try {
      const storedData = await AsyncStorage.getItem('@finance_app_data');
      if (storedData) {
        const data = JSON.parse(storedData);
        if (data.accounts) setAccounts(data.accounts);
        if (data.transactions) setTransactions(data.transactions);
        if (data.categories) setCategories(data.categories);
      }
    } catch (error) {
      console.error('Error loading data:', error);
    } finally {
      setLoading(false);
    }
  };

  const saveData = async () => {
    try {
      const data = {
        accounts,
        transactions,
        categories,
      };
      await AsyncStorage.setItem('@finance_app_data', JSON.stringify(data));
    } catch (error) {
      console.error('Error saving data:', error);
    }
  };

  const addAccount = (account) => {
    const newAccount = {
      ...account,
      id: Date.now(),
      balance: 0,
    };
    setAccounts([...accounts, newAccount]);
  };

  const updateAccount = (id, updates) => {
    setAccounts(accounts.map(acc => 
      acc.id === id ? { ...acc, ...updates } : acc
    ));
  };

  const deleteAccount = (id) => {
    setAccounts(accounts.filter(acc => acc.id !== id));
  };

  const addTransaction = (transaction) => {
    const newTransaction = {
      ...transaction,
      id: Date.now(),
      date: new Date().toISOString(),
    };
    setTransactions([newTransaction, ...transactions]);

    // Update account balance
    if (transaction.accountId) {
      updateAccount(transaction.accountId, {
        balance: accounts.find(a => a.id === transaction.accountId)?.balance + transaction.amount
      });
    }
  };

  const getTotalBalance = () => {
    return accounts.reduce((sum, acc) => sum + acc.balance, 0);
  };

  const getBankBalance = () => {
    return accounts
      .filter(acc => acc.type === 'bank')
      .reduce((sum, acc) => sum + acc.balance, 0);
  };

  const getCashBalance = () => {
    return accounts
      .filter(acc => acc.type === 'cash')
      .reduce((sum, acc) => sum + acc.balance, 0);
  };

  const getIncome = () => {
    return transactions
      .filter(t => t.amount > 0)
      .reduce((sum, t) => sum + t.amount, 0);
  };

  const getExpense = () => {
    return transactions
      .filter(t => t.amount < 0)
      .reduce((sum, t) => sum + Math.abs(t.amount), 0);
  };

  const value = {
    accounts,
    setAccounts,
    addAccount,
    updateAccount,
    deleteAccount,
    transactions,
    addTransaction,
    categories,
    setCategories,
    getTotalBalance,
    getBankBalance,
    getCashBalance,
    getIncome,
    getExpense,
    loading,
  };

  return <AppContext.Provider value={value}>{children}</AppContext.Provider>;
};
