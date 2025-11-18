import React, { useState, useEffect } from 'react';
import {
  View,
  Text,
  StyleSheet,
  ScrollView,
  TouchableOpacity,
  TextInput,
  Modal,
  SafeAreaView,
  StatusBar,
  Alert,
} from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';
import * as FileSystem from 'expo-file-system/legacy';
import * as Sharing from 'expo-sharing';

// Main App Component
export default function ExpenseTrackerApp() {
  const [currentScreen, setCurrentScreen] = useState('dashboard');
  const [accounts, setAccounts] = useState({
    bank: [
      { id: 1, name: "People's Bank", number: "1234567890", type: "ඉතුරුම්", balance: 0, category: "පුබාන මුදල්" },
      { id: 2, name: "Commercial Bank", number: "0987654321", type: "ඉතුරුම්", balance: 0, category: "පුබාන මුදල්" }
    ],
    cash: [
      { id: 1, name: "පුබාන මුදල්", balance: 0 },
      { id: 2, name: "ඇත්නික්කා මුදල්", balance: 0 }
    ]
  });
  
  const [categories, setCategories] = useState([
    { id: 1, name: "පෙන් මලදී ගැනීම", budget: 10000, spent: 0 },
    { id: 2, name: "කෑම", budget: 0, spent: 0 }
  ]);

  const [transactions, setTransactions] = useState([]);
  const [selectedBankAccount, setSelectedBankAccount] = useState(null);
  const [selectedCashAccount, setSelectedCashAccount] = useState(null);
  const [isLoading, setIsLoading] = useState(true);
  const [isDarkMode, setIsDarkMode] = useState(false);

  // Load data from AsyncStorage on mount
  useEffect(() => {
    loadData();
  }, []);

  // Save data to AsyncStorage whenever it changes
  useEffect(() => {
    if (!isLoading) {
      saveData();
    }
  }, [accounts, categories, transactions]);

  // Save dark mode setting
  useEffect(() => {
    if (!isLoading) {
      AsyncStorage.setItem('isDarkMode', JSON.stringify(isDarkMode));
    }
  }, [isDarkMode]);

  const loadData = async () => {
    try {
      const accountsData = await AsyncStorage.getItem('accounts');
      const categoriesData = await AsyncStorage.getItem('categories');
      const transactionsData = await AsyncStorage.getItem('transactions');
      const darkModeData = await AsyncStorage.getItem('isDarkMode');

      if (accountsData) {
        setAccounts(JSON.parse(accountsData));
      }
      if (categoriesData) {
        setCategories(JSON.parse(categoriesData));
      }
      if (transactionsData) {
        setTransactions(JSON.parse(transactionsData));
      }
      if (darkModeData) {
        setIsDarkMode(JSON.parse(darkModeData));
      }
    } catch (error) {
      console.error('Error loading data:', error);
    } finally {
      setIsLoading(false);
    }
  };

  const saveData = async () => {
    try {
      await AsyncStorage.setItem('accounts', JSON.stringify(accounts));
      await AsyncStorage.setItem('categories', JSON.stringify(categories));
      await AsyncStorage.setItem('transactions', JSON.stringify(transactions));
      await AsyncStorage.setItem('isDarkMode', JSON.stringify(isDarkMode));
    } catch (error) {
      console.error('Error saving data:', error);
    }
  };

  const addTransaction = (transaction) => {
    const newTransaction = {
      id: Date.now(),
      date: new Date().toLocaleString('si-LK', { 
        year: 'numeric', 
        month: '2-digit', 
        day: '2-digit',
        hour: '2-digit',
        minute: '2-digit'
      }),
      ...transaction
    };
    setTransactions([newTransaction, ...transactions]);
  };

  const updateTransaction = (id, updatedData) => {
    setTransactions(transactions.map(t => 
      t.id === id ? { ...t, ...updatedData } : t
    ));
  };

  const deleteTransaction = (id) => {
    setTransactions(transactions.filter(t => t.id !== id));
  };

  const renderScreen = () => {
    const screenProps = {
      accounts,
      setAccounts,
      transactions,
      addTransaction,
      updateTransaction,
      deleteTransaction,
      categories,
      setCategories,
      selectedBankAccount,
      setSelectedBankAccount,
      selectedCashAccount,
      setSelectedCashAccount,
      isDarkMode
    };

    switch(currentScreen) {
      case 'dashboard':
        return <DashboardScreen {...screenProps} />;
      case 'bank':
        return <BankScreen 
          accounts={accounts.bank} 
          allAccounts={accounts}
          setAccounts={setAccounts}
          addTransaction={addTransaction}
          isDarkMode={isDarkMode}
        />;
      case 'cash':
        return <CashScreen 
          accounts={accounts.cash} 
          allAccounts={accounts}
          setAccounts={setAccounts}
          addTransaction={addTransaction}
          isDarkMode={isDarkMode}
        />;
      case 'categories':
        return <CategoriesScreen 
          categories={categories} 
          setCategories={setCategories}
          isDarkMode={isDarkMode}
        />;
      case 'settings':
        return <SettingsScreen 
          accounts={accounts}
          setAccounts={setAccounts}
          categories={categories}
          setCategories={setCategories}
          transactions={transactions}
          setTransactions={setTransactions}
          isDarkMode={isDarkMode}
          setIsDarkMode={setIsDarkMode}
        />;
      default:
        return <DashboardScreen {...screenProps} />;
    }
  };

  const themedStyles = getThemedStyles(isDarkMode);

  return (
    <SafeAreaView style={[styles.container, themedStyles.container]}>
      <StatusBar 
        barStyle={isDarkMode ? "light-content" : "dark-content"} 
        backgroundColor={isDarkMode ? "#1E1B4B" : "#4F46E5"} 
      />
      
      {/* Main Content */}
      <View style={styles.content}>
        {renderScreen()}
      </View>

      {/* Bottom Navigation */}
      <View style={[styles.bottomNav, themedStyles.bottomNav]}>
        <TouchableOpacity 
          style={styles.navButton}
          onPress={() => setCurrentScreen('dashboard')}
        >
          <Text style={[styles.navIcon, currentScreen === 'dashboard' && styles.navIconActive]}>🏠</Text>
          <Text style={[styles.navLabel, currentScreen === 'dashboard' && styles.navLabelActive]}>Dashboard</Text>
        </TouchableOpacity>
        
        <TouchableOpacity 
          style={styles.navButton}
          onPress={() => setCurrentScreen('bank')}
        >
          <Text style={[styles.navIcon, currentScreen === 'bank' && styles.navIconActive]}>🏦</Text>
          <Text style={[styles.navLabel, currentScreen === 'bank' && styles.navLabelActive]}>Bank</Text>
        </TouchableOpacity>
        
        <TouchableOpacity 
          style={styles.navButton}
          onPress={() => setCurrentScreen('cash')}
        >
          <Text style={[styles.navIcon, currentScreen === 'cash' && styles.navIconActive]}>💵</Text>
          <Text style={[styles.navLabel, currentScreen === 'cash' && styles.navLabelActive]}>Cash</Text>
        </TouchableOpacity>
        
        <TouchableOpacity 
          style={styles.navButton}
          onPress={() => setCurrentScreen('categories')}
        >
          <Text style={[styles.navIcon, currentScreen === 'categories' && styles.navIconActive]}>📁</Text>
          <Text style={[styles.navLabel, currentScreen === 'categories' && styles.navLabelActive]}>Categories</Text>
        </TouchableOpacity>
        
        <TouchableOpacity 
          style={styles.navButton}
          onPress={() => setCurrentScreen('settings')}
        >
          <Text style={[styles.navIcon, currentScreen === 'settings' && styles.navIconActive]}>⚙️</Text>
          <Text style={[styles.navLabel, currentScreen === 'settings' && styles.navLabelActive]}>Settings</Text>
        </TouchableOpacity>
      </View>
    </SafeAreaView>
  );
}

// Dashboard Screen
function DashboardScreen({ accounts, setAccounts, transactions, addTransaction, updateTransaction, deleteTransaction, categories, setCategories, selectedBankAccount, setSelectedBankAccount, selectedCashAccount, setSelectedCashAccount, isDarkMode }) {
  const [showAddAccountModal, setShowAddAccountModal] = useState(false);
  const [showAddCashModal, setShowAddCashModal] = useState(false);
  const [showEditTransactionModal, setShowEditTransactionModal] = useState(false);
  const [editingTransaction, setEditingTransaction] = useState(null);
  const [showDepositModal, setShowDepositModal] = useState(false);
  const [showWithdrawalModal, setShowWithdrawalModal] = useState(false);
  const [showExpenseModal, setShowExpenseModal] = useState(false);
  
  const totalBankBalance = accounts.bank.reduce((sum, acc) => sum + acc.balance, 0);
  const totalCashBalance = accounts.cash.reduce((sum, acc) => sum + acc.balance, 0);
  const totalBalance = totalBankBalance + totalCashBalance;

  const themedStyles = getThemedStyles(isDarkMode);

  const handleEditTransaction = (transaction) => {
    setEditingTransaction(transaction);
    setShowEditTransactionModal(true);
  };

  const handleUpdateTransaction = (amount, date) => {
    if (editingTransaction) {
      const oldAmount = editingTransaction.amount;
      const newAmount = parseFloat(amount);
      const amountDifference = newAmount - oldAmount;

      if (editingTransaction.type === 'deposit') {
        const updatedBankAccounts = accounts.bank.map(acc =>
          acc.name === editingTransaction.accountName
            ? { ...acc, balance: acc.balance + amountDifference }
            : acc
        );
        setAccounts({ ...accounts, bank: updatedBankAccounts });
      } else if (editingTransaction.type === 'withdrawal') {
        const updatedBankAccounts = accounts.bank.map(acc =>
          acc.name === editingTransaction.accountName
            ? { ...acc, balance: acc.balance - amountDifference }
            : acc
        );
        const updatedCashAccounts = accounts.cash.map(acc =>
          acc.name === editingTransaction.toAccount
            ? { ...acc, balance: acc.balance + amountDifference }
            : acc
        );
        setAccounts({ bank: updatedBankAccounts, cash: updatedCashAccounts });
      } else if (editingTransaction.type === 'expense') {
        const updatedCashAccounts = accounts.cash.map(acc =>
          acc.name === editingTransaction.accountName
            ? { ...acc, balance: acc.balance - amountDifference }
            : acc
        );
        setAccounts({ ...accounts, cash: updatedCashAccounts });

        const updatedCategories = categories.map(cat =>
          cat.name === editingTransaction.categoryName
            ? { ...cat, spent: cat.spent + amountDifference }
            : cat
        );
        setCategories(updatedCategories);
      }

      updateTransaction(editingTransaction.id, { 
        amount: newAmount, 
        date 
      });
      setShowEditTransactionModal(false);
      setEditingTransaction(null);
      Alert.alert('සාර්ථකයි!', 'ගනුදෙනුව යාවත්කාලීන කරන ලදී');
    }
  };

  const handleDeleteTransaction = (transactionToDelete) => {
    Alert.alert(
      'තහවුරු කරන්න',
      'මෙම ගනුදෙනුව මකා දැමීමට අවශ්‍යද?',
      [
        { text: 'අවලංගු කරන්න', style: 'cancel' },
        { 
          text: 'මකන්න', 
          style: 'destructive',
          onPress: () => {
            if (transactionToDelete.type === 'deposit') {
              const updatedBankAccounts = accounts.bank.map(acc =>
                acc.name === transactionToDelete.accountName
                  ? { ...acc, balance: acc.balance - transactionToDelete.amount }
                  : acc
              );
              setAccounts({ ...accounts, bank: updatedBankAccounts });
            } else if (transactionToDelete.type === 'withdrawal') {
              const updatedBankAccounts = accounts.bank.map(acc =>
                acc.name === transactionToDelete.accountName
                  ? { ...acc, balance: acc.balance + transactionToDelete.amount }
                  : acc
              );
              const updatedCashAccounts = accounts.cash.map(acc =>
                acc.name === transactionToDelete.toAccount
                  ? { ...acc, balance: acc.balance - transactionToDelete.amount }
                  : acc
              );
              setAccounts({ bank: updatedBankAccounts, cash: updatedCashAccounts });
            } else if (transactionToDelete.type === 'expense') {
              const updatedCashAccounts = accounts.cash.map(acc =>
                acc.name === transactionToDelete.accountName
                  ? { ...acc, balance: acc.balance + transactionToDelete.amount }
                  : acc
              );
              setAccounts({ ...accounts, cash: updatedCashAccounts });

              const updatedCategories = categories.map(cat =>
                cat.name === transactionToDelete.categoryName
                  ? { ...cat, spent: cat.spent - transactionToDelete.amount }
                  : cat
              );
              setCategories(updatedCategories);
            }

            deleteTransaction(transactionToDelete.id);
            Alert.alert('සාර්ථකයි!', 'ගනුදෙනුව මකා දමන ලදී');
          }
        }
      ]
    );
  };

  const handleDeposit = (amount) => {
    if (!selectedBankAccount || !amount || parseFloat(amount) <= 0) {
      Alert.alert('දෝෂයකි', 'කරුණාකර බැංකු ගිණුම සහ වලංගු මුදලක් තෝරන්න');
      return;
    }

    const updatedBankAccounts = accounts.bank.map(acc =>
      acc.id === selectedBankAccount.id
        ? { ...acc, balance: acc.balance + parseFloat(amount) }
        : acc
    );

    setAccounts({ ...accounts, bank: updatedBankAccounts });
    
    // Update selectedBankAccount state
    setSelectedBankAccount(updatedBankAccounts.find(acc => acc.id === selectedBankAccount.id));
    
    addTransaction({
      type: 'deposit',
      amount: parseFloat(amount),
      description: `${selectedBankAccount.name} - තැන්පතු`,
      accountName: selectedBankAccount.name
    });

    setShowDepositModal(false);
    Alert.alert('සාර්ථකයි!', 'තැන්පතු සාර්ථකව එකතු කරන ලදී');
  };

  const handleWithdrawal = (amount) => {
    if (!selectedBankAccount || !selectedCashAccount || !amount || parseFloat(amount) <= 0) {
      Alert.alert('දෝෂයකි', 'කරුණාකර බැංකු ගිණුම, මුදල් ගිණුම සහ වලංගු මුදලක් තෝරන්න');
      return;
    }

    // Get current balance from accounts array
    const currentBankAccount = accounts.bank.find(acc => acc.id === selectedBankAccount.id);
    if (!currentBankAccount || currentBankAccount.balance < parseFloat(amount)) {
      Alert.alert('දෝෂයකි', `ප්‍රමාණවත් ශේෂයක් නොමැත. වත්මන් ශේෂය: රු ${currentBankAccount ? currentBankAccount.balance : 0}`);
      return;
    }

    const updatedBankAccounts = accounts.bank.map(acc =>
      acc.id === selectedBankAccount.id
        ? { ...acc, balance: acc.balance - parseFloat(amount) }
        : acc
    );

    const updatedCashAccounts = accounts.cash.map(acc =>
      acc.id === selectedCashAccount.id
        ? { ...acc, balance: acc.balance + parseFloat(amount) }
        : acc
    );

    setAccounts({
      bank: updatedBankAccounts,
      cash: updatedCashAccounts
    });
    
    // Update selectedBankAccount state
    setSelectedBankAccount(updatedBankAccounts.find(acc => acc.id === selectedBankAccount.id));
    setSelectedCashAccount(updatedCashAccounts.find(acc => acc.id === selectedCashAccount.id));
    
    addTransaction({
      type: 'withdrawal',
      amount: parseFloat(amount),
      description: `${selectedBankAccount.name} → ${selectedCashAccount.name}`,
      accountName: selectedBankAccount.name,
      toAccount: selectedCashAccount.name
    });

    setShowWithdrawalModal(false);
    Alert.alert('සාර්ථකයි!', 'මුදල් ලබා ගැනීම සාර්ථකයි');
  };

  const handleExpense = (amount, selectedCategory) => {
    if (!selectedCashAccount || !selectedCategory || !amount || parseFloat(amount) <= 0) {
      Alert.alert('දෝෂයකි', 'කරුණාකර මුදල් ගිණුම, කාණ්ඩය සහ වලංගු මුදලක් තෝරන්න');
      return;
    }

    // Get current balance from accounts array
    const currentCashAccount = accounts.cash.find(acc => acc.id === selectedCashAccount.id);
    if (!currentCashAccount || currentCashAccount.balance < parseFloat(amount)) {
      Alert.alert('දෝෂයකි', `ප්‍රමාණවත් ශේෂයක් නොමැත. වත්මන් ශේෂය: රු ${currentCashAccount ? currentCashAccount.balance : 0}`);
      return;
    }

    const updatedCashAccounts = accounts.cash.map(acc =>
      acc.id === selectedCashAccount.id
        ? { ...acc, balance: acc.balance - parseFloat(amount) }
        : acc
    );

    setAccounts({ ...accounts, cash: updatedCashAccounts });
    
    // Update selectedCashAccount state
    setSelectedCashAccount(updatedCashAccounts.find(acc => acc.id === selectedCashAccount.id));
    
    const updatedCategories = categories.map(cat =>
      cat.id === selectedCategory.id
        ? { ...cat, spent: cat.spent + parseFloat(amount) }
        : cat
    );
    setCategories(updatedCategories);
    
    addTransaction({
      type: 'expense',
      amount: parseFloat(amount),
      description: `${selectedCashAccount.name} - ${selectedCategory.name}`,
      accountName: selectedCashAccount.name,
      categoryName: selectedCategory.name
    });

    setShowExpenseModal(false);
    Alert.alert('සාර්ථකයි!', 'වියදම සාර්ථකව එකතු කරන ලදී');
  };

  return (
    <ScrollView style={[styles.screen, themedStyles.screen]} contentContainerStyle={styles.scrollContent}>
      {/* Header */}
      <View style={[styles.header, themedStyles.header]}>
        <Text style={styles.headerTitle}>Dashboard</Text>
        <Text style={styles.headerSubtitle}>Personal Finance Management</Text>
      </View>

      <View style={styles.padding}>
        {/* Total Balance Card */}
        <View style={[styles.balanceCard, themedStyles.card]}>
          <Text style={[styles.balanceLabel, themedStyles.secondaryText]}>සම්පූර්ණ ශේෂය</Text>
          <Text style={styles.balanceAmount}>රු {totalBalance.toLocaleString()}</Text>
        </View>

        {/* Account Cards Grid */}
        <View style={styles.grid2}>
          <View style={[styles.summaryCard, { backgroundColor: '#3B82F6' }]}>
            <Text style={styles.summaryLabel}>බැංකු ශේෂය</Text>
            <Text style={styles.summaryAmount}>රු {totalBankBalance.toLocaleString()}</Text>
          </View>
          <View style={[styles.summaryCard, { backgroundColor: '#10B981' }]}>
            <Text style={styles.summaryLabel}>මුදල් ශේෂය</Text>
            <Text style={styles.summaryAmount}>රු {totalCashBalance.toLocaleString()}</Text>
          </View>
        </View>

        {/* Accounts Info Section */}
        <View style={styles.section}>
          <View style={styles.sectionHeader}>
            <Text style={[styles.sectionTitle, themedStyles.text]}>ගිනුම් තොරතුරු</Text>
            <TouchableOpacity style={styles.addButton} onPress={() => setShowAddAccountModal(true)}>
              <Text style={styles.addButtonText}>+</Text>
            </TouchableOpacity>
          </View>

          {/* Bank Accounts */}
          <View style={styles.subsection}>
            <Text style={[styles.subsectionTitle, themedStyles.text]}>බැංකු ගිනුම්</Text>
            <View style={styles.grid2}>
              {accounts.bank.map((account, index) => (
                <TouchableOpacity 
                  key={account.id} 
                  style={[
                    styles.accountCard,
                    index === 0 ? styles.accountCardBlue : styles.accountCardGreen,
                    selectedBankAccount?.id === account.id && styles.accountCardSelected
                  ]}
                  onPress={() => setSelectedBankAccount(account)}
                >
                  {selectedBankAccount?.id === account.id && (
                    <View style={styles.checkMark}>
                      <Text style={styles.checkMarkText}>✓</Text>
                    </View>
                  )}
                  <Text style={styles.accountName}>{account.name}</Text>
                  <Text style={styles.accountNumber}>{account.number}</Text>
                  <Text style={styles.accountBalance}>රු {account.balance.toLocaleString()}</Text>
                </TouchableOpacity>
              ))}
            </View>
          </View>

          {/* Cash Accounts */}
          <View style={styles.subsection}>
            <View style={styles.sectionHeader}>
              <Text style={[styles.subsectionTitle, themedStyles.text]}>මුදල් ගිනුම්</Text>
              <TouchableOpacity style={styles.addButtonSmall} onPress={() => setShowAddCashModal(true)}>
                <Text style={styles.addButtonSmallText}>+</Text>
              </TouchableOpacity>
            </View>
            <View style={styles.grid2}>
              {accounts.cash.map((account, index) => (
                <TouchableOpacity 
                  key={account.id} 
                  style={[
                    styles.accountCard,
                    index === 0 ? styles.accountCardYellow : styles.accountCardRed,
                    selectedCashAccount?.id === account.id && styles.accountCardSelected
                  ]}
                  onPress={() => setSelectedCashAccount(account)}
                >
                  {selectedCashAccount?.id === account.id && (
                    <View style={styles.checkMark}>
                      <Text style={styles.checkMarkText}>✓</Text>
                    </View>
                  )}
                  <Text style={styles.accountName}>{account.name}</Text>
                  <Text style={styles.accountBalance}>රු {account.balance.toLocaleString()}</Text>
                </TouchableOpacity>
              ))}
            </View>
          </View>
        </View>

        {/* Main Action Buttons */}
        <View style={styles.section}>
          <TouchableOpacity 
            style={[styles.actionButton, { backgroundColor: '#4F46E5' }]} 
            onPress={() => setShowDepositModal(true)}
          >
            <Text style={styles.actionButtonIcon}>🏦</Text>
            <Text style={styles.actionButtonText}>බැංකු තැන්පතු</Text>
          </TouchableOpacity>

          <TouchableOpacity 
            style={[styles.actionButton, { backgroundColor: '#10B981' }]} 
            onPress={() => setShowWithdrawalModal(true)}
          >
            <Text style={styles.actionButtonIcon}>💵</Text>
            <Text style={styles.actionButtonText}>බැංකු Withdraw</Text>
          </TouchableOpacity>

          <TouchableOpacity 
            style={[styles.actionButton, { backgroundColor: '#EF4444' }]} 
            onPress={() => setShowExpenseModal(true)}
          >
            <Text style={styles.actionButtonIcon}>📉</Text>
            <Text style={styles.actionButtonText}>විදමී කරන්න</Text>
          </TouchableOpacity>
        </View>

        {/* Recent Transactions */}
        {transactions.length > 0 && (
          <View style={styles.section}>
            <Text style={[styles.sectionTitle, themedStyles.text]}>මෑතකාලීන ගණුදෙණු</Text>
            {transactions.slice(0, 10).map((transaction) => (
              <View key={transaction.id} style={[styles.transactionCard, themedStyles.card]}>
                <View style={styles.transactionMain}>
                  <Text style={[styles.transactionDate, themedStyles.secondaryText]}>{transaction.date}</Text>
                  <Text style={[
                    styles.transactionAmount,
                    transaction.type === 'deposit' && styles.transactionAmountGreen,
                    transaction.type === 'withdrawal' && styles.transactionAmountRed,
                    transaction.type === 'expense' && styles.transactionAmountOrange
                  ]}>
                    {transaction.type === 'deposit' ? '+' : '-'}රු {transaction.amount.toLocaleString()}
                  </Text>
                </View>
                <Text style={[styles.transactionDescription, themedStyles.text]}>{transaction.description}</Text>
                <View style={styles.transactionActions}>
                  <TouchableOpacity onPress={() => handleEditTransaction(transaction)}>
                    <Text style={styles.transactionEdit}>✏️ සංස්කරණය</Text>
                  </TouchableOpacity>
                  <TouchableOpacity onPress={() => handleDeleteTransaction(transaction)}>
                    <Text style={styles.transactionDelete}>🗑️ මකන්න</Text>
                  </TouchableOpacity>
                </View>
              </View>
            ))}
          </View>
        )}
      </View>

      {/* Add Bank Account Modal */}
      <AddBankAccountModal 
        visible={showAddAccountModal}
        onClose={() => setShowAddAccountModal(false)}
        accounts={accounts}
        setAccounts={setAccounts}
        isDarkMode={isDarkMode}
      />

      {/* Add Cash Account Modal */}
      <AddCashAccountModal 
        visible={showAddCashModal}
        onClose={() => setShowAddCashModal(false)}
        accounts={accounts}
        setAccounts={setAccounts}
        isDarkMode={isDarkMode}
      />

      {/* Edit Transaction Modal */}
      {editingTransaction && (
        <EditTransactionModal 
          visible={showEditTransactionModal}
          onClose={() => {
            setShowEditTransactionModal(false);
            setEditingTransaction(null);
          }}
          transaction={editingTransaction}
          onSave={handleUpdateTransaction}
          isDarkMode={isDarkMode}
        />
      )}

      {/* Deposit Modal */}
      <DepositModal
        visible={showDepositModal}
        onClose={() => setShowDepositModal(false)}
        onSave={handleDeposit}
        selectedAccount={selectedBankAccount}
        isDarkMode={isDarkMode}
      />

      {/* Withdrawal Modal */}
      <WithdrawalModal
        visible={showWithdrawalModal}
        onClose={() => setShowWithdrawalModal(false)}
        onSave={handleWithdrawal}
        selectedBankAccount={selectedBankAccount}
        selectedCashAccount={selectedCashAccount}
        isDarkMode={isDarkMode}
      />

      {/* Expense Modal */}
      <ExpenseModal
        visible={showExpenseModal}
        onClose={() => setShowExpenseModal(false)}
        onSave={handleExpense}
        selectedAccount={selectedCashAccount}
        categories={categories}
        isDarkMode={isDarkMode}
      />
    </ScrollView>
  );
}

// Add Bank Account Modal
function AddBankAccountModal({ visible, onClose, accounts, setAccounts, isDarkMode }) {
  const [name, setName] = useState('');
  const [number, setNumber] = useState('');
  const [type, setType] = useState('ඉතුරුම්');

  const themedStyles = getThemedStyles(isDarkMode);

  const handleAdd = () => {
    if (!name || !number) {
      Alert.alert('දෝෂයකි', 'කරුණාකර සියලු තොරතුරු ඇතුළත් කරන්න');
      return;
    }

    const newAccount = {
      id: Date.now(),
      name,
      number,
      type,
      balance: 0,
      category: "පුබාන මුදල්"
    };

    setAccounts({
      ...accounts,
      bank: [...accounts.bank, newAccount]
    });

    setName('');
    setNumber('');
    setType('ඉතුරුම්');
    onClose();
    Alert.alert('සාර්ථකයි!', 'බැංකු ගිණුම එකතු කරන ලදී');
  };

  return (
    <Modal visible={visible} transparent animationType="slide">
      <View style={styles.modalOverlay}>
        <View style={[styles.modalContent, themedStyles.card]}>
          <Text style={[styles.modalTitle, themedStyles.text]}>නව බැංකු ගිණුම එකතු කරන්න</Text>
          
          <TextInput
            style={[styles.input, themedStyles.input]}
            placeholder="බැංකු නම"
            placeholderTextColor={isDarkMode ? '#9CA3AF' : '#6B7280'}
            value={name}
            onChangeText={setName}
          />
          
          <TextInput
            style={[styles.input, themedStyles.input]}
            placeholder="ගිණුම් අංකය"
            placeholderTextColor={isDarkMode ? '#9CA3AF' : '#6B7280'}
            value={number}
            onChangeText={setNumber}
            keyboardType="numeric"
          />

          <View style={styles.modalButtons}>
            <TouchableOpacity style={[styles.modalButtonCancel, themedStyles.modalButtonCancel]} onPress={onClose}>
              <Text style={[styles.modalButtonCancelText, themedStyles.text]}>අවලංගු කරන්න</Text>
            </TouchableOpacity>
            <TouchableOpacity style={styles.modalButtonSave} onPress={handleAdd}>
              <Text style={styles.modalButtonSaveText}>එකතු කරන්න</Text>
            </TouchableOpacity>
          </View>
        </View>
      </View>
    </Modal>
  );
}

// Add Cash Account Modal
function AddCashAccountModal({ visible, onClose, accounts, setAccounts, isDarkMode }) {
  const [name, setName] = useState('');

  const themedStyles = getThemedStyles(isDarkMode);

  const handleAdd = () => {
    if (!name) {
      Alert.alert('දෝෂයකි', 'කරුණාකර ගිණුම් නම ඇතුළත් කරන්න');
      return;
    }

    const newAccount = {
      id: Date.now(),
      name,
      balance: 0
    };

    setAccounts({
      ...accounts,
      cash: [...accounts.cash, newAccount]
    });

    setName('');
    onClose();
    Alert.alert('සාර්ථකයි!', 'මුදල් ගිණුම එකතු කරන ලදී');
  };

  return (
    <Modal visible={visible} transparent animationType="slide">
      <View style={styles.modalOverlay}>
        <View style={[styles.modalContent, themedStyles.card]}>
          <Text style={[styles.modalTitle, themedStyles.text]}>නව මුදල් ගිණුම එකතු කරන්න</Text>
          
          <TextInput
            style={[styles.input, themedStyles.input]}
            placeholder="ගිණුම් නම"
            placeholderTextColor={isDarkMode ? '#9CA3AF' : '#6B7280'}
            value={name}
            onChangeText={setName}
          />

          <View style={styles.modalButtons}>
            <TouchableOpacity style={[styles.modalButtonCancel, themedStyles.modalButtonCancel]} onPress={onClose}>
              <Text style={[styles.modalButtonCancelText, themedStyles.text]}>අවලංගු කරන්න</Text>
            </TouchableOpacity>
            <TouchableOpacity style={styles.modalButtonSave} onPress={handleAdd}>
              <Text style={styles.modalButtonSaveText}>එකතු කරන්න</Text>
            </TouchableOpacity>
          </View>
        </View>
      </View>
    </Modal>
  );
}

// Edit Transaction Modal
function EditTransactionModal({ visible, onClose, transaction, onSave, isDarkMode }) {
  const [amount, setAmount] = useState(transaction.amount.toString());
  const [date, setDate] = useState(transaction.date);

  const themedStyles = getThemedStyles(isDarkMode);

  const handleSave = () => {
    if (!amount || parseFloat(amount) <= 0) {
      Alert.alert('දෝෂයකි', 'කරුණාකර වලංගු මුදලක් ඇතුළත් කරන්න');
      return;
    }

    onSave(amount, date);
  };

  return (
    <Modal visible={visible} transparent animationType="slide">
      <View style={styles.modalOverlay}>
        <View style={[styles.modalContent, themedStyles.card]}>
          <Text style={[styles.modalTitle, themedStyles.text]}>ගනුදෙනුව සංස්කරණය කරන්න</Text>
          
          <TextInput
            style={[styles.input, themedStyles.input]}
            placeholder="මුදල"
            placeholderTextColor={isDarkMode ? '#9CA3AF' : '#6B7280'}
            value={amount}
            onChangeText={setAmount}
            keyboardType="numeric"
          />
          
          <TextInput
            style={[styles.input, themedStyles.input]}
            placeholder="දිනය"
            placeholderTextColor={isDarkMode ? '#9CA3AF' : '#6B7280'}
            value={date}
            onChangeText={setDate}
          />

          <View style={styles.modalButtons}>
            <TouchableOpacity style={[styles.modalButtonCancel, themedStyles.modalButtonCancel]} onPress={onClose}>
              <Text style={[styles.modalButtonCancelText, themedStyles.text]}>අවලංගු කරන්න</Text>
            </TouchableOpacity>
            <TouchableOpacity style={styles.modalButtonSave} onPress={handleSave}>
              <Text style={styles.modalButtonSaveText}>සුරකින්න</Text>
            </TouchableOpacity>
          </View>
        </View>
      </View>
    </Modal>
  );
}

// Deposit Modal
function DepositModal({ visible, onClose, onSave, selectedAccount, isDarkMode }) {
  const [amount, setAmount] = useState('');

  const themedStyles = getThemedStyles(isDarkMode);

  const handleSave = () => {
    onSave(amount);
    setAmount('');
  };

  return (
    <Modal visible={visible} transparent animationType="slide">
      <View style={styles.modalOverlay}>
        <View style={[styles.modalContent, themedStyles.card]}>
          <Text style={[styles.modalTitle, themedStyles.text]}>බැංකු තැන්පතු</Text>
          
          {selectedAccount && (
            <Text style={[styles.modalSubtitle, themedStyles.secondaryText]}>
              ගිණුම: {selectedAccount.name}
            </Text>
          )}
          
          <TextInput
            style={[styles.input, themedStyles.input]}
            placeholder="මුදල"
            placeholderTextColor={isDarkMode ? '#9CA3AF' : '#6B7280'}
            value={amount}
            onChangeText={setAmount}
            keyboardType="numeric"
          />

          <View style={styles.modalButtons}>
            <TouchableOpacity style={[styles.modalButtonCancel, themedStyles.modalButtonCancel]} onPress={() => {
              setAmount('');
              onClose();
            }}>
              <Text style={[styles.modalButtonCancelText, themedStyles.text]}>අවලංගු කරන්න</Text>
            </TouchableOpacity>
            <TouchableOpacity style={styles.modalButtonSave} onPress={handleSave}>
              <Text style={styles.modalButtonSaveText}>තැන්පතු කරන්න</Text>
            </TouchableOpacity>
          </View>
        </View>
      </View>
    </Modal>
  );
}

// Withdrawal Modal
function WithdrawalModal({ visible, onClose, onSave, selectedBankAccount, selectedCashAccount, isDarkMode }) {
  const [amount, setAmount] = useState('');

  const themedStyles = getThemedStyles(isDarkMode);

  const handleSave = () => {
    onSave(amount);
    setAmount('');
  };

  return (
    <Modal visible={visible} transparent animationType="slide">
      <View style={styles.modalOverlay}>
        <View style={[styles.modalContent, themedStyles.card]}>
          <Text style={[styles.modalTitle, themedStyles.text]}>බැංකු Withdraw</Text>
          
          {selectedBankAccount && (
            <Text style={[styles.modalSubtitle, themedStyles.secondaryText]}>
              බැංකු ගිණුම: {selectedBankAccount.name}
            </Text>
          )}
          
          {selectedCashAccount && (
            <Text style={[styles.modalSubtitle, themedStyles.secondaryText]}>
              මුදල් ගිණුම: {selectedCashAccount.name}
            </Text>
          )}
          
          <TextInput
            style={[styles.input, themedStyles.input]}
            placeholder="මුදල"
            placeholderTextColor={isDarkMode ? '#9CA3AF' : '#6B7280'}
            value={amount}
            onChangeText={setAmount}
            keyboardType="numeric"
          />

          <View style={styles.modalButtons}>
            <TouchableOpacity style={[styles.modalButtonCancel, themedStyles.modalButtonCancel]} onPress={() => {
              setAmount('');
              onClose();
            }}>
              <Text style={[styles.modalButtonCancelText, themedStyles.text]}>අවලංගු කරන්න</Text>
            </TouchableOpacity>
            <TouchableOpacity style={styles.modalButtonSave} onPress={handleSave}>
              <Text style={styles.modalButtonSaveText}>ලබා ගන්න</Text>
            </TouchableOpacity>
          </View>
        </View>
      </View>
    </Modal>
  );
}

// Expense Modal
function ExpenseModal({ visible, onClose, onSave, selectedAccount, categories, isDarkMode }) {
  const [amount, setAmount] = useState('');
  const [selectedCategory, setSelectedCategory] = useState(null);
  const [showCategoryPicker, setShowCategoryPicker] = useState(false);

  const themedStyles = getThemedStyles(isDarkMode);

  const handleSave = () => {
    onSave(amount, selectedCategory);
    setAmount('');
    setSelectedCategory(null);
  };

  return (
    <Modal visible={visible} transparent animationType="slide">
      <View style={styles.modalOverlay}>
        <View style={[styles.modalContent, themedStyles.card]}>
          <Text style={[styles.modalTitle, themedStyles.text]}>විදමී කරන්න</Text>
          
          {selectedAccount && (
            <Text style={[styles.modalSubtitle, themedStyles.secondaryText]}>
              මුදල් ගිණුම: {selectedAccount.name}
            </Text>
          )}
          
          <TouchableOpacity 
            style={[styles.pickerButton, themedStyles.input]} 
            onPress={() => setShowCategoryPicker(!showCategoryPicker)}
          >
            <Text style={[styles.pickerButtonText, themedStyles.text]}>
              {selectedCategory ? selectedCategory.name : 'කාණ්ඩය තෝරන්න'}
            </Text>
          </TouchableOpacity>

          {showCategoryPicker && (
            <View style={[styles.pickerList, themedStyles.card]}>
              {categories.map((cat) => (
                <TouchableOpacity
                  key={cat.id}
                  style={styles.pickerItem}
                  onPress={() => {
                    setSelectedCategory(cat);
                    setShowCategoryPicker(false);
                  }}
                >
                  <Text style={[styles.pickerItemText, themedStyles.text]}>{cat.name}</Text>
                </TouchableOpacity>
              ))}
            </View>
          )}
          
          <TextInput
            style={[styles.input, themedStyles.input]}
            placeholder="මුදල"
            placeholderTextColor={isDarkMode ? '#9CA3AF' : '#6B7280'}
            value={amount}
            onChangeText={setAmount}
            keyboardType="numeric"
          />

          <View style={styles.modalButtons}>
            <TouchableOpacity style={[styles.modalButtonCancel, themedStyles.modalButtonCancel]} onPress={() => {
              setAmount('');
              setSelectedCategory(null);
              onClose();
            }}>
              <Text style={[styles.modalButtonCancelText, themedStyles.text]}>අවලංගු කරන්න</Text>
            </TouchableOpacity>
            <TouchableOpacity style={styles.modalButtonSave} onPress={handleSave}>
              <Text style={styles.modalButtonSaveText}>එකතු කරන්න</Text>
            </TouchableOpacity>
          </View>
        </View>
      </View>
    </Modal>
  );
}

// Bank Screen
function BankScreen({ accounts, allAccounts, setAccounts, addTransaction, isDarkMode }) {
  const [showEditModal, setShowEditModal] = useState(false);
  const [editingAccount, setEditingAccount] = useState(null);

  const totalBalance = accounts.reduce((sum, acc) => sum + acc.balance, 0);
  const themedStyles = getThemedStyles(isDarkMode);

  const handleEdit = (account) => {
    setEditingAccount(account);
    setShowEditModal(true);
  };

  const handleDelete = (accountId) => {
    Alert.alert(
      'තහවුරු කරන්න',
      'මෙම ගිණුම මකා දැමීමට අවශ්‍යද?',
      [
        { text: 'අවලංගු කරන්න', style: 'cancel' },
        { 
          text: 'මකන්න', 
          style: 'destructive',
          onPress: () => {
            setAccounts({
              ...allAccounts,
              bank: allAccounts.bank.filter(acc => acc.id !== accountId)
            });
            Alert.alert('සාර්ථකයි!', 'ගිණුම මකා දමන ලදී');
          }
        }
      ]
    );
  };

  return (
    <ScrollView style={[styles.screen, themedStyles.screen]} contentContainerStyle={styles.scrollContent}>
      <View style={[styles.header, themedStyles.header]}>
        <Text style={styles.headerTitle}>Bank Accounts</Text>
      </View>

      <View style={styles.padding}>
        <View style={[styles.balanceCard, themedStyles.card]}>
          <Text style={[styles.balanceLabel, themedStyles.secondaryText]}>සම්පූර්ණ බැංකු ශේෂය</Text>
          <Text style={styles.balanceAmount}>රු {totalBalance.toLocaleString()}</Text>
          <Text style={[styles.balanceSubtext, themedStyles.secondaryText]}>{accounts.length} ගිණුම් වලින්</Text>
        </View>

        {accounts.map((account) => (
          <View key={account.id} style={[styles.accountListCard, themedStyles.card]}>
            <View style={styles.accountListHeader}>
              <Text style={[styles.accountListName, themedStyles.text]}>{account.name}</Text>
              <View style={styles.accountListActions}>
                <TouchableOpacity onPress={() => handleEdit(account)}>
                  <Text style={styles.actionButton}>✏️</Text>
                </TouchableOpacity>
                <TouchableOpacity onPress={() => handleDelete(account.id)}>
                  <Text style={styles.actionButtonDelete}>🗑️</Text>
                </TouchableOpacity>
              </View>
            </View>
            <Text style={[styles.accountListDetail, themedStyles.secondaryText]}>ගිණුම් අංකය: {account.number}</Text>
            <Text style={[styles.accountListDetail, themedStyles.secondaryText]}>වර්ගය: {account.type}</Text>
            <Text style={[styles.accountListBalance, themedStyles.text]}>ශේෂය: රු {account.balance.toLocaleString()}</Text>
          </View>
        ))}
      </View>

      {editingAccount && (
        <EditBankAccountModal
          visible={showEditModal}
          onClose={() => {
            setShowEditModal(false);
            setEditingAccount(null);
          }}
          account={editingAccount}
          accounts={allAccounts}
          setAccounts={setAccounts}
          isDarkMode={isDarkMode}
        />
      )}
    </ScrollView>
  );
}

// Edit Bank Account Modal
function EditBankAccountModal({ visible, onClose, account, accounts, setAccounts, isDarkMode }) {
  const [name, setName] = useState(account.name);
  const [number, setNumber] = useState(account.number);

  const themedStyles = getThemedStyles(isDarkMode);

  const handleSave = () => {
    if (!name || !number) {
      Alert.alert('දෝෂයකි', 'කරුණාකර සියලු තොරතුරු ඇතුළත් කරන්න');
      return;
    }

    setAccounts({
      ...accounts,
      bank: accounts.bank.map(acc => 
        acc.id === account.id ? { ...acc, name, number } : acc
      )
    });

    onClose();
    Alert.alert('සාර්ථකයි!', 'ගිණුම යාවත්කාලීන කරන ලදී');
  };

  return (
    <Modal visible={visible} transparent animationType="slide">
      <View style={styles.modalOverlay}>
        <View style={[styles.modalContent, themedStyles.card]}>
          <Text style={[styles.modalTitle, themedStyles.text]}>ගිණුම සංස්කරණය කරන්න</Text>
          
          <TextInput
            style={[styles.input, themedStyles.input]}
            placeholder="බැංකු නම"
            placeholderTextColor={isDarkMode ? '#9CA3AF' : '#6B7280'}
            value={name}
            onChangeText={setName}
          />
          
          <TextInput
            style={[styles.input, themedStyles.input]}
            placeholder="ගිණුම් අංකය"
            placeholderTextColor={isDarkMode ? '#9CA3AF' : '#6B7280'}
            value={number}
            onChangeText={setNumber}
            keyboardType="numeric"
          />

          <View style={styles.modalButtons}>
            <TouchableOpacity style={[styles.modalButtonCancel, themedStyles.modalButtonCancel]} onPress={onClose}>
              <Text style={[styles.modalButtonCancelText, themedStyles.text]}>අවලංගු කරන්න</Text>
            </TouchableOpacity>
            <TouchableOpacity style={styles.modalButtonSave} onPress={handleSave}>
              <Text style={styles.modalButtonSaveText}>සුරකින්න</Text>
            </TouchableOpacity>
          </View>
        </View>
      </View>
    </Modal>
  );
}

// Cash Screen
function CashScreen({ accounts, allAccounts, setAccounts, isDarkMode }) {
  const [showEditModal, setShowEditModal] = useState(false);
  const [editingAccount, setEditingAccount] = useState(null);

  const totalBalance = accounts.reduce((sum, acc) => sum + acc.balance, 0);
  const themedStyles = getThemedStyles(isDarkMode);

  const handleEdit = (account) => {
    setEditingAccount(account);
    setShowEditModal(true);
  };

  const handleDelete = (accountId) => {
    Alert.alert(
      'තහවුරු කරන්න',
      'මෙම ගිණුම මකා දැමීමට අවශ්‍යද?',
      [
        { text: 'අවලංගු කරන්න', style: 'cancel' },
        { 
          text: 'මකන්න', 
          style: 'destructive',
          onPress: () => {
            setAccounts({
              ...allAccounts,
              cash: allAccounts.cash.filter(acc => acc.id !== accountId)
            });
            Alert.alert('සාර්ථකයි!', 'ගිණුම මකා දමන ලදී');
          }
        }
      ]
    );
  };

  return (
    <ScrollView style={[styles.screen, themedStyles.screen]} contentContainerStyle={styles.scrollContent}>
      <View style={[styles.header, themedStyles.header]}>
        <Text style={styles.headerTitle}>Cash Accounts</Text>
      </View>

      <View style={styles.padding}>
        <View style={[styles.balanceCard, themedStyles.card]}>
          <Text style={[styles.balanceLabel, themedStyles.secondaryText]}>සම්පූර්ණ මුදල් ශේෂය</Text>
          <Text style={[styles.balanceAmount, { color: '#10B981' }]}>රු {totalBalance.toLocaleString()}</Text>
          <Text style={[styles.balanceSubtext, themedStyles.secondaryText]}>{accounts.length} ගිණුම් වලින්</Text>
        </View>

        {accounts.map((account, index) => (
          <View key={account.id} style={[
            styles.accountListCard,
            themedStyles.card,
            { borderLeftColor: index === 0 ? '#EAB308' : '#EF4444', borderLeftWidth: 4 }
          ]}>
            <View style={styles.accountListHeader}>
              <Text style={[styles.accountListName, themedStyles.text]}>{account.name}</Text>
              <View style={styles.accountListActions}>
                <TouchableOpacity onPress={() => handleEdit(account)}>
                  <Text style={styles.actionButton}>✏️</Text>
                </TouchableOpacity>
                <TouchableOpacity onPress={() => handleDelete(account.id)}>
                  <Text style={styles.actionButtonDelete}>🗑️</Text>
                </TouchableOpacity>
              </View>
            </View>
            <Text style={[
              styles.accountListBalance,
              { color: index === 0 ? '#EAB308' : '#EF4444' }
            ]}>ශේෂය: රු {account.balance.toLocaleString()}</Text>
          </View>
        ))}
      </View>

      {editingAccount && (
        <EditCashAccountModal
          visible={showEditModal}
          onClose={() => {
            setShowEditModal(false);
            setEditingAccount(null);
          }}
          account={editingAccount}
          accounts={allAccounts}
          setAccounts={setAccounts}
          isDarkMode={isDarkMode}
        />
      )}
    </ScrollView>
  );
}

// Edit Cash Account Modal
function EditCashAccountModal({ visible, onClose, account, accounts, setAccounts, isDarkMode }) {
  const [name, setName] = useState(account.name);

  const themedStyles = getThemedStyles(isDarkMode);

  const handleSave = () => {
    if (!name) {
      Alert.alert('දෝෂයකි', 'කරුණාකර ගිණුම් නම ඇතුළත් කරන්න');
      return;
    }

    setAccounts({
      ...accounts,
      cash: accounts.cash.map(acc => 
        acc.id === account.id ? { ...acc, name } : acc
      )
    });

    onClose();
    Alert.alert('සාර්ථකයි!', 'ගිණුම යාවත්කාලීන කරන ලදී');
  };

  return (
    <Modal visible={visible} transparent animationType="slide">
      <View style={styles.modalOverlay}>
        <View style={[styles.modalContent, themedStyles.card]}>
          <Text style={[styles.modalTitle, themedStyles.text]}>ගිණුම සංස්කරණය කරන්න</Text>
          
          <TextInput
            style={[styles.input, themedStyles.input]}
            placeholder="ගිණුම් නම"
            placeholderTextColor={isDarkMode ? '#9CA3AF' : '#6B7280'}
            value={name}
            onChangeText={setName}
          />

          <View style={styles.modalButtons}>
            <TouchableOpacity style={[styles.modalButtonCancel, themedStyles.modalButtonCancel]} onPress={onClose}>
              <Text style={[styles.modalButtonCancelText, themedStyles.text]}>අවලංගු කරන්න</Text>
            </TouchableOpacity>
            <TouchableOpacity style={styles.modalButtonSave} onPress={handleSave}>
              <Text style={styles.modalButtonSaveText}>සුරකින්න</Text>
            </TouchableOpacity>
          </View>
        </View>
      </View>
    </Modal>
  );
}

// Categories Screen
function CategoriesScreen({ categories, setCategories, isDarkMode }) {
  const [name, setName] = useState('');
  const [budget, setBudget] = useState('');
  const [showEditModal, setShowEditModal] = useState(false);
  const [editingCategory, setEditingCategory] = useState(null);

  const themedStyles = getThemedStyles(isDarkMode);

  const handleAdd = () => {
    if (!name) {
      Alert.alert('දෝෂයකි', 'කරුණාකර කාණ්ඩ නම ඇතුළත් කරන්න');
      return;
    }

    const newCategory = {
      id: Date.now(),
      name,
      budget: parseFloat(budget) || 0,
      spent: 0
    };

    setCategories([...categories, newCategory]);
    setName('');
    setBudget('');
    Alert.alert('සාර්ථකයි!', 'කාණ්ඩය එකතු කරන ලදී');
  };

  const handleEdit = (category) => {
    setEditingCategory(category);
    setShowEditModal(true);
  };

  const handleDelete = (categoryId) => {
    Alert.alert(
      'තහවුරු කරන්න',
      'මෙම කාණ්ඩය මකා දැමීමට අවශ්‍යද?',
      [
        { text: 'අවලංගු කරන්න', style: 'cancel' },
        { 
          text: 'මකන්න', 
          style: 'destructive',
          onPress: () => {
            setCategories(categories.filter(cat => cat.id !== categoryId));
            Alert.alert('සාර්ථකයි!', 'කාණ්ඩය මකා දමන ලදී');
          }
        }
      ]
    );
  };

  return (
    <ScrollView style={[styles.screen, themedStyles.screen]} contentContainerStyle={styles.scrollContent}>
      <View style={[styles.header, themedStyles.header]}>
        <Text style={styles.headerTitle}>Expenses Categories</Text>
        <Text style={styles.headerSubtitle}>Manage categories used in expenses</Text>
      </View>

      <View style={styles.padding}>
        <View style={[styles.card, themedStyles.card]}>
          <Text style={[styles.cardTitle, themedStyles.text]}>නව කාණ්ඩයක් එක් කරන්න</Text>
          
          <TextInput
            style={[styles.input, themedStyles.input]}
            placeholder="නාමය (උදා: කෑම)"
            placeholderTextColor={isDarkMode ? '#9CA3AF' : '#6B7280'}
            value={name}
            onChangeText={setName}
          />
          
          <TextInput
            style={[styles.input, themedStyles.input]}
            placeholder="ඉලක්කය (රු)"
            placeholderTextColor={isDarkMode ? '#9CA3AF' : '#6B7280'}
            value={budget}
            onChangeText={setBudget}
            keyboardType="numeric"
          />
          
          <TouchableOpacity style={styles.button} onPress={handleAdd}>
            <Text style={styles.buttonText}>එක් කරන්න</Text>
          </TouchableOpacity>
        </View>

        <Text style={[styles.sectionTitle, themedStyles.text]}>කාණ්ඩික ලැයිස්තුව</Text>
        
        {categories.map((category) => (
          <View key={category.id} style={[styles.categoryCard, themedStyles.card]}>
            <View style={styles.categoryHeader}>
              <Text style={[styles.categoryName, themedStyles.text]}>{category.name}</Text>
              <View style={styles.accountListActions}>
                <TouchableOpacity onPress={() => handleEdit(category)}>
                  <Text style={styles.actionButton}>✏️</Text>
                </TouchableOpacity>
                <TouchableOpacity onPress={() => handleDelete(category.id)}>
                  <Text style={styles.actionButtonDelete}>🗑️</Text>
                </TouchableOpacity>
              </View>
            </View>
            <Text style={[styles.categoryDetail, themedStyles.secondaryText]}>
              Target: රු {category.budget.toLocaleString()} • Spent: රු {category.spent.toLocaleString()}
            </Text>
            {category.budget > 0 && (
              <View style={styles.progressBar}>
                <View 
                  style={[
                    styles.progressFill, 
                    { width: `${Math.min((category.spent / category.budget) * 100, 100)}%` }
                  ]} 
                />
              </View>
            )}
          </View>
        ))}
      </View>

      {editingCategory && (
        <EditCategoryModal
          visible={showEditModal}
          onClose={() => {
            setShowEditModal(false);
            setEditingCategory(null);
          }}
          category={editingCategory}
          categories={categories}
          setCategories={setCategories}
          isDarkMode={isDarkMode}
        />
      )}
    </ScrollView>
  );
}

// Edit Category Modal
function EditCategoryModal({ visible, onClose, category, categories, setCategories, isDarkMode }) {
  const [name, setName] = useState(category.name);
  const [budget, setBudget] = useState(category.budget.toString());

  const themedStyles = getThemedStyles(isDarkMode);

  const handleSave = () => {
    if (!name) {
      Alert.alert('දෝෂයකි', 'කරුණාකර කාණ්ඩ නම ඇතුළත් කරන්න');
      return;
    }

    setCategories(categories.map(cat => 
      cat.id === category.id ? { ...cat, name, budget: parseFloat(budget) || 0 } : cat
    ));

    onClose();
    Alert.alert('සාර්ථකයි!', 'කාණ්ඩය යාවත්කාලීන කරන ලදී');
  };

  return (
    <Modal visible={visible} transparent animationType="slide">
      <View style={styles.modalOverlay}>
        <View style={[styles.modalContent, themedStyles.card]}>
          <Text style={[styles.modalTitle, themedStyles.text]}>කාණ්ඩය සංස්කරණය කරන්න</Text>
          
          <TextInput
            style={[styles.input, themedStyles.input]}
            placeholder="නාමය"
            placeholderTextColor={isDarkMode ? '#9CA3AF' : '#6B7280'}
            value={name}
            onChangeText={setName}
          />
          
          <TextInput
            style={[styles.input, themedStyles.input]}
            placeholder="ඉලක්කය (රු)"
            placeholderTextColor={isDarkMode ? '#9CA3AF' : '#6B7280'}
            value={budget}
            onChangeText={setBudget}
            keyboardType="numeric"
          />

          <View style={styles.modalButtons}>
            <TouchableOpacity style={[styles.modalButtonCancel, themedStyles.modalButtonCancel]} onPress={onClose}>
              <Text style={[styles.modalButtonCancelText, themedStyles.text]}>අවලංගු කරන්න</Text>
            </TouchableOpacity>
            <TouchableOpacity style={styles.modalButtonSave} onPress={handleSave}>
              <Text style={styles.modalButtonSaveText}>සුරකින්න</Text>
            </TouchableOpacity>
          </View>
        </View>
      </View>
    </Modal>
  );
}

// Settings Screen
function SettingsScreen({ accounts, setAccounts, categories, setCategories, transactions, setTransactions, isDarkMode, setIsDarkMode }) {
  const themedStyles = getThemedStyles(isDarkMode);
  const importData = async () => {
    Alert.alert(
      'දත්ත Import කරන්න',
      'Import කිරීමට JSON file එකක් select කරන්න අවශ්‍යයි. දැනට file picker සහාය නොමැත. Export කළ file එක manually open කරලා data copy කරන්න.',
      [{ text: 'හරි' }]
    );
    // Note: For now, we'll use the export/import through share functionality
  };

  const toggleDarkMode = async () => {
    setIsDarkMode(!isDarkMode);
    Alert.alert('සාර්ථකයි!', isDarkMode ? 'Light mode enabled' : 'Dark mode enabled');
  };

  const exportData = async () => {
    try {
      const data = {
        accounts,
        categories,
        transactions,
        exportDate: new Date().toISOString(),
        appVersion: '3.2.0'
      };
      
      const jsonData = JSON.stringify(data, null, 2);
      const filename = `mudal_backup_${new Date().getTime()}.json`;
      const fileUri = FileSystem.cacheDirectory + filename;
      
      await FileSystem.writeAsStringAsync(fileUri, jsonData, {
        encoding: 'utf8'
      });
      
      const fileInfo = await FileSystem.getInfoAsync(fileUri);
      if (!fileInfo.exists) {
        Alert.alert('දෝෂයකි', 'File create කිරීමේදී දෝෂයක් සිදු විය');
        return;
      }
      
      const isAvailable = await Sharing.isAvailableAsync();
      if (isAvailable) {
        await Sharing.shareAsync(fileUri, {
          mimeType: 'application/json',
          dialogTitle: 'දත්ත Backup කරන්න',
          UTI: 'public.json'
        });
      } else {
        Alert.alert('දෝෂයකි', 'Sharing සහාය නොමැත');
      }
    } catch (error) {
      Alert.alert('දෝෂයකි', `Export error: ${error.message}`);
      console.error('Export error:', error);
    }
  };

  const generateMonthlyReport = async () => {
    try {
      const now = new Date();
      const month = now.toLocaleString('si-LK', { month: 'long' });
      const year = now.getFullYear();
      
      const totalIncome = transactions
        .filter(t => t.type === 'deposit')
        .reduce((sum, t) => sum + t.amount, 0);
      
      const totalExpenses = transactions
        .filter(t => t.type === 'expense')
        .reduce((sum, t) => sum + t.amount, 0);
      
      const totalBankBalance = accounts.bank.reduce((sum, acc) => sum + acc.balance, 0);
      const totalCashBalance = accounts.cash.reduce((sum, acc) => sum + acc.balance, 0);
      
      const html = `
<!DOCTYPE html>
<html lang="si">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>මාසික වාර්තාව - ${month} ${year}</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; background: #f5f5f5; }
        .container { max-width: 800px; margin: 0 auto; background: white; padding: 20px; border-radius: 10px; }
        h1 { color: #4F46E5; text-align: center; }
        .summary { display: grid; grid-template-columns: repeat(2, 1fr); gap: 15px; margin: 20px 0; }
        .card { background: #f0f9ff; padding: 15px; border-radius: 8px; border-left: 4px solid #4F46E5; }
        .card.green { background: #f0fdf4; border-left-color: #10B981; }
        .card.red { background: #fef2f2; border-left-color: #EF4444; }
        .label { font-size: 14px; color: #666; }
        .value { font-size: 24px; font-weight: bold; color: #333; margin-top: 5px; }
        table { width: 100%; border-collapse: collapse; margin: 20px 0; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background: #4F46E5; color: white; }
        .positive { color: #10B981; }
        .negative { color: #EF4444; }
    </style>
</head>
<body>
    <div class="container">
        <h1>📊 මාසික වාර්තාව</h1>
        <p style="text-align: center; color: #666;">${month} ${year}</p>
        
        <div class="summary">
            <div class="card">
                <div class="label">බැංකු ශේෂය</div>
                <div class="value">රු ${totalBankBalance.toLocaleString()}</div>
            </div>
            <div class="card green">
                <div class="label">මුදල් ශේෂය</div>
                <div class="value">රු ${totalCashBalance.toLocaleString()}</div>
            </div>
            <div class="card green">
                <div class="label">මාසික ආදායම</div>
                <div class="value">රු ${totalIncome.toLocaleString()}</div>
            </div>
            <div class="card red">
                <div class="label">මාසික වියදම</div>
                <div class="value">රු ${totalExpenses.toLocaleString()}</div>
            </div>
        </div>

        <h2>බැංකු ගිණුම්</h2>
        <table>
            <tr><th>නම</th><th>අංකය</th><th>ශේෂය</th></tr>
            ${accounts.bank.map(acc => `
            <tr>
                <td>${acc.name}</td>
                <td>${acc.number}</td>
                <td>රු ${acc.balance.toLocaleString()}</td>
            </tr>
            `).join('')}
        </table>

        <h2>මුදල් ගිණුම්</h2>
        <table>
            <tr><th>නම</th><th>ශේෂය</th></tr>
            ${accounts.cash.map(acc => `
            <tr>
                <td>${acc.name}</td>
                <td>රු ${acc.balance.toLocaleString()}</td>
            </tr>
            `).join('')}
        </table>

        <h2>වියදම් කාණ්ඩ</h2>
        <table>
            <tr><th>නම</th><th>අයවැය</th><th>වියදම්</th><th>ඉතිරි</th></tr>
            ${categories.map(cat => `
            <tr>
                <td>${cat.name}</td>
                <td>රු ${cat.budget.toLocaleString()}</td>
                <td class="negative">රු ${cat.spent.toLocaleString()}</td>
                <td class="${cat.budget - cat.spent >= 0 ? 'positive' : 'negative'}">
                    රු ${(cat.budget - cat.spent).toLocaleString()}
                </td>
            </tr>
            `).join('')}
        </table>

        <h2>මෑත ගණුදෙණු (20)</h2>
        <table>
            <tr><th>දිනය</th><th>විස්තරය</th><th>මුදල</th></tr>
            ${transactions.slice(0, 20).map(t => `
            <tr>
                <td>${t.date}</td>
                <td>${t.description}</td>
                <td class="${t.type === 'deposit' ? 'positive' : 'negative'}">
                    ${t.type === 'deposit' ? '+' : '-'}රු ${t.amount.toLocaleString()}
                </td>
            </tr>
            `).join('')}
        </table>

        <p style="text-align: center; color: #999; margin-top: 30px;">
            Generated by මුදල් කළමනාකරණ v3.2.0
        </p>
    </div>
</body>
</html>`;
      
      const filename = `mudal_report_${new Date().getTime()}.html`;
      const fileUri = FileSystem.cacheDirectory + filename;
      
      await FileSystem.writeAsStringAsync(fileUri, html, {
        encoding: 'utf8'
      });
      
      const fileInfo = await FileSystem.getInfoAsync(fileUri);
      if (!fileInfo.exists) {
        Alert.alert('දෝෂයකි', 'Report file create කිරීමේදී දෝෂයක් සිදු විය');
        return;
      }
      
      const isAvailable = await Sharing.isAvailableAsync();
      if (isAvailable) {
        await Sharing.shareAsync(fileUri, {
          mimeType: 'text/html',
          dialogTitle: 'මාසික වාර්තාව',
          UTI: 'public.html'
        });
      } else {
        Alert.alert('දෝෂයකි', 'Sharing සහාය නොමැත');
      }
    } catch (error) {
      Alert.alert('දෝෂයකි', `Report error: ${error.message}`);
      console.error('Report error:', error);
    }
  };

  const clearAllData = async () => {
    Alert.alert(
      'තහවුරු කරන්න',
      'සියලුම දත්ත මකා දැමීමට අවශ්‍යද? මෙය ආපසු හරවන්න නොහැක!',
      [
        { text: 'අවලංගු කරන්න', style: 'cancel' },
        { 
          text: 'මකන්න', 
          style: 'destructive',
          onPress: async () => {
            try {
              // Clear AsyncStorage (except dark mode)
              await AsyncStorage.multiRemove(['accounts', 'categories', 'transactions']);
              
              // Reset state to initial values
              setAccounts({
                bank: [
                  { id: 1, name: "People's Bank", number: "1234567890", type: "ඉතුරුම්", balance: 0, category: "පුබාන මුදල්" },
                  { id: 2, name: "Commercial Bank", number: "0987654321", type: "ඉතුරුම්", balance: 0, category: "පුබාන මුදල්" }
                ],
                cash: [
                  { id: 1, name: "පුබාන මුදල්", balance: 0 },
                  { id: 2, name: "ඇත්නික්කා මුදල්", balance: 0 }
                ]
              });
              setCategories([
                { id: 1, name: "පෙන් මලදී ගැනීම", budget: 10000, spent: 0 },
                { id: 2, name: "කෑම", budget: 0, spent: 0 }
              ]);
              setTransactions([]);
              
              Alert.alert('සාර්ථකයි!', 'සියලු දත්ත මකා දමන ලදී (Dark mode setting සුරක්ෂිතයි)');
            } catch (error) {
              Alert.alert('දෝෂයකි', 'දත්ත මකා දැමීමේදී දෝෂයක් සිදු විය');
              console.error('Error clearing data:', error);
            }
          }
        }
      ]
    );
  };

  return (
    <ScrollView style={[styles.screen, themedStyles.screen]} contentContainerStyle={styles.scrollContent}>
      <View style={[styles.header, themedStyles.header]}>
        <Text style={styles.headerTitle}>Settings</Text>
        <Text style={styles.headerSubtitle}>App settings and information</Text>
      </View>

      <View style={styles.padding}>
        <Text style={[styles.sectionTitle, themedStyles.text]}>ඇප් තොරතුරු</Text>
        <View style={[styles.card, themedStyles.card]}>
          <View style={styles.infoRow}>
            <Text style={[styles.infoLabel, themedStyles.secondaryText]}>ඇප් නම:</Text>
            <Text style={[styles.infoValue, themedStyles.text]}>මුදල් කළමනාකරණ</Text>
          </View>
          <View style={styles.infoRow}>
            <Text style={[styles.infoLabel, themedStyles.secondaryText]}>වෙළුම:</Text>
            <Text style={[styles.infoValue, themedStyles.text]}>v3.2.0</Text>
          </View>
          <View style={styles.infoRow}>
            <Text style={[styles.infoLabel, themedStyles.secondaryText]}>නිර්මාණය:</Text>
            <Text style={[styles.infoValue, themedStyles.text]}>2024</Text>
          </View>
          <View style={styles.infoRow}>
            <Text style={[styles.infoLabel, themedStyles.secondaryText]}>භාෂාව:</Text>
            <Text style={[styles.infoValue, themedStyles.text]}>සිංහල</Text>
          </View>
        </View>

        <Text style={[styles.sectionTitle, themedStyles.text]}>දත්ත කළමනාකරණය</Text>
        
        <TouchableOpacity style={[styles.settingsButton, themedStyles.card]} onPress={exportData}>
          <Text style={styles.settingsButtonIcon}>📤</Text>
          <View style={styles.settingsButtonText}>
            <Text style={[styles.settingsButtonTitle, themedStyles.text]}>දත්ත අපනයනය කරන්න (Export)</Text>
            <Text style={[styles.settingsButtonSubtitle, themedStyles.secondaryText]}>JSON ආකාරයෙන් ඔබගේ දත්ත බාගත කරන්න</Text>
          </View>
        </TouchableOpacity>

        <TouchableOpacity style={[styles.settingsButton, themedStyles.card]} onPress={importData}>
          <Text style={styles.settingsButtonIcon}>📥</Text>
          <View style={styles.settingsButtonText}>
            <Text style={[styles.settingsButtonTitle, themedStyles.text]}>දත්ත ආනයනය කරන්න (Import)</Text>
            <Text style={[styles.settingsButtonSubtitle, themedStyles.secondaryText]}>JSON file එකක් තෝරලා data restore කරන්න</Text>
          </View>
        </TouchableOpacity>

        <TouchableOpacity style={[styles.settingsButton, themedStyles.card]} onPress={generateMonthlyReport}>
          <Text style={styles.settingsButtonIcon}>📊</Text>
          <View style={styles.settingsButtonText}>
            <Text style={[styles.settingsButtonTitle, themedStyles.text]}>මැසික වාර්තාව (HTML)</Text>
            <Text style={[styles.settingsButtonSubtitle, themedStyles.secondaryText]}>උපාබ පවතින මාසයේ HTML වාර්තාව</Text>
          </View>
        </TouchableOpacity>

        <TouchableOpacity style={[styles.settingsButton, themedStyles.card, styles.settingsButtonDanger]} onPress={clearAllData}>
          <Text style={styles.settingsButtonIcon}>🗑️</Text>
          <View style={styles.settingsButtonText}>
            <Text style={[styles.settingsButtonTitle, { color: '#DC2626' }]}>සියලුම දත්ත මකන්න</Text>
            <Text style={[styles.settingsButtonSubtitle, { color: '#EF4444' }]}>ප්‍රවේශමෙන්! මෙය ආපසු හරවන්න බැහැ</Text>
          </View>
        </TouchableOpacity>

        <Text style={[styles.sectionTitle, themedStyles.text]}>පෙනුම් සැකසුම්</Text>
        
        <TouchableOpacity style={[styles.settingsButton, themedStyles.card]} onPress={toggleDarkMode}>
          <Text style={styles.settingsButtonIcon}>{isDarkMode ? '🌙' : '☀️'}</Text>
          <View style={styles.settingsButtonText}>
            <Text style={[styles.settingsButtonTitle, themedStyles.text]}>Dark Mode</Text>
            <Text style={[styles.settingsButtonSubtitle, themedStyles.secondaryText]}>
              {isDarkMode ? 'Dark mode සක්‍රීය කර ඇත' : 'Light mode සක්‍රීය කර ඇත'}
            </Text>
          </View>
          <View style={[styles.toggle, isDarkMode && styles.toggleActive]}>
            <View style={[styles.toggleCircle, isDarkMode && styles.toggleCircleActive]} />
          </View>
        </TouchableOpacity>

        <Text style={[styles.sectionTitle, themedStyles.text]}>ඇප් එක පිළිබඳව</Text>
        <View style={[styles.card, themedStyles.card]}>
          <Text style={[styles.aboutTitle, themedStyles.text]}>මුදල් කළමනාකරණ යෙදුම</Text>
          <Text style={[styles.aboutDescription, themedStyles.secondaryText]}>
            මෙය ඔබගේ පුද්ගලික මුදල් කළමනාකරණය කිරීම සඳහා සරල හා ප්‍රයෝජනවත් mobile application එකකි. 
            බැංකු ගිණුම්, මුදල් ගිණුම්, වියදම් කාණ්ඩ සහ ගනුදෙණු track කරන්න පුළුවන්.
          </Text>
          <View style={styles.featureList}>
            <Text style={[styles.featureItem, themedStyles.text]}>✅ බැංකු සහ මුදල් ගිණුම් කළමනාකරණය</Text>
            <Text style={[styles.featureItem, themedStyles.text]}>✅ වියදම් කාණ්ඩ සහ budget tracking</Text>
            <Text style={[styles.featureItem, themedStyles.text]}>✅ ගනුදෙණු history සහ reports</Text>
            <Text style={[styles.featureItem, themedStyles.text]}>✅ Data backup සහ restore</Text>
            <Text style={[styles.featureItem, themedStyles.text]}>✅ සිංහල භාෂා සහාය</Text>
            <Text style={[styles.featureItem, themedStyles.text]}>✅ Offline data storage</Text>
          </View>
        </View>

        <Text style={[styles.sectionTitle, themedStyles.text]}>සංවර්ධකයා</Text>
        <View style={[styles.card, themedStyles.card]}>
          <View style={styles.developerHeader}>
            <Text style={styles.developerIcon}>👨‍💻</Text>
            <View style={styles.developerInfo}>
              <Text style={[styles.developerName, themedStyles.text]}>රංජිත් කරුණාරත්න</Text>
              <Text style={[styles.developerRole, themedStyles.secondaryText]}>Software Developer</Text>
            </View>
          </View>
          
          <View style={styles.contactInfo}>
            <View style={styles.contactRow}>
              <Text style={styles.contactIcon}>📧</Text>
              <Text style={[styles.contactText, themedStyles.text]}>ranjithpalugolla@gmail.com</Text>
            </View>
            <View style={styles.contactRow}>
              <Text style={styles.contactIcon}>🔗</Text>
              <Text style={styles.contactLink}>github.com/ranjith-expense-tracker</Text>
            </View>
          </View>

          <View style={styles.disclaimer}>
            <Text style={[styles.disclaimerText, themedStyles.secondaryText]}>
              © 2024 රංජිත් කරුණාරත්න. All rights reserved.
            </Text>
            <Text style={[styles.disclaimerSubtext, themedStyles.secondaryText]}>
              Made with ❤️ in Sri Lanka
            </Text>
          </View>
        </View>
      </View>
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#F9FAFB',
  },
  content: {
    flex: 1,
  },
  screen: {
    flex: 1,
    backgroundColor: '#F9FAFB',
  },
  scrollContent: {
    paddingBottom: 150,
  },
  header: {
    backgroundColor: '#4F46E5',
    padding: 24,
    paddingTop: 20,
  },
  headerTitle: {
    fontSize: 24,
    fontWeight: 'bold',
    color: '#FFFFFF',
    textAlign: 'center',
  },
  headerSubtitle: {
    fontSize: 12,
    color: '#E0E7FF',
    textAlign: 'center',
    marginTop: 4,
  },
  padding: {
    padding: 16,
  },
  balanceCard: {
    backgroundColor: '#FFFFFF',
    borderRadius: 12,
    padding: 24,
    marginBottom: 16,
    alignItems: 'center',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
    elevation: 3,
  },
  balanceLabel: {
    fontSize: 14,
    color: '#6B7280',
    marginBottom: 8,
  },
  balanceAmount: {
    fontSize: 40,
    fontWeight: 'bold',
    color: '#4F46E5',
  },
  balanceSubtext: {
    fontSize: 12,
    color: '#9CA3AF',
    marginTop: 4,
  },
  grid2: {
    flexDirection: 'row',
    gap: 12,
    marginBottom: 16,
  },
  summaryCard: {
    flex: 1,
    borderRadius: 12,
    padding: 16,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
    elevation: 3,
  },
  summaryLabel: {
    fontSize: 12,
    color: '#FFFFFF',
    marginBottom: 8,
  },
  summaryAmount: {
    fontSize: 20,
    fontWeight: 'bold',
    color: '#FFFFFF',
  },
  section: {
    marginBottom: 24,
  },
  sectionHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: 12,
  },
  sectionTitle: {
    fontSize: 18,
    fontWeight: 'bold',
    color: '#1F2937',
    marginBottom: 12,
  },
  subsection: {
    marginBottom: 16,
  },
  subsectionTitle: {
    fontSize: 14,
    fontWeight: '600',
    color: '#374151',
    marginBottom: 8,
  },
  addButton: {
    width: 40,
    height: 40,
    borderRadius: 20,
    backgroundColor: '#4F46E5',
    justifyContent: 'center',
    alignItems: 'center',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.2,
    shadowRadius: 4,
    elevation: 5,
  },
  addButtonText: {
    fontSize: 24,
    color: '#FFFFFF',
    fontWeight: 'bold',
  },
  addButtonSmall: {
    width: 28,
    height: 28,
    borderRadius: 14,
    backgroundColor: '#4F46E5',
    justifyContent: 'center',
    alignItems: 'center',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.2,
    shadowRadius: 2,
    elevation: 3,
  },
  addButtonSmallText: {
    fontSize: 18,
    color: '#FFFFFF',
    fontWeight: 'bold',
  },
  accountCard: {
    flex: 1,
    borderRadius: 12,
    padding: 16,
    position: 'relative',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
    elevation: 3,
  },
  accountCardBlue: {
    backgroundColor: '#4F46E5',
  },
  accountCardGreen: {
    backgroundColor: '#10B981',
  },
  accountCardYellow: {
    backgroundColor: '#EAB308',
  },
  accountCardRed: {
    backgroundColor: '#EF4444',
  },
  accountCardSelected: {
    borderWidth: 3,
    borderColor: '#FFFFFF',
  },
  checkMark: {
    position: 'absolute',
    top: 8,
    right: 8,
    width: 24,
    height: 24,
    borderRadius: 12,
    backgroundColor: '#FFFFFF',
    justifyContent: 'center',
    alignItems: 'center',
  },
  checkMarkText: {
    fontSize: 12,
    fontWeight: 'bold',
    color: '#4F46E5',
  },
  accountName: {
    fontSize: 14,
    fontWeight: '600',
    color: '#FFFFFF',
    marginBottom: 4,
  },
  accountNumber: {
    fontSize: 10,
    color: 'rgba(255,255,255,0.8)',
    marginBottom: 8,
  },
  accountBalance: {
    fontSize: 18,
    fontWeight: 'bold',
    color: '#FFFFFF',
  },
  accountListCard: {
    backgroundColor: '#FFFFFF',
    borderRadius: 12,
    padding: 16,
    marginBottom: 12,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
    elevation: 3,
  },
  accountListHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: 8,
  },
  accountListName: {
    fontSize: 18,
    fontWeight: 'bold',
    color: '#1F2937',
  },
  accountListActions: {
    flexDirection: 'row',
    gap: 12,
  },
  actionButton: {
    fontSize: 20,
  },
  actionButtonDelete: {
    fontSize: 20,
  },
  accountListDetail: {
    fontSize: 14,
    color: '#6B7280',
    marginBottom: 4,
  },
  accountListBalance: {
    fontSize: 20,
    fontWeight: 'bold',
    color: '#1F2937',
    marginTop: 8,
  },
  transactionCard: {
    backgroundColor: '#FFFFFF',
    borderRadius: 12,
    padding: 16,
    marginBottom: 12,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
    elevation: 3,
  },
  transactionMain: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: 8,
  },
  transactionDate: {
    fontSize: 12,
    color: '#6B7280',
  },
  transactionAmount: {
    fontSize: 18,
    fontWeight: 'bold',
  },
  transactionAmountGreen: {
    color: '#10B981',
  },
  transactionAmountRed: {
    color: '#EF4444',
  },
  transactionAmountOrange: {
    color: '#F59E0B',
  },
  transactionDescription: {
    fontSize: 14,
    color: '#374151',
    marginBottom: 8,
  },
  transactionActions: {
    flexDirection: 'row',
    gap: 16,
  },
  transactionEdit: {
    fontSize: 14,
    color: '#4F46E5',
  },
  transactionDelete: {
    fontSize: 14,
    color: '#EF4444',
  },
  card: {
    backgroundColor: '#FFFFFF',
    borderRadius: 12,
    padding: 16,
    marginBottom: 16,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
    elevation: 3,
  },
  cardTitle: {
    fontSize: 16,
    fontWeight: 'bold',
    color: '#1F2937',
    marginBottom: 12,
  },
  input: {
    backgroundColor: '#F9FAFB',
    borderWidth: 1,
    borderColor: '#D1D5DB',
    borderRadius: 8,
    padding: 12,
    fontSize: 14,
    marginBottom: 12,
  },
  button: {
    backgroundColor: '#4F46E5',
    borderRadius: 8,
    padding: 14,
    alignItems: 'center',
  },
  buttonText: {
    color: '#FFFFFF',
    fontSize: 16,
    fontWeight: '600',
  },
  categoryCard: {
    backgroundColor: '#FFFFFF',
    borderRadius: 12,
    padding: 16,
    marginBottom: 12,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
    elevation: 3,
  },
  categoryHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: 8,
  },
  categoryName: {
    fontSize: 16,
    fontWeight: '600',
    color: '#1F2937',
  },
  categoryDetail: {
    fontSize: 14,
    color: '#6B7280',
    marginBottom: 8,
  },
  progressBar: {
    height: 8,
    backgroundColor: '#E5E7EB',
    borderRadius: 4,
    overflow: 'hidden',
  },
  progressFill: {
    height: '100%',
    backgroundColor: '#4F46E5',
    borderRadius: 4,
  },
  infoRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    paddingVertical: 8,
  },
  infoLabel: {
    fontSize: 14,
    color: '#6B7280',
  },
  infoValue: {
    fontSize: 14,
    fontWeight: '600',
    color: '#1F2937',
  },
  settingsButton: {
    backgroundColor: '#FFFFFF',
    borderRadius: 12,
    padding: 16,
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 12,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
    elevation: 3,
  },
  settingsButtonDanger: {
    backgroundColor: '#FEF2F2',
    borderWidth: 1,
    borderColor: '#FEE2E2',
  },
  settingsButtonIcon: {
    fontSize: 32,
    marginRight: 16,
  },
  settingsButtonText: {
    flex: 1,
  },
  settingsButtonTitle: {
    fontSize: 16,
    fontWeight: '600',
    color: '#1F2937',
    marginBottom: 4,
  },
  settingsButtonSubtitle: {
    fontSize: 12,
    color: '#6B7280',
  },
  bottomNav: {
    flexDirection: 'row',
    backgroundColor: '#4F46E5',
    paddingVertical: 12,
    paddingHorizontal: 8,
    paddingBottom: 20,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: -2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
    elevation: 8,
    borderTopWidth: 1,
    borderTopColor: 'rgba(255,255,255,0.1)',
  },
  navButton: {
    flex: 1,
    alignItems: 'center',
    paddingVertical: 8,
  },
  navIcon: {
    fontSize: 24,
    color: '#FFFFFF',
  },
  navIconActive: {
    color: '#FCD34D',
  },
  navLabel: {
    fontSize: 10,
    color: '#FFFFFF',
    marginTop: 4,
  },
  navLabelActive: {
    color: '#FCD34D',
  },
  modalOverlay: {
    flex: 1,
    backgroundColor: 'rgba(0,0,0,0.5)',
    justifyContent: 'center',
    alignItems: 'center',
  },
  modalContent: {
    backgroundColor: '#FFFFFF',
    borderRadius: 16,
    padding: 24,
    width: '85%',
    maxWidth: 400,
  },
  modalTitle: {
    fontSize: 18,
    fontWeight: 'bold',
    color: '#1F2937',
    marginBottom: 16,
    textAlign: 'center',
  },
  modalButtons: {
    flexDirection: 'row',
    gap: 12,
    marginTop: 8,
  },
  modalButtonCancel: {
    flex: 1,
    backgroundColor: '#F3F4F6',
    borderRadius: 8,
    padding: 14,
    alignItems: 'center',
  },
  modalButtonCancelText: {
    color: '#374151',
    fontSize: 14,
    fontWeight: '600',
  },
  modalButtonSave: {
    flex: 1,
    backgroundColor: '#4F46E5',
    borderRadius: 8,
    padding: 14,
    alignItems: 'center',
  },
  modalButtonSaveText: {
    color: '#FFFFFF',
    fontSize: 14,
    fontWeight: '600',
  },
  actionButton: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    borderRadius: 12,
    padding: 16,
    marginBottom: 12,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.2,
    shadowRadius: 4,
    elevation: 5,
  },
  actionButtonIcon: {
    fontSize: 24,
    marginRight: 12,
  },
  actionButtonText: {
    color: '#FFFFFF',
    fontSize: 16,
    fontWeight: 'bold',
  },
  modalSubtitle: {
    fontSize: 14,
    color: '#6B7280',
    marginBottom: 12,
    textAlign: 'center',
  },
  pickerButton: {
    backgroundColor: '#F9FAFB',
    borderWidth: 1,
    borderColor: '#D1D5DB',
    borderRadius: 8,
    padding: 12,
    marginBottom: 12,
  },
  pickerButtonText: {
    fontSize: 14,
    color: '#374151',
  },
  pickerList: {
    backgroundColor: '#FFFFFF',
    borderRadius: 8,
    borderWidth: 1,
    borderColor: '#D1D5DB',
    marginBottom: 12,
    maxHeight: 200,
  },
  pickerItem: {
    padding: 12,
    borderBottomWidth: 1,
    borderBottomColor: '#E5E7EB',
  },
  pickerItemText: {
    fontSize: 14,
    color: '#1F2937',
  },
  toggle: {
    width: 50,
    height: 28,
    borderRadius: 14,
    backgroundColor: '#D1D5DB',
    padding: 2,
    justifyContent: 'center',
  },
  toggleActive: {
    backgroundColor: '#4F46E5',
  },
  toggleCircle: {
    width: 24,
    height: 24,
    borderRadius: 12,
    backgroundColor: '#FFFFFF',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.2,
    shadowRadius: 2,
    elevation: 3,
  },
  toggleCircleActive: {
    alignSelf: 'flex-end',
  },
  aboutTitle: {
    fontSize: 18,
    fontWeight: 'bold',
    color: '#1F2937',
    marginBottom: 12,
    textAlign: 'center',
  },
  aboutDescription: {
    fontSize: 14,
    color: '#6B7280',
    lineHeight: 22,
    marginBottom: 16,
    textAlign: 'justify',
  },
  featureList: {
    backgroundColor: '#F9FAFB',
    borderRadius: 8,
    padding: 12,
  },
  featureItem: {
    fontSize: 14,
    color: '#374151',
    marginBottom: 8,
  },
  developerHeader: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 16,
    paddingBottom: 16,
    borderBottomWidth: 1,
    borderBottomColor: '#E5E7EB',
  },
  developerIcon: {
    fontSize: 48,
    marginRight: 16,
  },
  developerInfo: {
    flex: 1,
  },
  developerName: {
    fontSize: 18,
    fontWeight: 'bold',
    color: '#1F2937',
    marginBottom: 4,
  },
  developerRole: {
    fontSize: 14,
    color: '#6B7280',
  },
  contactInfo: {
    marginBottom: 16,
  },
  contactRow: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 12,
  },
  contactIcon: {
    fontSize: 20,
    marginRight: 12,
  },
  contactText: {
    fontSize: 14,
    color: '#374151',
  },
  contactLink: {
    fontSize: 14,
    color: '#4F46E5',
    textDecorationLine: 'underline',
  },
  disclaimer: {
    paddingTop: 16,
    borderTopWidth: 1,
    borderTopColor: '#E5E7EB',
    alignItems: 'center',
  },
  disclaimerText: {
    fontSize: 12,
    color: '#6B7280',
    marginBottom: 4,
  },
  disclaimerSubtext: {
    fontSize: 12,
    color: '#9CA3AF',
  },
});

const getThemedStyles = (isDarkMode) => ({
  container: {
    backgroundColor: isDarkMode ? '#0B1120' : '#F9FAFB',
  },
  screen: {
    backgroundColor: isDarkMode ? '#0B1120' : '#F9FAFB',
  },
  header: {
    backgroundColor: isDarkMode ? '#1E1B4B' : '#4F46E5',
  },
  card: {
    backgroundColor: isDarkMode ? '#111827' : '#FFFFFF',
    borderColor: isDarkMode ? '#1F2937' : 'transparent',
    borderWidth: isDarkMode ? 1 : 0,
  },
  text: {
    color: isDarkMode ? '#F8FAFC' : '#1F2937',
  },
  secondaryText: {
    color: isDarkMode ? '#A5B4FC' : '#6B7280',
  },
  input: {
    backgroundColor: isDarkMode ? '#0F172A' : '#F9FAFB',
    borderColor: isDarkMode ? '#334155' : '#D1D5DB',
    color: isDarkMode ? '#F8FAFC' : '#1F2937',
  },
  modalButtonCancel: {
    backgroundColor: isDarkMode ? '#1F2937' : '#F3F4F6',
  },
  bottomNav: {
    backgroundColor: isDarkMode ? '#1E1B4B' : '#4F46E5',
    borderTopColor: isDarkMode ? 'rgba(255,255,255,0.08)' : 'rgba(255,255,255,0.1)',
  },
});
