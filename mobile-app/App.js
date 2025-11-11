import React, { useEffect, useMemo, useState, useCallback } from 'react';
import {
  View,
  ScrollView,
  Text,
  Alert,
  BackHandler,
  SafeAreaView,
  RefreshControl,
} from 'react-native';
import { StatusBar } from 'expo-status-bar';
import { styles, colors } from './src/styles';
import Header from './src/components/Header';
import BalanceCard from './src/components/BalanceCard';
import ActionButton from './src/components/ActionButton';
import CategoryCard from './src/components/CategoryCard';
import TransactionItem from './src/components/TransactionItem';
import TransactionModal from './src/components/modals/TransactionModal';
import CategoryModal from './src/components/modals/CategoryModal';
import CategoryDetailsModal from './src/components/modals/CategoryDetailsModal';
import { loadData, saveData } from './src/utils/storage';
import { formatCurrency } from './src/utils/formatters';

const defaultCategories = [
  { id: 1, name: 'ආහාර', balance: 0, target: 25000, spent: 0, unitPrice: 250 },
  { id: 2, name: 'ගමන්', balance: 0, target: 12000, spent: 0, unitPrice: 120 },
  { id: 3, name: 'බිල්පත්', balance: 0, target: 18000, spent: 0, unitPrice: 6000 },
];

const defaultState = {
  bankBalance: 155000,
  cashBalance: 42500,
  categories: defaultCategories,
  transactions: [],
  nextCategoryId: defaultCategories.length + 1,
};

const App = () => {
  const [bankBalance, setBankBalance] = useState(defaultState.bankBalance);
  const [cashBalance, setCashBalance] = useState(defaultState.cashBalance);
  const [categories, setCategories] = useState(defaultState.categories);
  const [transactions, setTransactions] = useState(defaultState.transactions);
  const [nextCategoryId, setNextCategoryId] = useState(defaultState.nextCategoryId);

  const [transactionModalType, setTransactionModalType] = useState(null);
  const [categoryModalVisible, setCategoryModalVisible] = useState(false);
  const [detailsModalVisible, setDetailsModalVisible] = useState(false);
  const [selectedCategoryId, setSelectedCategoryId] = useState(null);
  const [editingCategory, setEditingCategory] = useState(null);
  const [isHydrating, setIsHydrating] = useState(true);
  const [isRefreshing, setIsRefreshing] = useState(false);

  const selectedCategory = useMemo(
    () => categories.find((cat) => cat.id === selectedCategoryId) || null,
    [categories, selectedCategoryId]
  );

  const categoryTransactions = useMemo(
    () =>
      transactions.filter(
        (transaction) => transaction.category && transaction.category.id === selectedCategoryId
      ),
    [transactions, selectedCategoryId]
  );

  const hydrate = useCallback(async () => {
    try {
      const data = await loadData();
      if (data) {
        setBankBalance(data.bankBalance ?? defaultState.bankBalance);
        setCashBalance(data.cashBalance ?? defaultState.cashBalance);
        setCategories(
          Array.isArray(data.categories) && data.categories.length > 0
            ? data.categories
            : defaultState.categories
        );
        setTransactions(Array.isArray(data.transactions) ? data.transactions : []);
        setNextCategoryId(data.nextCategoryId ?? defaultState.nextCategoryId);
      }
    } catch (error) {
      console.warn('Hydration failed', error);
      Alert.alert('දෝෂයක්', 'දත්ත ලබා ගැනීමේදී ගැටලුවක් ඇති විය.');
    } finally {
      setIsHydrating(false);
      setIsRefreshing(false);
    }
  }, []);

  useEffect(() => {
    hydrate();

    const backAction = () => {
      if (transactionModalType || categoryModalVisible || detailsModalVisible) {
        closeAllModals();
        return true;
      }
      return false;
    };

    const backHandler = BackHandler.addEventListener('hardwareBackPress', backAction);
    return () => backHandler.remove();
  }, [hydrate, transactionModalType, categoryModalVisible, detailsModalVisible]);

  useEffect(() => {
    if (isHydrating) {
      return;
    }
    const payload = {
      bankBalance,
      cashBalance,
      categories,
      transactions,
      nextCategoryId,
    };
    saveData(payload);
  }, [bankBalance, cashBalance, categories, transactions, nextCategoryId, isHydrating]);

  const closeAllModals = () => {
    setTransactionModalType(null);
    setCategoryModalVisible(false);
    setDetailsModalVisible(false);
    setSelectedCategoryId(null);
    setEditingCategory(null);
  };

  const openTransactionModal = (type) => {
    setTransactionModalType(type);
  };

  const openCategoryModal = (category) => {
    setEditingCategory(category || null);
    setCategoryModalVisible(true);
  };

  const openDetailsModal = (categoryId) => {
    setSelectedCategoryId(categoryId);
    setDetailsModalVisible(true);
  };

  const deleteCategory = (categoryId) => {
    const category = categories.find((cat) => cat.id === categoryId);
    if (!category) {
      return;
    }

    const linkedTransactions = transactions.filter(
      (transaction) => transaction.category?.id === categoryId
    );

    Alert.alert(
      'කාණ්ඩය මකන්න',
      `"${category.name}" කාණ්ඩය මකන්නද?${linkedTransactions.length > 0 ? `\n\nසටහන: මෙම කාණ්ඩයට අදාළ ගනුදෙනු ${linkedTransactions.length} ක් ද මකා දමනු ඇත.` : ''
      }`,
      [
        { text: 'අවලංගු කරන්න', style: 'cancel' },
        {
          text: 'මකන්න',
          style: 'destructive',
          onPress: () => {
            setCategories((prev) => prev.filter((cat) => cat.id !== categoryId));
            setTransactions((prev) =>
              prev.filter((transaction) => transaction.category?.id !== categoryId)
            );
            Alert.alert('සාර්ථකයි', 'කාණ්ඩය මකා දැමිනි.');
          },
        },
      ]
    );
  };

  const addTransaction = (transactionData) => {
    const timestamp = Date.now();
    const dateString = new Date(timestamp).toLocaleString('si-LK');
    const transaction = {
      id: timestamp,
      ...transactionData,
      date: dateString,
    };

    setTransactions((prev) => [transaction, ...prev]);

    if (transaction.type === 'bank-deposit') {
      setBankBalance((prev) => prev + transaction.amount);
    }

    if (transaction.type === 'income') {
      setBankBalance((prev) => prev - transaction.amount);
      setCashBalance((prev) => prev + transaction.amount);
    }

    if (transaction.type === 'expense') {
      setCashBalance((prev) => prev - transaction.amount);
      if (transaction.category) {
        setCategories((prev) =>
          prev.map((category) => {
            if (category.id === transaction.category.id) {
              return {
                ...category,
                balance: category.balance + transaction.amount,
                spent: category.spent + transaction.amount,
              };
            }
            return category;
          })
        );
      }
    }

    closeAllModals();
    Alert.alert('සාර්ථකයි', 'ගනුදෙනුව සුරක්ෂිත විය.');
  };

  const saveCategoryChanges = (formData) => {
    if (formData.id) {
      setCategories((prev) =>
        prev.map((category) =>
          category.id === formData.id
            ? {
                ...category,
                name: formData.name,
                target: formData.target,
                unitPrice: formData.unitPrice,
              }
            : category
        )
      );
      Alert.alert('සාර්ථකයි', 'කාණ්ඩය යාවත්කාලීන විය.');
    } else {
      const newCategory = {
        id: nextCategoryId,
        name: formData.name,
        target: formData.target,
        unitPrice: formData.unitPrice,
        balance: 0,
        spent: 0,
      };
      setCategories((prev) => [...prev, newCategory]);
      setNextCategoryId((prev) => prev + 1);
      Alert.alert('සාර්ථකයි', 'නව කාණ්ඩයක් එකතු විය.');
    }

    closeAllModals();
  };

  const totalCategorySpend = useMemo(
    () => categories.reduce((sum, category) => sum + category.spent, 0),
    [categories]
  );

  const totalBalance = bankBalance + cashBalance;

  const handleRefresh = () => {
    setIsRefreshing(true);
    hydrate();
  };

  const transactionModalVisible = Boolean(transactionModalType);

  return (
    <SafeAreaView style={styles.container}>
      <StatusBar style="light" backgroundColor={colors.indigo} />
      <Header title="මුදල් කළමනාකරණය" subtitle="සිංහල Mobile Finance Dashboard" />

      <ScrollView
        style={styles.content}
        refreshControl={<RefreshControl refreshing={isRefreshing} onRefresh={handleRefresh} />}
      >
        <View style={styles.balanceContainer}>
          <BalanceCard
            label="බැංකු ශේෂය"
            amount={bankBalance}
            type="bank"
            onActionPress={() => openTransactionModal('bank-deposit')}
          />
          <BalanceCard
            label="මුදල් ශේෂය"
            amount={cashBalance}
            type="cash"
            onActionPress={() => openTransactionModal('income')}
          />
        </View>

        <View style={styles.section}>
          <View style={styles.sectionHeader}>
            <Text style={styles.sectionTitle}>ක්‍රියාකාරීත්ව</Text>
            <Text style={styles.tapHint}>මුදල් ගලන ක්‍රියා මෙන්</Text>
          </View>

          <View style={styles.actionButtons}>
            <ActionButton
              text="🏦 බැංකුවට තැන්පත් කරන්න"
              color={colors.purple}
              onPress={() => openTransactionModal('bank-deposit')}
            />
            <ActionButton
              text="⬇️ මිලදී ගැනීම් සඳහා මුදල්"
              color={colors.green}
              onPress={() => openTransactionModal('income')}
            />
            <ActionButton
              text="⬆️ වියදම් එකතු කරන්න"
              color={colors.red}
              onPress={() => openTransactionModal('expense')}
            />
            <ActionButton
              text="➕ කාණ්ඩයක් එකතු කරන්න"
              color={colors.slate}
              onPress={() => openCategoryModal(null)}
            />
          </View>
        </View>

        <View style={styles.section}>
          <View style={styles.sectionHeader}>
            <Text style={styles.sectionTitle}>
              වියදම් කාණ්ඩ <Text style={styles.tapHint}>(Tap කරන්න)</Text>
            </Text>
            <View style={{ flexDirection: 'row', gap: 8 }}>
              <Text style={styles.tapHint}>එකතුව: {formatCurrency(totalCategorySpend)}</Text>
              <Text style={styles.tapHint}>මුළු ශේෂය: {formatCurrency(totalBalance)}</Text>
            </View>
          </View>

          {categories.length === 0 ? (
            <View style={styles.emptyState}>
              <Text style={styles.emptyStateText}>
                කාණ්ඩ නොමැත. "➕ කාණ්ඩයක් එකතු කරන්න" බොත්තම භාවිතා කරන්න.
              </Text>
            </View>
          ) : (
            categories.map((category) => (
              <CategoryCard
                key={category.id}
                category={category}
                onPress={() => openDetailsModal(category.id)}
                onEdit={() => openCategoryModal(category)}
                onDelete={() => deleteCategory(category.id)}
              />
            ))
          )}
        </View>

        <View style={styles.section}>
          <View style={styles.sectionHeader}>
            <Text style={styles.sectionTitle}>මෑත ගනුදෙනු</Text>
            <Text style={styles.tapHint}>අවසාන 10 පමණ</Text>
          </View>

          {transactions.length === 0 ? (
            <View style={styles.emptyState}>
              <Text style={styles.emptyStateText}>තවමත් ගනුදෙනු සටහන් වී නැත.</Text>
            </View>
          ) : (
            transactions.slice(0, 10).map((transaction) => (
              <TransactionItem key={transaction.id} transaction={transaction} />
            ))
          )}
        </View>
      </ScrollView>

      <TransactionModal
        visible={transactionModalVisible}
        type={transactionModalType}
        bankBalance={bankBalance}
        cashBalance={cashBalance}
        categories={categories}
        onClose={closeAllModals}
        onSubmit={addTransaction}
      />

      <CategoryModal
        visible={categoryModalVisible}
        category={editingCategory}
        onClose={closeAllModals}
        onSubmit={saveCategoryChanges}
      />

      <CategoryDetailsModal
        visible={detailsModalVisible}
        category={selectedCategory}
        transactions={categoryTransactions}
        onClose={closeAllModals}
      />
    </SafeAreaView>
  );
};

export default App;
