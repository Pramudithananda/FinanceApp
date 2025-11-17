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
      <StatusBar barStyle={isDarkMode ? "light-content" : "light-content"} backgroundColor="#4F46E5" />
      
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

      // Update balances based on transaction type
      if (editingTransaction.type === 'deposit') {
        // Find and update bank account
        const updatedBankAccounts = accounts.bank.map(acc =>
          acc.name === editingTransaction.accountName
            ? { ...acc, balance: acc.balance + amountDifference }
            : acc
        );
        setAccounts({ ...accounts, bank: updatedBankAccounts });
      } else if (editingTransaction.type === 'withdrawal') {
        // Update bank account (reverse: add back old, subtract new)
        const updatedBankAccounts = accounts.bank.map(acc =>
          acc.name === editingTransaction.accountName
            ? { ...acc, balance: acc.balance - amountDifference }
            : acc
        );
        // Update cash account
        const updatedCashAccounts = accounts.cash.map(acc =>
          acc.name === editingTransaction.toAccount
            ? { ...acc, balance: acc.balance + amountDifference }
            : acc
        );
        setAccounts({ bank: updatedBankAccounts, cash: updatedCashAccounts });
      } else if (editingTransaction.type === 'expense') {
        // Update cash account (reverse: add back old, subtract new)
        const updatedCashAccounts = accounts.cash.map(acc =>
          acc.name === editingTransaction.accountName
            ? { ...acc, balance: acc.balance - amountDifference }
            : acc
        );
        setAccounts({ ...accounts, cash: updatedCashAccounts });

        // Update category spent
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
            // Reverse the transaction effect on balances
            if (transactionToDelete.type === 'deposit') {
              // Subtract the deposit from bank account
              const updatedBankAccounts = accounts.bank.map(acc =>
                acc.name === transactionToDelete.accountName
                  ? { ...acc, balance: acc.balance - transactionToDelete.amount }
                  : acc
              );
              setAccounts({ ...accounts, bank: updatedBankAccounts });
            } else if (transactionToDelete.type === 'withdrawal') {
              // Add back to bank, remove from cash
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
              // Add back to cash account
              const updatedCashAccounts = accounts.cash.map(acc =>
                acc.name === transactionToDelete.accountName
                  ? { ...acc, balance: acc.balance + transactionToDelete.amount }
                  : acc
              );
              setAccounts({ ...accounts, cash: updatedCashAccounts });

              // Subtract from category spent
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
      <View style={styles.header}>
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
      <View style={styles.header}>
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
      <View style={styles.header}>
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
