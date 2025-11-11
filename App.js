import React, { useEffect, useMemo, useState } from 'react';
import {
  View,
  ScrollView,
  Text,
  TouchableOpacity,
  Alert,
  BackHandler,
} from 'react-native';
import Header from './src/components/Header';
import BalanceCard from './src/components/BalanceCard';
import ActionButton from './src/components/ActionButton';
import CategoryCard from './src/components/CategoryCard';
import TransactionItem from './src/components/TransactionItem';
import TransactionModal from './src/components/Modals/TransactionModal';
import CategoryModal from './src/components/Modals/CategoryModal';
import CategoryDetailsModal from './src/components/Modals/CategoryDetailsModal';
import { styles } from './src/styles';
import { loadData, saveData } from './src/utils/storage';

const defaultCategories = [
  { id: 1, name: 'පෑන් මිලදී ගැනීම්', balance: 0, target: 10000, spent: 0, unitPrice: 100 },
  { id: 2, name: 'කෑම', balance: 0, target: 15000, spent: 0, unitPrice: 200 },
  { id: 3, name: 'ප්‍රවාහන', balance: 0, target: 8000, spent: 0, unitPrice: 50 },
];

const App = () => {
  const [bankBalance, setBankBalance] = useState(50000);
  const [cashBalance, setCashBalance] = useState(0);
  const [categories, setCategories] = useState(defaultCategories);
  const [transactions, setTransactions] = useState([]);
  const [modalVisible, setModalVisible] = useState(false);
  const [categoryModalVisible, setCategoryModalVisible] = useState(false);
  const [detailsModalVisible, setDetailsModalVisible] = useState(false);
  const [currentModalType, setCurrentModalType] = useState('');
  const [editingCategory, setEditingCategory] = useState(null);
  const [viewingCategoryId, setViewingCategoryId] = useState(null);
  const [nextCategoryId, setNextCategoryId] = useState(defaultCategories.length + 1);
  const [isInitialized, setIsInitialized] = useState(false);

  useEffect(() => {
    let isMounted = true;

    const initializeApp = async () => {
      try {
        const data = await loadData();
        if (data && isMounted) {
          setBankBalance(data.bankBalance ?? 50000);
          setCashBalance(data.cashBalance ?? 0);
          if (Array.isArray(data.categories) && data.categories.length > 0) {
            setCategories(data.categories);
          } else {
            setCategories(defaultCategories);
          }
          setTransactions(Array.isArray(data.transactions) ? data.transactions : []);

          const computedNextId = Array.isArray(data.categories) && data.categories.length > 0
            ? Math.max(...data.categories.map((cat) => cat.id)) + 1
            : defaultCategories.length + 1;
          setNextCategoryId(data.nextCategoryId ?? computedNextId);
        } else if (isMounted) {
          setCategories(defaultCategories);
          setNextCategoryId(defaultCategories.length + 1);
        }
      } catch (error) {
        console.error('Error loading data', error);
        if (isMounted) {
          Alert.alert('දෝෂය', 'දත්ත ලබා ගැනීමේදී දෝෂයක් ඇති විය');
        }
      } finally {
        if (isMounted) {
          setIsInitialized(true);
        }
      }
    };

    initializeApp();

    return () => {
      isMounted = false;
    };
  }, []);

  useEffect(() => {
    const backAction = () => {
      if (modalVisible || categoryModalVisible || detailsModalVisible) {
        closeAllModals();
        return true;
      }
      return false;
    };

    const backHandler = BackHandler.addEventListener('hardwareBackPress', backAction);
    return () => backHandler.remove();
  }, [modalVisible, categoryModalVisible, detailsModalVisible]);

  useEffect(() => {
    if (!isInitialized) {
      return;
    }

    const persist = async () => {
      try {
        await saveData({
          bankBalance,
          cashBalance,
          categories,
          transactions,
          nextCategoryId,
        });
      } catch (error) {
        console.error('Error saving data', error);
        Alert.alert('දෝෂය', 'දත්ත සුරැකීමේදී දෝෂයක් ඇති විය');
      }
    };

    persist();
  }, [bankBalance, cashBalance, categories, transactions, nextCategoryId, isInitialized]);

  const closeTransactionModal = () => {
    setModalVisible(false);
    setCurrentModalType('');
  };

  const closeCategoryModal = () => {
    setCategoryModalVisible(false);
    setEditingCategory(null);
  };

  const closeDetailsModal = () => {
    setDetailsModalVisible(false);
    setViewingCategoryId(null);
  };

  const closeAllModals = () => {
    closeTransactionModal();
    closeCategoryModal();
    closeDetailsModal();
  };

  const openModal = (type) => {
    if (type === 'add-category') {
      setEditingCategory(null);
      setCategoryModalVisible(true);
    } else {
      setCurrentModalType(type);
      setModalVisible(true);
    }
  };

  const showCategoryDetails = (categoryId) => {
    setViewingCategoryId(categoryId);
    setDetailsModalVisible(true);
  };

  const editCategory = (categoryId) => {
    const category = categories.find((cat) => cat.id === categoryId);
    if (!category) {
      return;
    }
    setEditingCategory(category);
    setCategoryModalVisible(true);
  };

  const confirmDeleteCategory = (categoryId) => {
    const category = categories.find((cat) => cat.id === categoryId);
    if (!category) {
      return;
    }

    const categoryTransactions = transactions.filter(
      (transaction) => transaction.category && transaction.category.id === categoryId,
    );

    Alert.alert(
      'කාණ්ඩය මකන්න',
      `"${category.name}" කාණ්ඩය මකා දැමීමට අවශ්‍යද?` +
        (categoryTransactions.length > 0
          ? `\n\nසටහන: මෙම කාණ්ඩයට අදාළ ගනුදෙනු ${categoryTransactions.length}ක් ද මකා දමනු ලැබේ.`
          : ''),
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
    setCategories((prev) => prev.filter((cat) => cat.id !== categoryId));
    setTransactions((prev) => prev.filter((tx) => !(tx.category && tx.category.id === categoryId)));
    Alert.alert('සාර්ථකයි', 'කාණ්ඩය සාර්ථකව මකා දමන ලදී');
  };

  const addTransaction = ({ type, amount, description, category }) => {
    const now = new Date();
    const transaction = {
      id: now.getTime(),
      type,
      amount,
      description,
      category: category ? { ...category } : null,
      date: now.toLocaleString('si-LK'),
      timestamp: now.getTime(),
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
          prev.map((cat) => {
            if (cat.id === category.id) {
              return {
                ...cat,
                balance: cat.balance + amount,
                spent: cat.spent + amount,
              };
            }
            return cat;
          }),
        );
      }
    }

    setTransactions((prev) => [transaction, ...prev]);
    closeTransactionModal();
    Alert.alert('සාර්ථකයි', 'ගනුදෙනුව සාර්ථකව සටහන් කරන ලදී');
  };

  const saveCategory = ({ id, name, target, unitPrice }) => {
    if (editingCategory && id != null) {
      setCategories((prev) =>
        prev.map((cat) =>
          cat.id === id
            ? {
                ...cat,
                name,
                target,
                unitPrice,
              }
            : cat,
        ),
      );
      Alert.alert('සාර්ථකයි', 'කාණ්ඩය සාර්ථකව යාවත්කාලීන කරන ලදී');
    } else {
      const newCategory = {
        id: nextCategoryId,
        name,
        balance: 0,
        target,
        spent: 0,
        unitPrice,
      };
      setCategories((prev) => [...prev, newCategory]);
      setNextCategoryId((prev) => prev + 1);
      Alert.alert('සාර්ථකයි', 'නව කාණ්ඩය සාර්ථකව එකතු කරන ලදී');
    }

    closeCategoryModal();
  };

  const categoryBeingViewed = useMemo(
    () => categories.find((cat) => cat.id === viewingCategoryId) || null,
    [categories, viewingCategoryId],
  );

  const transactionsForCategory = useMemo(
    () =>
      transactions.filter(
        (transaction) => transaction.category && transaction.category.id === viewingCategoryId,
      ),
    [transactions, viewingCategoryId],
  );

  return (
    <View style={styles.container}>
      <Header title="මුදල් කළමනාකරණ" version="v2.3" />

      <ScrollView style={styles.content}>
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
              වියදම් කාණ්ඩ <Text style={styles.sectionHint}>(Tap කරන්න)</Text>
            </Text>
            <TouchableOpacity style={styles.addButton} onPress={() => openModal('add-category')}>
              <Text style={styles.addButtonText}>➕ කාණ්ඩයක් එකතු කරන්න</Text>
            </TouchableOpacity>
          </View>

          {categories.length === 0 ? (
            <View style={styles.emptyState}>
              <Text style={styles.emptyStateText}>
                කාණ්ඩ නොමැත. "කාණ්ඩයක් එකතු කරන්න" තේරීම භාවිතා කරන්න.
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
        onClose={closeTransactionModal}
        onSubmit={addTransaction}
      />

      <CategoryModal
        visible={categoryModalVisible}
        category={editingCategory}
        onClose={closeCategoryModal}
        onSubmit={saveCategory}
      />

      <CategoryDetailsModal
        visible={detailsModalVisible}
        category={categoryBeingViewed}
        transactions={transactionsForCategory}
        onClose={closeDetailsModal}
      />
    </View>
  );
};

export default App;
