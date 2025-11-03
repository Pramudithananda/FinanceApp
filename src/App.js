import React, { useEffect, useState, useCallback } from 'react';
import {
  View,
  ScrollView,
  Text,
  TouchableOpacity,
  Alert,
  BackHandler,
  StatusBar,
} from 'react-native';
import Header from './components/Header';
import BalanceCard from './components/BalanceCard';
import ActionButton from './components/ActionButton';
import CategoryCard from './components/CategoryCard';
import TransactionItem from './components/TransactionItem';
import TransactionModal from './components/Modals/TransactionModal';
import CategoryModal from './components/Modals/CategoryModal';
import CategoryDetailsModal from './components/Modals/CategoryDetailsModal';
import { styles } from './styles';
import { loadData, saveData } from './utils/storage';

const DEFAULT_CATEGORIES = [
  { id: 1, name: 'පාරිභෝගික ගනුදෙනු', balance: 0, target: 10000, spent: 0, unitPrice: 100 },
  { id: 2, name: 'ආහාර', balance: 0, target: 15000, spent: 0, unitPrice: 200 },
  { id: 3, name: 'ප්‍රවාහන', balance: 0, target: 8000, spent: 0, unitPrice: 50 },
];

const App = () => {
  const [bankBalance, setBankBalance] = useState(50000);
  const [cashBalance, setCashBalance] = useState(0);
  const [categories, setCategories] = useState(DEFAULT_CATEGORIES);
  const [transactions, setTransactions] = useState([]);
  const [modalVisible, setModalVisible] = useState(false);
  const [categoryModalVisible, setCategoryModalVisible] = useState(false);
  const [detailsModalVisible, setDetailsModalVisible] = useState(false);
  const [currentModalType, setCurrentModalType] = useState('');
  const [editingCategory, setEditingCategory] = useState(null);
  const [viewingCategoryId, setViewingCategoryId] = useState(null);
  const [nextCategoryId, setNextCategoryId] = useState(4);

  const closeAllModals = useCallback(() => {
    setModalVisible(false);
    setCategoryModalVisible(false);
    setDetailsModalVisible(false);
    setEditingCategory(null);
    setViewingCategoryId(null);
  }, []);

  const openModal = useCallback((type) => {
    setCurrentModalType(type);
    if (type === 'add-category' || type === 'edit-category') {
      setCategoryModalVisible(true);
    } else {
      setModalVisible(true);
    }
  }, []);

  const initializeApp = useCallback(async () => {
    try {
      const data = await loadData();
      if (data) {
        setBankBalance(typeof data.bankBalance === 'number' ? data.bankBalance : 50000);
        setCashBalance(typeof data.cashBalance === 'number' ? data.cashBalance : 0);
        setCategories(Array.isArray(data.categories) && data.categories.length > 0 ? data.categories : DEFAULT_CATEGORIES);
        setTransactions(Array.isArray(data.transactions) ? data.transactions : []);
        setNextCategoryId(typeof data.nextCategoryId === 'number' ? data.nextCategoryId : 4);
      }
    } catch (error) {
      console.error('Error loading data', error);
      Alert.alert('දෝෂයක්', 'දත්ත ලබා ගැනීමේදී දෝෂයක් ඇති විය.');
    }
  }, []);

  useEffect(() => {
    initializeApp();

    const backAction = () => {
      if (modalVisible || categoryModalVisible || detailsModalVisible) {
        closeAllModals();
        return true;
      }
      return false;
    };

    const subscription = BackHandler.addEventListener('hardwareBackPress', backAction);
    return () => subscription.remove();
  }, [initializeApp, closeAllModals, modalVisible, categoryModalVisible, detailsModalVisible]);

  useEffect(() => {
    const payload = {
      bankBalance,
      cashBalance,
      categories,
      transactions,
      nextCategoryId,
    };
    saveData(payload).catch((error) =>
      console.warn('Failed to persist data', error),
    );
  }, [bankBalance, cashBalance, categories, transactions, nextCategoryId]);

  const showCategoryDetails = (categoryId) => {
    setViewingCategoryId(categoryId);
    setDetailsModalVisible(true);
  };

  const editCategory = (categoryId) => {
    const category = categories.find((item) => item.id === categoryId);
    if (category) {
      setEditingCategory(category);
      openModal('edit-category');
    }
  };

  const confirmDeleteCategory = (categoryId) => {
    const category = categories.find((item) => item.id === categoryId);
    if (!category) return;

    const relatedTransactions = transactions.filter(
      (transaction) => transaction.category?.id === categoryId,
    );

    Alert.alert(
      'කාණ්ඩය මකන්න',
      `${category.name} කාණ්ඩය මැකීමට අවශ්‍යද?${
        relatedTransactions.length
          ? `\n\nසටහන: මෙම කාණ්ඩයට අදාළ ${relatedTransactions.length} ගනුදෙනුද මකනු ලැබේ.`
          : ''
      }`,
      [
        { text: 'අවලංගු කරන්න', style: 'cancel' },
        {
          text: 'මකන්න',
          style: 'destructive',
          onPress: () => deleteCategory(categoryId),
        },
      ],
    );
  };

  const deleteCategory = (categoryId) => {
    setCategories((prev) => prev.filter((category) => category.id !== categoryId));
    setTransactions((prev) =>
      prev.filter((transaction) => transaction.category?.id !== categoryId),
    );
    Alert.alert('සාර්ථකයි', 'කාණ්ඩය සාර්ථකව මකාදමා ඇත.');
  };

  const addTransaction = (transactionData) => {
    const { type, amount, description, category } = transactionData;
    const now = new Date();
    const timestamp = now.getTime();
    const formattedDate = new Intl.DateTimeFormat('si-LK', {
      dateStyle: 'medium',
      timeStyle: 'short',
    }).format(now);

    const newTransaction = {
      id: timestamp,
      type,
      amount,
      category: category ? { ...category } : null,
      description,
      date: formattedDate,
      timestamp,
    };

    if (type === 'bank-deposit') {
      setBankBalance((prev) => prev + amount);
    } else if (type === 'income') {
      setBankBalance((prev) => prev - amount);
      setCashBalance((prev) => prev + amount);
    } else if (type === 'expense') {
      setCashBalance((prev) => prev - amount);

      if (category) {
        setCategories((prev) =>
          prev.map((item) =>
            item.id === category.id
              ? {
                  ...item,
                  balance: (item.balance || 0) + amount,
                  spent: (item.spent || 0) + amount,
                }
              : item,
          ),
        );
      }
    }

    setTransactions((prev) => [newTransaction, ...prev]);
    setModalVisible(false);
    Alert.alert('සාර්ථකයි', 'ගනුදෙනුව සාර්ථකව සටහන් විය.');
  };

  const saveCategory = (categoryData) => {
    const { id, name, target, unitPrice } = categoryData;

    if (editingCategory && id) {
      setCategories((prev) =>
        prev.map((item) =>
          item.id === id ? { ...item, name, target, unitPrice } : item,
        ),
      );
      Alert.alert('සාර්ථකයි', 'කාණ්ඩය යාවත්කාලීන කෙරිණි.');
    } else {
      const newCategory = {
        id: nextCategoryId,
        name,
        balance: 0,
        target,
        unitPrice,
        spent: 0,
      };
      setCategories((prev) => [...prev, newCategory]);
      setNextCategoryId((prev) => prev + 1);
      Alert.alert('සාර්ථකයි', 'නව කාණ්ඩය එකතු කෙරිණි.');
    }

    closeAllModals();
  };

  const viewingCategory = viewingCategoryId
    ? categories.find((category) => category.id === viewingCategoryId)
    : null;

  return (
    <View style={styles.container}>
      <StatusBar barStyle="light-content" />
      <Header title="මුදල් කළමනාකරණ" version="v2.3 (Expo Build)" />

      <ScrollView style={styles.content} showsVerticalScrollIndicator={false}>
        <View style={styles.balanceContainer}>
          <BalanceCard
            label="බැංකු ශේෂය"
            amount={bankBalance}
            type="bank"
            onDeposit={() => openModal('bank-deposit')}
          />
          <BalanceCard label="මුදල් ශේෂය" amount={cashBalance} type="cash" />
        </View>

        <View style={styles.actionButtons}>
          <ActionButton
            text="🏦 බැංකුවට තැන්පත් කරන්න"
            color="#8b5cf6"
            onPress={() => openModal('bank-deposit')}
          />
          <ActionButton
            text="⬇️ මුදල් ලබාගැනීම"
            color="#10b981"
            onPress={() => openModal('income')}
          />
          <ActionButton
            text="⬆️ වියදම් කරන්න"
            color="#ef4444"
            onPress={() => openModal('expense')}
          />
          <ActionButton
            text="➕ කාණ්ඩ කළමනාකරණය"
            color="#6b7280"
            onPress={() => openModal('add-category')}
          />
        </View>

        <View style={styles.section}>
          <View style={styles.sectionHeader}>
            <Text style={styles.sectionTitle}>
              වියදම් කාණ්ඩ <Text style={styles.sectionHint}>(tap කරන්න)</Text>
            </Text>
            <TouchableOpacity style={styles.addButton} onPress={() => openModal('add-category')}>
              <Text style={styles.addButtonText}>➕ කාණ්ඩයක් එකතු කරන්න</Text>
            </TouchableOpacity>
          </View>

          {categories.length === 0 ? (
            <View style={styles.emptyState}>
              <Text style={styles.emptyStateText}>
                කාණ්ඩ නොමැත. "කාණ්ඩයක් එකතු කරන්න" බොත්තම තෝරන්න.
              </Text>
            </View>
          ) : (
            categories.map((category) => (
              <CategoryCard
                key={category.id}
                category={category}
                onPress={() => showCategoryDetails(category.id)}
                onEdit={() => editCategory(category.id)}
                onDelete={() => confirmDeleteCategory(category.id)}
              />
            ))
          )}
        </View>

        <View style={styles.section}>
          <Text style={styles.sectionTitle}>මෑත ගනුදෙනු</Text>

          {transactions.length === 0 ? (
            <View style={styles.emptyState}>
              <Text style={styles.emptyStateText}>ගනුදෙනු නොමැත</Text>
            </View>
          ) : (
            transactions.slice(0, 10).map((transaction) => (
              <TransactionItem key={transaction.id} transaction={transaction} />
            ))
          )}
        </View>
      </ScrollView>

      <TransactionModal
        visible={modalVisible}
        type={currentModalType}
        bankBalance={bankBalance}
        cashBalance={cashBalance}
        categories={categories}
        onClose={closeAllModals}
        onSubmit={addTransaction}
      />

      <CategoryModal
        visible={categoryModalVisible}
        category={editingCategory}
        categories={categories}
        onClose={closeAllModals}
        onSubmit={saveCategory}
      />

      <CategoryDetailsModal
        visible={detailsModalVisible}
        category={viewingCategory}
        transactions={transactions.filter(
          (transaction) => transaction.category?.id === viewingCategoryId,
        )}
        onClose={closeAllModals}
      />
    </View>
  );
};

export default App;
