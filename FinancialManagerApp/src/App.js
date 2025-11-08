import React, { useState, useEffect } from 'react';
import {
  View,
  ScrollView,
  Text,
  TouchableOpacity,
  Alert,
  BackHandler,
} from 'react-native';
import { styles } from './styles';
import Header from './components/Header';
import BalanceCard from './components/BalanceCard';
import ActionButton from './components/ActionButton';
import CategoryCard from './components/CategoryCard';
import TransactionItem from './components/TransactionItem';
import TransactionModal from './components/TransactionModal';
import CategoryModal from './components/CategoryModal';
import CategoryDetailsModal from './components/CategoryDetailsModal';
import EditTransactionModal from './components/EditTransactionModal';
import { loadData, saveData } from './utils/storage';

const App = () => {
  const [bankBalance, setBankBalance] = useState(50000);
  const [cashBalance, setCashBalance] = useState(0);
  const [categories, setCategories] = useState([
    { id: 1, name: 'කෑම', balance: 0, target: 15000, spent: 0, unitPrice: 200 },
    { id: 2, name: 'ප්‍රවාහන', balance: 0, target: 8000, spent: 0, unitPrice: 50 },
    { id: 3, name: 'විනෝදාංශ', balance: 0, target: 5000, spent: 0, unitPrice: 100 }
  ]);
  const [transactions, setTransactions] = useState([]);
  const [modalVisible, setModalVisible] = useState(false);
  const [categoryModalVisible, setCategoryModalVisible] = useState(false);
  const [detailsModalVisible, setDetailsModalVisible] = useState(false);
  const [editTransactionModalVisible, setEditTransactionModalVisible] = useState(false);
  const [currentModalType, setCurrentModalType] = useState('');
  const [selectedCategory, setSelectedCategory] = useState(null);
  const [editingCategory, setEditingCategory] = useState(null);
  const [editingTransaction, setEditingTransaction] = useState(null);
  const [viewingCategoryId, setViewingCategoryId] = useState(null);
  const [nextCategoryId, setNextCategoryId] = useState(4);

  useEffect(() => {
    initializeApp();
    
    const backAction = () => {
      if (modalVisible || categoryModalVisible || detailsModalVisible || editTransactionModalVisible) {
        closeAllModals();
        return true;
      }
      return false;
    };

    const backHandler = BackHandler.addEventListener(
      'hardwareBackPress',
      backAction
    );

    return () => backHandler.remove();
  }, [modalVisible, categoryModalVisible, detailsModalVisible, editTransactionModalVisible]);

  const initializeApp = async () => {
    try {
      const data = await loadData();
      if (data) {
        setBankBalance(data.bankBalance || 50000);
        setCashBalance(data.cashBalance || 0);
        setCategories(data.categories || categories);
        setTransactions(data.transactions || []);
        setNextCategoryId(data.nextCategoryId || 4);
      }
    } catch (error) {
      console.error('Error loading data:', error);
      Alert.alert('දෝෂය', 'දත්ත ලබා ගැනීමේදී දෝෂයක් ඇති විය');
    }
  };

  const saveAppData = async () => {
    try {
      const data = {
        bankBalance,
        cashBalance,
        categories,
        transactions,
        nextCategoryId
      };
      await saveData(data);
    } catch (error) {
      console.error('Error saving data:', error);
    }
  };

  useEffect(() => {
    saveAppData();
  }, [bankBalance, cashBalance, categories, transactions, nextCategoryId]);

  const openModal = (type) => {
    setCurrentModalType(type);
    if (type === 'add-category') {
      setCategoryModalVisible(true);
    } else {
      setModalVisible(true);
    }
  };

  const closeAllModals = () => {
    setModalVisible(false);
    setCategoryModalVisible(false);
    setDetailsModalVisible(false);
    setEditTransactionModalVisible(false);
    setSelectedCategory(null);
    setEditingCategory(null);
    setEditingTransaction(null);
  };

  const showCategoryDetails = (categoryId) => {
    setViewingCategoryId(categoryId);
    setDetailsModalVisible(true);
  };

  const editCategory = (categoryId) => {
    const category = categories.find(cat => cat.id === categoryId);
    if (category) {
      setEditingCategory(category);
      setCategoryModalVisible(true);
    }
  };

  const confirmDeleteCategory = (categoryId) => {
    const category = categories.find(cat => cat.id === categoryId);
    if (!category) return;

    const categoryTransactions = transactions.filter(t => 
      t.category && t.category.id === categoryId
    );

    Alert.alert(
      'කාණ්ඩය මකන්න',
      `"${category.name}" කාණ්ඩය මකන්න අවශ්‍යද?` + 
      (categoryTransactions.length > 0 ? 
        `\n\nසටහන: මෙම කාණ්ඩයට අදාළ ${categoryTransactions.length} ගනුදෙනු මකා දමනු ලැබේ.` : ''),
      [
        { text: 'අවලංගු කරන්න', style: 'cancel' },
        { 
          text: 'මකන්න', 
          onPress: () => deleteCategory(categoryId),
          style: 'destructive'
        }
      ]
    );
  };

  const deleteCategory = (categoryId) => {
    const updatedCategories = categories.filter(cat => cat.id !== categoryId);
    setCategories(updatedCategories);
    
    const updatedTransactions = transactions.filter(t => 
      !t.category || t.category.id !== categoryId
    );
    setTransactions(updatedTransactions);
    
    Alert.alert('සාර්ථකයි', 'කාණ්ඩය සාර්ථකව මකා දමන ලදී');
  };

  const addTransaction = (transactionData) => {
    const { type, amount, description, category } = transactionData;
    const now = new Date();
    const dateString = now.toLocaleString('si-LK');
    const timestamp = now.getTime();

    const transaction = {
      id: timestamp,
      type,
      amount,
      category: category ? {...category} : null,
      description,
      date: dateString,
      timestamp
    };

    if (type === 'bank-deposit') {
      setBankBalance(prev => prev + amount);
    } else if (type === 'income') {
      setBankBalance(prev => prev - amount);
      setCashBalance(prev => prev + amount);
    } else if (type === 'expense') {
      setCashBalance(prev => prev - amount);
      
      if (category) {
        const updatedCategories = categories.map(cat => {
          if (cat.id === category.id) {
            return {
              ...cat,
              balance: cat.balance + amount,
              spent: cat.spent + amount
            };
          }
          return cat;
        });
        setCategories(updatedCategories);
      }
    }

    setTransactions(prev => [transaction, ...prev]);
    setModalVisible(false);
    Alert.alert('සාර්ථකයි', 'ගනුදෙනුව සාර්ථකව සටහන් කරන ලදී');
  };

  const saveCategory = (categoryData) => {
    const { id, name, target, unitPrice } = categoryData;
    
    if (editingCategory) {
      const updatedCategories = categories.map(cat => 
        cat.id === id ? { ...cat, name, target, unitPrice } : cat
      );
      setCategories(updatedCategories);
      Alert.alert('සාර්ථකයි', 'කාණ්ඩය සාර්ථකව යාවත්කාලීන කරන ලදී');
    } else {
      const newCategory = {
        id: nextCategoryId,
        name,
        balance: 0,
        target,
        spent: 0,
        unitPrice
      };
      setCategories(prev => [...prev, newCategory]);
      setNextCategoryId(prev => prev + 1);
      Alert.alert('සාර්ථකයි', 'නව කාණ්ඩය සාර්ථකව එකතු කරන ලදී');
    }
    
    setCategoryModalVisible(false);
    setEditingCategory(null);
  };

  const handleEditTransaction = (transaction) => {
    setEditingTransaction(transaction);
    setEditTransactionModalVisible(true);
  };

  const updateTransaction = (updatedTransaction) => {
    const oldTransaction = editingTransaction;
    
    // Reverse the old transaction effects
    if (oldTransaction.type === 'bank-deposit') {
      setBankBalance(prev => prev - oldTransaction.amount);
    } else if (oldTransaction.type === 'income') {
      setBankBalance(prev => prev + oldTransaction.amount);
      setCashBalance(prev => prev - oldTransaction.amount);
    } else if (oldTransaction.type === 'expense') {
      setCashBalance(prev => prev + oldTransaction.amount);
      
      if (oldTransaction.category) {
        const updatedCategories = categories.map(cat => {
          if (cat.id === oldTransaction.category.id) {
            return {
              ...cat,
              balance: cat.balance - oldTransaction.amount,
              spent: cat.spent - oldTransaction.amount
            };
          }
          return cat;
        });
        setCategories(updatedCategories);
      }
    }
    
    // Apply the new transaction effects
    if (updatedTransaction.type === 'bank-deposit') {
      setBankBalance(prev => prev + updatedTransaction.amount);
    } else if (updatedTransaction.type === 'income') {
      setBankBalance(prev => prev - updatedTransaction.amount);
      setCashBalance(prev => prev + updatedTransaction.amount);
    } else if (updatedTransaction.type === 'expense') {
      setCashBalance(prev => prev - updatedTransaction.amount);
      
      if (updatedTransaction.category) {
        const updatedCategories = categories.map(cat => {
          if (cat.id === updatedTransaction.category.id) {
            return {
              ...cat,
              balance: cat.balance + updatedTransaction.amount,
              spent: cat.spent + updatedTransaction.amount
            };
          }
          return cat;
        });
        setCategories(updatedCategories);
      }
    }
    
    // Update the transaction in the list
    const updatedTransactions = transactions.map(t =>
      t.id === updatedTransaction.id ? updatedTransaction : t
    );
    setTransactions(updatedTransactions);
    
    setEditTransactionModalVisible(false);
    setEditingTransaction(null);
    Alert.alert('සාර්ථකයි', 'ගනුදෙනුව සාර්ථකව යාවත්කාලීන කරන ලදී');
  };

  const confirmDeleteTransaction = (transaction) => {
    Alert.alert(
      'ගනුදෙනුව මකන්න',
      'මෙම ගනුදෙනුව මකන්න අවශ්‍යද? Balance එක ස්වයංක්‍රීයව යාවත්කාලීන වේ.',
      [
        { text: 'අවලංගු කරන්න', style: 'cancel' },
        { 
          text: 'මකන්න', 
          onPress: () => deleteTransaction(transaction),
          style: 'destructive'
        }
      ]
    );
  };

  const deleteTransaction = (transaction) => {
    // Reverse the transaction effects
    if (transaction.type === 'bank-deposit') {
      setBankBalance(prev => prev - transaction.amount);
    } else if (transaction.type === 'income') {
      setBankBalance(prev => prev + transaction.amount);
      setCashBalance(prev => prev - transaction.amount);
    } else if (transaction.type === 'expense') {
      setCashBalance(prev => prev + transaction.amount);
      
      if (transaction.category) {
        const updatedCategories = categories.map(cat => {
          if (cat.id === transaction.category.id) {
            return {
              ...cat,
              balance: cat.balance - transaction.amount,
              spent: cat.spent - transaction.amount
            };
          }
          return cat;
        });
        setCategories(updatedCategories);
      }
    }
    
    // Remove transaction from list
    const updatedTransactions = transactions.filter(t => t.id !== transaction.id);
    setTransactions(updatedTransactions);
    
    Alert.alert('සාර්ථකයි', 'ගනුදෙනුව සාර්ථකව මකා දමන ලදී');
  };

  return (
    <View style={styles.container}>
      <Header title="මුදල් කළමනාකරණය" version="v2.0 - Enhanced" />
      
      <ScrollView style={styles.content}>
        <View style={styles.balanceContainer}>
          <BalanceCard
            label="බැංකු ශේෂය"
            amount={bankBalance}
            type="bank"
            onDeposit={() => openModal('bank-deposit')}
          />
          <BalanceCard
            label="මුදල් ශේෂය"
            amount={cashBalance}
            type="cash"
          />
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
              වියදම් කාණ්ඩ <Text style={styles.clickHint}>(Tap කරන්න)</Text>
            </Text>
            <TouchableOpacity 
              style={styles.addButton}
              onPress={() => openModal('add-category')}
            >
              <Text style={styles.addButtonText}>➕ කාණ්ඩයක් එකතු කරන්න</Text>
            </TouchableOpacity>
          </View>
          
          {categories.length === 0 ? (
            <View style={styles.emptyState}>
              <Text style={styles.emptyStateText}>
                කාණ්ඩ නොමැත. "කාණ්ඩයක් එකතු කරන්න" tap කරන්න.
              </Text>
            </View>
          ) : (
            categories.map(category => (
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
            transactions.slice(0, 15).map(transaction => (
              <TransactionItem
                key={transaction.id}
                transaction={transaction}
                onEdit={handleEditTransaction}
                onDelete={confirmDeleteTransaction}
              />
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
        category={categories.find(cat => cat.id === viewingCategoryId)}
        transactions={transactions.filter(t => 
          t.category && t.category.id === viewingCategoryId
        )}
        onClose={closeAllModals}
      />
      
      <EditTransactionModal
        visible={editTransactionModalVisible}
        transaction={editingTransaction}
        categories={categories}
        onClose={closeAllModals}
        onSubmit={updateTransaction}
      />
    </View>
  );
};

export default App;
