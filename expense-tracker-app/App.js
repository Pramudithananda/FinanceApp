import React, { useState } from 'react';
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

  const renderScreen = () => {
    switch(currentScreen) {
      case 'dashboard':
        return <DashboardScreen 
          accounts={accounts} 
          setAccounts={setAccounts}
          transactions={transactions}
          addTransaction={addTransaction}
        />;
      case 'bank':
        return <BankScreen 
          accounts={accounts.bank} 
          allAccounts={accounts}
          setAccounts={setAccounts}
          addTransaction={addTransaction}
        />;
      case 'cash':
        return <CashScreen 
          accounts={accounts.cash} 
          allAccounts={accounts}
          setAccounts={setAccounts}
          addTransaction={addTransaction}
        />;
      case 'categories':
        return <CategoriesScreen categories={categories} setCategories={setCategories} />;
      case 'settings':
        return <SettingsScreen />;
      default:
        return <DashboardScreen 
          accounts={accounts} 
          setAccounts={setAccounts}
          transactions={transactions}
          addTransaction={addTransaction}
        />;
    }
  };

  return (
    <SafeAreaView style={styles.container}>
      <StatusBar barStyle="light-content" backgroundColor="#4F46E5" />
      
      {/* Main Content */}
      <View style={styles.mainContent}>
        {renderScreen()}
      </View>

      {/* Bottom Navigation */}
      <View style={styles.bottomNav}>
        <NavButton 
          icon="🏠" 
          label="Dashboard" 
          active={currentScreen === 'dashboard'}
          onPress={() => setCurrentScreen('dashboard')}
        />
        <NavButton 
          icon="🏦" 
          label="Bank" 
          active={currentScreen === 'bank'}
          onPress={() => setCurrentScreen('bank')}
        />
        <NavButton 
          icon="💰" 
          label="Cash" 
          active={currentScreen === 'cash'}
          onPress={() => setCurrentScreen('cash')}
        />
        <NavButton 
          icon="📁" 
          label="Categories" 
          active={currentScreen === 'categories'}
          onPress={() => setCurrentScreen('categories')}
        />
        <NavButton 
          icon="⚙️" 
          label="Settings" 
          active={currentScreen === 'settings'}
          onPress={() => setCurrentScreen('settings')}
        />
      </View>
    </SafeAreaView>
  );
}

// Navigation Button Component
function NavButton({ icon, label, active, onPress }) {
  return (
    <TouchableOpacity 
      onPress={onPress}
      style={styles.navButton}
    >
      <Text style={styles.navIcon}>{icon}</Text>
      <Text style={[styles.navLabel, active && styles.navLabelActive]}>
        {label}
      </Text>
    </TouchableOpacity>
  );
}

// Dashboard Screen
function DashboardScreen({ accounts, setAccounts, transactions, addTransaction }) {
  const [depositModalVisible, setDepositModalVisible] = useState(false);
  const [withdrawModalVisible, setWithdrawModalVisible] = useState(false);
  const [expenseModalVisible, setExpenseModalVisible] = useState(false);
  const [selectedBankAccount, setSelectedBankAccount] = useState(null);
  const [amount, setAmount] = useState('');
  const [description, setDescription] = useState('');

  const totalBankBalance = accounts.bank.reduce((sum, acc) => sum + acc.balance, 0);
  const totalCashBalance = accounts.cash.reduce((sum, acc) => sum + acc.balance, 0);

  const handleDeposit = () => {
    if (!selectedBankAccount || !amount || parseFloat(amount) <= 0) {
      Alert.alert('දෝෂයකි', 'කරුණාකර වලංගු මුදලක් ඇතුළත් කරන්න');
      return;
    }

    const depositAmount = parseFloat(amount);
    
    setAccounts(prev => ({
      ...prev,
      bank: prev.bank.map(acc => 
        acc.id === selectedBankAccount.id 
          ? { ...acc, balance: acc.balance + depositAmount }
          : acc
      )
    }));

    addTransaction({
      type: 'deposit',
      amount: depositAmount,
      accountName: selectedBankAccount.name,
      accountNumber: selectedBankAccount.number,
      description: description || 'බැංකු තැන්පතු'
    });

    setAmount('');
    setDescription('');
    setSelectedBankAccount(null);
    setDepositModalVisible(false);
    Alert.alert('සාර්ථකයි!', `රු ${depositAmount.toLocaleString()} බැංකු ගිණුමට එකතු කරන ලදී`);
  };

  const handleWithdraw = () => {
    if (!selectedBankAccount || !amount || parseFloat(amount) <= 0) {
      Alert.alert('දෝෂයකි', 'කරුණාකර වලංගු මුදලක් ඇතුළත් කරන්න');
      return;
    }

    const withdrawAmount = parseFloat(amount);

    if (selectedBankAccount.balance < withdrawAmount) {
      Alert.alert('දෝෂයකි', 'ප්‍රමාණවත් මුදලක් නොමැත');
      return;
    }
    
    setAccounts(prev => ({
      ...prev,
      bank: prev.bank.map(acc => 
        acc.id === selectedBankAccount.id 
          ? { ...acc, balance: acc.balance - withdrawAmount }
          : acc
      )
    }));

    addTransaction({
      type: 'withdrawal',
      amount: withdrawAmount,
      accountName: selectedBankAccount.name,
      accountNumber: selectedBankAccount.number,
      description: description || 'බැංකු මුදල් ගැනීම'
    });

    setAmount('');
    setDescription('');
    setSelectedBankAccount(null);
    setWithdrawModalVisible(false);
    Alert.alert('සාර්ථකයි!', `රු ${withdrawAmount.toLocaleString()} බැංකු ගිණුමෙන් ගෙන ඇත`);
  };

  const handleExpense = () => {
    if (!amount || parseFloat(amount) <= 0) {
      Alert.alert('දෝෂයකි', 'කරුණාකර වලංගු මුදලක් ඇතුළත් කරන්න');
      return;
    }

    const expenseAmount = parseFloat(amount);

    if (accounts.cash[0].balance < expenseAmount) {
      Alert.alert('දෝෂයකි', 'ප්‍රමාණවත් මුදලක් නොමැත');
      return;
    }
    
    setAccounts(prev => ({
      ...prev,
      cash: prev.cash.map((acc, index) => 
        index === 0 
          ? { ...acc, balance: acc.balance - expenseAmount }
          : acc
      )
    }));

    addTransaction({
      type: 'expense',
      amount: expenseAmount,
      accountName: accounts.cash[0].name,
      description: description || 'වියදම'
    });

    setAmount('');
    setDescription('');
    setExpenseModalVisible(false);
    Alert.alert('සාර්ථකයි!', `රු ${expenseAmount.toLocaleString()} වියදම ලෙස සටහන් කරන ලදී`);
  };

  return (
    <ScrollView style={styles.screenContainer}>
      <View style={styles.dashboardGradient}>
        {/* Header */}
        <View style={styles.dashboardHeader}>
          <View style={styles.headerCard}>
            <Text style={styles.headerTitle}>❤️ නුපුරුදු හෝමනා...</Text>
            <Text style={styles.headerSubtitle}>Lalanthi Stengran: ආදරෙයි පී...</Text>
            <View style={styles.headerButtons}>
              <TouchableOpacity style={styles.headerButton}>
                <Text style={styles.headerButtonText}>Like</Text>
              </TouchableOpacity>
              <TouchableOpacity style={styles.headerButton}>
                <Text style={styles.headerButtonText}>Reply</Text>
              </TouchableOpacity>
            </View>
          </View>

          {/* Bank Account Quick Access */}
          <View style={styles.actionRow}>
            {accounts.bank.map((account, index) => (
              <TouchableOpacity 
                key={account.id}
                style={[
                  styles.actionButton, 
                  index === 0 ? styles.actionButtonBlue : styles.actionButtonGreen
                ]}
              >
                <Text style={styles.actionButtonNumber}>{account.number}</Text>
                <Text style={styles.actionButtonAmount}>රු {account.balance.toLocaleString()}</Text>
              </TouchableOpacity>
            ))}
          </View>
        </View>

        {/* Quick Actions */}
        <View style={styles.section}>
          <Text style={styles.sectionTitle}>මුදල් ගිනුම</Text>
          <View style={styles.cashGrid}>
            {accounts.cash.map((account, index) => (
              <View 
                key={account.id}
                style={[
                  styles.cashCard, 
                  index === 0 ? styles.cashCardYellow : styles.cashCardRed
                ]}
              >
                {index === 0 && (
                  <View style={styles.checkMark}>
                    <Text style={styles.checkMarkText}>✓</Text>
                  </View>
                )}
                <Text style={styles.cashCardTitle}>{account.name}</Text>
                <Text style={styles.cashCardBalance}>රු {account.balance.toLocaleString()}</Text>
              </View>
            ))}
          </View>
        </View>

        {/* Main Actions */}
        <View style={styles.mainActions}>
          <TouchableOpacity 
            style={[styles.mainActionButton, styles.mainActionBlue]}
            onPress={() => setDepositModalVisible(true)}
          >
            <Text style={styles.mainActionIcon}>🏦</Text>
            <Text style={styles.mainActionText}>බැංකු තැන්පතු</Text>
          </TouchableOpacity>
          <TouchableOpacity 
            style={[styles.mainActionButton, styles.mainActionGreen]}
            onPress={() => setWithdrawModalVisible(true)}
          >
            <Text style={styles.mainActionIcon}>💰</Text>
            <Text style={styles.mainActionText}>බැංකු Withdraw</Text>
          </TouchableOpacity>
          <TouchableOpacity 
            style={[styles.mainActionButton, styles.mainActionRed]}
            onPress={() => setExpenseModalVisible(true)}
          >
            <Text style={styles.mainActionIcon}>📉</Text>
            <Text style={styles.mainActionText}>වියදම් කරන්න</Text>
          </TouchableOpacity>
        </View>

        {/* Recent Transactions */}
        {transactions.length > 0 && (
          <View style={styles.transactionsSection}>
            <Text style={styles.sectionTitle}>මෑත ගනුදෙනු</Text>
            <View style={styles.transactionsList}>
              {transactions.slice(0, 10).map((transaction) => (
                <View key={transaction.id} style={styles.transactionItem}>
                  <View style={styles.transactionLeft}>
                    <Text style={[
                      styles.transactionIcon,
                      transaction.type === 'deposit' ? styles.depositIcon :
                      transaction.type === 'withdrawal' ? styles.withdrawalIcon :
                      styles.expenseIcon
                    ]}>
                      {transaction.type === 'deposit' ? '⬇️' : 
                       transaction.type === 'withdrawal' ? '⬆️' : '💸'}
                    </Text>
                    <View style={styles.transactionDetails}>
                      <Text style={styles.transactionDescription}>
                        {transaction.description}
                      </Text>
                      {transaction.accountName && (
                        <Text style={styles.transactionAccount}>
                          {transaction.accountName}
                          {transaction.accountNumber && ` • ${transaction.accountNumber}`}
                        </Text>
                      )}
                      <Text style={styles.transactionDate}>{transaction.date}</Text>
                    </View>
                  </View>
                  <Text style={[
                    styles.transactionAmount,
                    transaction.type === 'deposit' ? styles.depositAmount :
                    transaction.type === 'withdrawal' ? styles.withdrawalAmount :
                    styles.expenseAmount
                  ]}>
                    {transaction.type === 'deposit' ? '+' : '-'}රු {transaction.amount.toLocaleString()}
                  </Text>
                </View>
              ))}
            </View>
          </View>
        )}
      </View>

      {/* Deposit Modal */}
      <Modal
        visible={depositModalVisible}
        transparent={true}
        animationType="slide"
        onRequestClose={() => setDepositModalVisible(false)}
      >
        <View style={styles.modalContainer}>
          <View style={styles.modalContent}>
            <Text style={styles.modalTitle}>බැංකු තැන්පතු</Text>
            
            <Text style={styles.modalLabel}>බැංකු ගිණුම තෝරන්න</Text>
            <View style={styles.accountSelector}>
              {accounts.bank.map((account) => (
                <TouchableOpacity
                  key={account.id}
                  style={[
                    styles.accountOption,
                    selectedBankAccount?.id === account.id && styles.accountOptionSelected
                  ]}
                  onPress={() => setSelectedBankAccount(account)}
                >
                  <Text style={[
                    styles.accountOptionText,
                    selectedBankAccount?.id === account.id && styles.accountOptionTextSelected
                  ]}>
                    {account.name}
                  </Text>
                  <Text style={[
                    styles.accountOptionBalance,
                    selectedBankAccount?.id === account.id && styles.accountOptionTextSelected
                  ]}>
                    රු {account.balance.toLocaleString()}
                  </Text>
                </TouchableOpacity>
              ))}
            </View>

            <Text style={styles.modalLabel}>මුදල (රු)</Text>
            <TextInput
              style={styles.modalInput}
              placeholder="0"
              keyboardType="numeric"
              value={amount}
              onChangeText={setAmount}
            />

            <Text style={styles.modalLabel}>විස්තරය (විකල්ප)</Text>
            <TextInput
              style={styles.modalInput}
              placeholder="උදා: වැටුප්"
              value={description}
              onChangeText={setDescription}
            />

            <View style={styles.modalButtons}>
              <TouchableOpacity
                style={[styles.modalButton, styles.modalButtonCancel]}
                onPress={() => {
                  setDepositModalVisible(false);
                  setAmount('');
                  setDescription('');
                  setSelectedBankAccount(null);
                }}
              >
                <Text style={styles.modalButtonTextCancel}>අවලංගු කරන්න</Text>
              </TouchableOpacity>
              <TouchableOpacity
                style={[styles.modalButton, styles.modalButtonConfirm]}
                onPress={handleDeposit}
              >
                <Text style={styles.modalButtonText}>තැන්පත් කරන්න</Text>
              </TouchableOpacity>
            </View>
          </View>
        </View>
      </Modal>

      {/* Withdraw Modal */}
      <Modal
        visible={withdrawModalVisible}
        transparent={true}
        animationType="slide"
        onRequestClose={() => setWithdrawModalVisible(false)}
      >
        <View style={styles.modalContainer}>
          <View style={styles.modalContent}>
            <Text style={styles.modalTitle}>බැංකු මුදල් ගැනීම</Text>
            
            <Text style={styles.modalLabel}>බැංකු ගිණුම තෝරන්න</Text>
            <View style={styles.accountSelector}>
              {accounts.bank.map((account) => (
                <TouchableOpacity
                  key={account.id}
                  style={[
                    styles.accountOption,
                    selectedBankAccount?.id === account.id && styles.accountOptionSelected
                  ]}
                  onPress={() => setSelectedBankAccount(account)}
                >
                  <Text style={[
                    styles.accountOptionText,
                    selectedBankAccount?.id === account.id && styles.accountOptionTextSelected
                  ]}>
                    {account.name}
                  </Text>
                  <Text style={[
                    styles.accountOptionBalance,
                    selectedBankAccount?.id === account.id && styles.accountOptionTextSelected
                  ]}>
                    රු {account.balance.toLocaleString()}
                  </Text>
                </TouchableOpacity>
              ))}
            </View>

            <Text style={styles.modalLabel}>මුදල (රු)</Text>
            <TextInput
              style={styles.modalInput}
              placeholder="0"
              keyboardType="numeric"
              value={amount}
              onChangeText={setAmount}
            />

            <Text style={styles.modalLabel}>විස්තරය (විකල්ප)</Text>
            <TextInput
              style={styles.modalInput}
              placeholder="උදා: මුදල් ගැනීම"
              value={description}
              onChangeText={setDescription}
            />

            <View style={styles.modalButtons}>
              <TouchableOpacity
                style={[styles.modalButton, styles.modalButtonCancel]}
                onPress={() => {
                  setWithdrawModalVisible(false);
                  setAmount('');
                  setDescription('');
                  setSelectedBankAccount(null);
                }}
              >
                <Text style={styles.modalButtonTextCancel}>අවලංගු කරන්න</Text>
              </TouchableOpacity>
              <TouchableOpacity
                style={[styles.modalButton, styles.modalButtonConfirm]}
                onPress={handleWithdraw}
              >
                <Text style={styles.modalButtonText}>ගන්න</Text>
              </TouchableOpacity>
            </View>
          </View>
        </View>
      </Modal>

      {/* Expense Modal */}
      <Modal
        visible={expenseModalVisible}
        transparent={true}
        animationType="slide"
        onRequestClose={() => setExpenseModalVisible(false)}
      >
        <View style={styles.modalContainer}>
          <View style={styles.modalContent}>
            <Text style={styles.modalTitle}>වියදම් කරන්න</Text>

            <Text style={styles.modalLabel}>මුදල (රු)</Text>
            <TextInput
              style={styles.modalInput}
              placeholder="0"
              keyboardType="numeric"
              value={amount}
              onChangeText={setAmount}
            />

            <Text style={styles.modalLabel}>විස්තරය</Text>
            <TextInput
              style={styles.modalInput}
              placeholder="උදා: කෑම"
              value={description}
              onChangeText={setDescription}
            />

            <View style={styles.modalButtons}>
              <TouchableOpacity
                style={[styles.modalButton, styles.modalButtonCancel]}
                onPress={() => {
                  setExpenseModalVisible(false);
                  setAmount('');
                  setDescription('');
                }}
              >
                <Text style={styles.modalButtonTextCancel}>අවලංගු කරන්න</Text>
              </TouchableOpacity>
              <TouchableOpacity
                style={[styles.modalButton, styles.modalButtonConfirm]}
                onPress={handleExpense}
              >
                <Text style={styles.modalButtonText}>එකතු කරන්න</Text>
              </TouchableOpacity>
            </View>
          </View>
        </View>
      </Modal>
    </ScrollView>
  );
}

// Bank Screen
function BankScreen({ accounts, allAccounts, setAccounts, addTransaction }) {
  const [addModalVisible, setAddModalVisible] = useState(false);
  const [depositModalVisible, setDepositModalVisible] = useState(false);
  const [withdrawModalVisible, setWithdrawModalVisible] = useState(false);
  const [selectedAccount, setSelectedAccount] = useState(null);
  const [amount, setAmount] = useState('');
  const [description, setDescription] = useState('');
  const [newBankName, setNewBankName] = useState('');
  const [newBankNumber, setNewBankNumber] = useState('');
  const [newBankType, setNewBankType] = useState('ඉතුරුම්');

  const totalBalance = accounts.reduce((sum, acc) => sum + acc.balance, 0);

  const handleAddBank = () => {
    if (!newBankName || !newBankNumber) {
      Alert.alert('දෝෂයකි', 'කරුණාකර සියලු විස්තර පුරවන්න');
      return;
    }

    const newBank = {
      id: Date.now(),
      name: newBankName,
      number: newBankNumber,
      type: newBankType,
      balance: 0,
      category: "පුබාන මුදල්"
    };

    setAccounts(prev => ({
      ...prev,
      bank: [...prev.bank, newBank]
    }));

    setNewBankName('');
    setNewBankNumber('');
    setNewBankType('ඉතුරුම්');
    setAddModalVisible(false);
    Alert.alert('සාර්ථකයි!', 'නව බැංකු ගිණුම එකතු කරන ලදී');
  };

  const handleDeposit = () => {
    if (!amount || parseFloat(amount) <= 0) {
      Alert.alert('දෝෂයකි', 'කරුණාකර වලංගු මුදලක් ඇතුළත් කරන්න');
      return;
    }

    const depositAmount = parseFloat(amount);
    
    setAccounts(prev => ({
      ...prev,
      bank: prev.bank.map(acc => 
        acc.id === selectedAccount.id 
          ? { ...acc, balance: acc.balance + depositAmount }
          : acc
      )
    }));

    addTransaction({
      type: 'deposit',
      amount: depositAmount,
      accountName: selectedAccount.name,
      accountNumber: selectedAccount.number,
      description: description || 'බැංකු තැන්පතු'
    });

    setAmount('');
    setDescription('');
    setSelectedAccount(null);
    setDepositModalVisible(false);
    Alert.alert('සාර්ථකයි!', `රු ${depositAmount.toLocaleString()} එකතු කරන ලදී`);
  };

  const handleWithdraw = () => {
    if (!amount || parseFloat(amount) <= 0) {
      Alert.alert('දෝෂයකි', 'කරුණාකර වලංගු මුදලක් ඇතුළත් කරන්න');
      return;
    }

    const withdrawAmount = parseFloat(amount);

    if (selectedAccount.balance < withdrawAmount) {
      Alert.alert('දෝෂයකි', 'ප්‍රමාණවත් මුදලක් නොමැත');
      return;
    }
    
    setAccounts(prev => ({
      ...prev,
      bank: prev.bank.map(acc => 
        acc.id === selectedAccount.id 
          ? { ...acc, balance: acc.balance - withdrawAmount }
          : acc
      )
    }));

    addTransaction({
      type: 'withdrawal',
      amount: withdrawAmount,
      accountName: selectedAccount.name,
      accountNumber: selectedAccount.number,
      description: description || 'බැංකු මුදල් ගැනීම'
    });

    setAmount('');
    setDescription('');
    setSelectedAccount(null);
    setWithdrawModalVisible(false);
    Alert.alert('සාර්ථකයි!', `රු ${withdrawAmount.toLocaleString()} ගෙන ඇත`);
  };

  const handleDeleteAccount = (accountId) => {
    Alert.alert(
      'තහවුරු කරන්න',
      'මෙම බැංකු ගිණුම මකා දැමීමට අවශ්‍යද?',
      [
        { text: 'නැත', style: 'cancel' },
        {
          text: 'ඔව්',
          style: 'destructive',
          onPress: () => {
            setAccounts(prev => ({
              ...prev,
              bank: prev.bank.filter(acc => acc.id !== accountId)
            }));
          }
        }
      ]
    );
  };

  return (
    <ScrollView style={styles.screenContainer}>
      {/* Header */}
      <View style={styles.screenHeader}>
        <Text style={styles.screenHeaderText}>Bank</Text>
      </View>

      <View style={styles.screenContent}>
        {/* Summary Card */}
        <View style={styles.summaryCard}>
          <Text style={styles.summaryLabel}>සම්පූර්ණ බැංකු ශේෂය</Text>
          <Text style={styles.summaryAmount}>රු {totalBalance.toLocaleString()}</Text>
          <Text style={styles.summarySubtext}>{accounts.length} ගිනුම් වලින්</Text>
        </View>

        {/* Add Button */}
        <TouchableOpacity 
          style={[styles.addButton, styles.addButtonBlue]}
          onPress={() => setAddModalVisible(true)}
        >
          <Text style={styles.addButtonIcon}>➕</Text>
          <Text style={styles.addButtonText}>නව බැංකු ගිනුමි එකතු කරන්න</Text>
        </TouchableOpacity>

        {/* Bank Accounts List */}
        {accounts.map((account) => (
          <View key={account.id} style={[styles.accountCard, styles.accountCardBlue]}>
            <View style={styles.accountHeader}>
              <Text style={styles.accountName}>{account.name}</Text>
              <View style={styles.accountActions}>
                <TouchableOpacity 
                  style={styles.iconButton}
                  onPress={() => {
                    setSelectedAccount(account);
                    setDepositModalVisible(true);
                  }}
                >
                  <Text>⬇️</Text>
                </TouchableOpacity>
                <TouchableOpacity 
                  style={styles.iconButton}
                  onPress={() => {
                    setSelectedAccount(account);
                    setWithdrawModalVisible(true);
                  }}
                >
                  <Text>⬆️</Text>
                </TouchableOpacity>
                <TouchableOpacity 
                  style={styles.iconButton}
                  onPress={() => handleDeleteAccount(account.id)}
                >
                  <Text>🗑️</Text>
                </TouchableOpacity>
              </View>
            </View>
            <Text style={styles.accountDetail}>ගිනුම් අංකය: {account.number}</Text>
            <Text style={styles.accountDetail}>වර්ගය: {account.type}</Text>
            <Text style={styles.accountCategory}>🔗 වර්ගීම: {account.category}</Text>
            <Text style={styles.accountBalance}>ශේෂය: <Text style={styles.balanceAmount}>රු {account.balance.toLocaleString()}</Text></Text>
          </View>
        ))}
      </View>

      {/* Add Bank Modal */}
      <Modal
        visible={addModalVisible}
        transparent={true}
        animationType="slide"
        onRequestClose={() => setAddModalVisible(false)}
      >
        <View style={styles.modalContainer}>
          <View style={styles.modalContent}>
            <Text style={styles.modalTitle}>නව බැංකු ගිණුම</Text>

            <Text style={styles.modalLabel}>බැංකු නම</Text>
            <TextInput
              style={styles.modalInput}
              placeholder="උදා: People's Bank"
              value={newBankName}
              onChangeText={setNewBankName}
            />

            <Text style={styles.modalLabel}>ගිණුම් අංකය</Text>
            <TextInput
              style={styles.modalInput}
              placeholder="1234567890"
              keyboardType="numeric"
              value={newBankNumber}
              onChangeText={setNewBankNumber}
            />

            <Text style={styles.modalLabel}>වර්ගය</Text>
            <TextInput
              style={styles.modalInput}
              placeholder="ඉතුරුම්"
              value={newBankType}
              onChangeText={setNewBankType}
            />

            <View style={styles.modalButtons}>
              <TouchableOpacity
                style={[styles.modalButton, styles.modalButtonCancel]}
                onPress={() => {
                  setAddModalVisible(false);
                  setNewBankName('');
                  setNewBankNumber('');
                  setNewBankType('ඉතුරුම්');
                }}
              >
                <Text style={styles.modalButtonTextCancel}>අවලංගු කරන්න</Text>
              </TouchableOpacity>
              <TouchableOpacity
                style={[styles.modalButton, styles.modalButtonConfirm]}
                onPress={handleAddBank}
              >
                <Text style={styles.modalButtonText}>එකතු කරන්න</Text>
              </TouchableOpacity>
            </View>
          </View>
        </View>
      </Modal>

      {/* Deposit Modal */}
      <Modal
        visible={depositModalVisible}
        transparent={true}
        animationType="slide"
        onRequestClose={() => setDepositModalVisible(false)}
      >
        <View style={styles.modalContainer}>
          <View style={styles.modalContent}>
            <Text style={styles.modalTitle}>බැංකු තැන්පතු</Text>
            
            {selectedAccount && (
              <View style={styles.selectedAccountInfo}>
                <Text style={styles.selectedAccountName}>{selectedAccount.name}</Text>
                <Text style={styles.selectedAccountBalance}>
                  වත්මන් ශේෂය: රු {selectedAccount.balance.toLocaleString()}
                </Text>
              </View>
            )}

            <Text style={styles.modalLabel}>මුදල (රු)</Text>
            <TextInput
              style={styles.modalInput}
              placeholder="0"
              keyboardType="numeric"
              value={amount}
              onChangeText={setAmount}
            />

            <Text style={styles.modalLabel}>විස්තරය (විකල්ප)</Text>
            <TextInput
              style={styles.modalInput}
              placeholder="උදා: වැටුප්"
              value={description}
              onChangeText={setDescription}
            />

            <View style={styles.modalButtons}>
              <TouchableOpacity
                style={[styles.modalButton, styles.modalButtonCancel]}
                onPress={() => {
                  setDepositModalVisible(false);
                  setAmount('');
                  setDescription('');
                  setSelectedAccount(null);
                }}
              >
                <Text style={styles.modalButtonTextCancel}>අවලංගු කරන්න</Text>
              </TouchableOpacity>
              <TouchableOpacity
                style={[styles.modalButton, styles.modalButtonConfirm]}
                onPress={handleDeposit}
              >
                <Text style={styles.modalButtonText}>තැන්පත් කරන්න</Text>
              </TouchableOpacity>
            </View>
          </View>
        </View>
      </Modal>

      {/* Withdraw Modal */}
      <Modal
        visible={withdrawModalVisible}
        transparent={true}
        animationType="slide"
        onRequestClose={() => setWithdrawModalVisible(false)}
      >
        <View style={styles.modalContainer}>
          <View style={styles.modalContent}>
            <Text style={styles.modalTitle}>බැංකු මුදල් ගැනීම</Text>
            
            {selectedAccount && (
              <View style={styles.selectedAccountInfo}>
                <Text style={styles.selectedAccountName}>{selectedAccount.name}</Text>
                <Text style={styles.selectedAccountBalance}>
                  වත්මන් ශේෂය: රු {selectedAccount.balance.toLocaleString()}
                </Text>
              </View>
            )}

            <Text style={styles.modalLabel}>මුදල (රු)</Text>
            <TextInput
              style={styles.modalInput}
              placeholder="0"
              keyboardType="numeric"
              value={amount}
              onChangeText={setAmount}
            />

            <Text style={styles.modalLabel}>විස්තරය (විකල්ප)</Text>
            <TextInput
              style={styles.modalInput}
              placeholder="උදා: මුදල් ගැනීම"
              value={description}
              onChangeText={setDescription}
            />

            <View style={styles.modalButtons}>
              <TouchableOpacity
                style={[styles.modalButton, styles.modalButtonCancel]}
                onPress={() => {
                  setWithdrawModalVisible(false);
                  setAmount('');
                  setDescription('');
                  setSelectedAccount(null);
                }}
              >
                <Text style={styles.modalButtonTextCancel}>අවලංගු කරන්න</Text>
              </TouchableOpacity>
              <TouchableOpacity
                style={[styles.modalButton, styles.modalButtonConfirm]}
                onPress={handleWithdraw}
              >
                <Text style={styles.modalButtonText}>ගන්න</Text>
              </TouchableOpacity>
            </View>
          </View>
        </View>
      </Modal>
    </ScrollView>
  );
}

// Cash Screen
function CashScreen({ accounts, allAccounts, setAccounts, addTransaction }) {
  const [addModalVisible, setAddModalVisible] = useState(false);
  const [newCashName, setNewCashName] = useState('');

  const totalBalance = accounts.reduce((sum, acc) => sum + acc.balance, 0);

  const handleAddCash = () => {
    if (!newCashName) {
      Alert.alert('දෝෂයකි', 'කරුණාකර නමක් ඇතුළත් කරන්න');
      return;
    }

    const newCash = {
      id: Date.now(),
      name: newCashName,
      balance: 0
    };

    setAccounts(prev => ({
      ...prev,
      cash: [...prev.cash, newCash]
    }));

    setNewCashName('');
    setAddModalVisible(false);
    Alert.alert('සාර්ථකයි!', 'නව මුදල් ගිණුම එකතු කරන ලදී');
  };

  const handleDeleteAccount = (accountId) => {
    Alert.alert(
      'තහවුරු කරන්න',
      'මෙම මුදල් ගිණුම මකා දැමීමට අවශ්‍යද?',
      [
        { text: 'නැත', style: 'cancel' },
        {
          text: 'ඔව්',
          style: 'destructive',
          onPress: () => {
            setAccounts(prev => ({
              ...prev,
              cash: prev.cash.filter(acc => acc.id !== accountId)
            }));
          }
        }
      ]
    );
  };

  return (
    <ScrollView style={styles.screenContainer}>
      {/* Header */}
      <View style={styles.screenHeader}>
        <Text style={styles.screenHeaderText}>Cash</Text>
      </View>

      <View style={styles.screenContent}>
        {/* Summary Card */}
        <View style={styles.summaryCard}>
          <Text style={styles.summaryLabel}>සම්පූර්ණ මුදල් ශේෂය</Text>
          <Text style={[styles.summaryAmount, styles.summaryAmountGreen]}>රු {totalBalance.toLocaleString()}</Text>
          <Text style={styles.summarySubtext}>{accounts.length} ගිනුම් වලින්</Text>
        </View>

        {/* Add Button */}
        <TouchableOpacity 
          style={[styles.addButton, styles.addButtonGreen]}
          onPress={() => setAddModalVisible(true)}
        >
          <Text style={styles.addButtonIcon}>➕</Text>
          <Text style={styles.addButtonText}>නව මුදල් ගිනුමි එකතු කරන්න</Text>
        </TouchableOpacity>

        {/* Cash Accounts List */}
        {accounts.map((account, index) => (
          <View 
            key={account.id} 
            style={[
              styles.accountCard, 
              index === 0 ? styles.accountCardYellow : styles.accountCardRed
            ]}
          >
            <View style={styles.accountHeader}>
              <Text style={styles.accountName}>{account.name}</Text>
              <View style={styles.accountActions}>
                <TouchableOpacity 
                  style={styles.iconButton}
                  onPress={() => handleDeleteAccount(account.id)}
                >
                  <Text>🗑️</Text>
                </TouchableOpacity>
              </View>
            </View>
            <Text style={styles.accountBalance}>
              ශේෂය: <Text style={[styles.balanceAmount, index === 0 ? styles.balanceYellow : styles.balanceRed]}>රු {account.balance.toLocaleString()}</Text>
            </Text>
          </View>
        ))}
      </View>

      {/* Add Cash Modal */}
      <Modal
        visible={addModalVisible}
        transparent={true}
        animationType="slide"
        onRequestClose={() => setAddModalVisible(false)}
      >
        <View style={styles.modalContainer}>
          <View style={styles.modalContent}>
            <Text style={styles.modalTitle}>නව මුදල් ගිණුම</Text>

            <Text style={styles.modalLabel}>නම</Text>
            <TextInput
              style={styles.modalInput}
              placeholder="උදා: අතේ මුදල්"
              value={newCashName}
              onChangeText={setNewCashName}
            />

            <View style={styles.modalButtons}>
              <TouchableOpacity
                style={[styles.modalButton, styles.modalButtonCancel]}
                onPress={() => {
                  setAddModalVisible(false);
                  setNewCashName('');
                }}
              >
                <Text style={styles.modalButtonTextCancel}>අවලංගු කරන්න</Text>
              </TouchableOpacity>
              <TouchableOpacity
                style={[styles.modalButton, styles.modalButtonConfirm]}
                onPress={handleAddCash}
              >
                <Text style={styles.modalButtonText}>එකතු කරන්න</Text>
              </TouchableOpacity>
            </View>
          </View>
        </View>
      </Modal>
    </ScrollView>
  );
}

// Categories Screen
function CategoriesScreen({ categories, setCategories }) {
  const [newCategoryName, setNewCategoryName] = useState('');
  const [newCategoryBudget, setNewCategoryBudget] = useState('');

  const handleAddCategory = () => {
    if (!newCategoryName) {
      Alert.alert('දෝෂයකි', 'කරුණාකර කාන්ඩි නමක් ඇතුළත් කරන්න');
      return;
    }

    const newCategory = {
      id: Date.now(),
      name: newCategoryName,
      budget: parseFloat(newCategoryBudget) || 0,
      spent: 0
    };

    setCategories([...categories, newCategory]);
    setNewCategoryName('');
    setNewCategoryBudget('');
    Alert.alert('සාර්ථකයි!', 'නව කාන්ඩිය එකතු කරන ලදී');
  };

  const handleDeleteCategory = (categoryId) => {
    Alert.alert(
      'තහවුරු කරන්න',
      'මෙම කාන්ඩිය මකා දැමීමට අවශ්‍යද?',
      [
        { text: 'නැත', style: 'cancel' },
        {
          text: 'ඔව්',
          style: 'destructive',
          onPress: () => {
            setCategories(categories.filter(cat => cat.id !== categoryId));
          }
        }
      ]
    );
  };

  return (
    <ScrollView style={styles.screenContainer}>
      {/* Header */}
      <View style={styles.screenHeader}>
        <Text style={styles.screenHeaderText}>Expenses Categories</Text>
        <Text style={styles.screenHeaderSubtext}>Manage categories used in expenses</Text>
      </View>

      <View style={styles.screenContent}>
        {/* Add New Category Form */}
        <View style={styles.formCard}>
          <Text style={styles.formTitle}>නව කාන්ඩිකයක් එක් කරන්න</Text>
          <View style={styles.formGroup}>
            <Text style={styles.label}>නාමය</Text>
            <TextInput 
              style={styles.input}
              placeholder="උදා: කෑම"
              placeholderTextColor="#9CA3AF"
              value={newCategoryName}
              onChangeText={setNewCategoryName}
            />
          </View>
          <View style={styles.formGroup}>
            <Text style={styles.label}>ඉලක්කය (රු)</Text>
            <TextInput 
              style={styles.input}
              placeholder="0"
              keyboardType="numeric"
              placeholderTextColor="#9CA3AF"
              value={newCategoryBudget}
              onChangeText={setNewCategoryBudget}
            />
          </View>
          <TouchableOpacity 
            style={styles.submitButton}
            onPress={handleAddCategory}
          >
            <Text style={styles.submitButtonText}>එක් කරන්න</Text>
          </TouchableOpacity>
        </View>

        {/* Existing Categories */}
        <Text style={styles.listTitle}>කාන්ඩික ලැයිස්තුව</Text>
        {categories.map((category) => (
          <View key={category.id} style={styles.categoryCard}>
            <View style={styles.categoryHeader}>
              <Text style={styles.categoryName}>{category.name}</Text>
              <View style={styles.categoryActions}>
                <TouchableOpacity 
                  style={styles.iconButton}
                  onPress={() => handleDeleteCategory(category.id)}
                >
                  <Text>🗑️</Text>
                </TouchableOpacity>
              </View>
            </View>
            <Text style={styles.categoryInfo}>
              Target: රු {category.budget.toLocaleString()} • Spent: රු {category.spent}
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
    </ScrollView>
  );
}

// Settings Screen
function SettingsScreen() {
  return (
    <ScrollView style={styles.screenContainer}>
      {/* Header */}
      <View style={styles.screenHeader}>
        <Text style={styles.screenHeaderText}>Settings</Text>
        <Text style={styles.screenHeaderSubtext}>App settings and information</Text>
      </View>

      <View style={styles.screenContent}>
        {/* App Information */}
        <Text style={styles.listTitle}>ඇප් තොරතුරු</Text>
        <View style={styles.infoCard}>
          <View style={styles.infoRow}>
            <Text style={styles.infoLabel}>ඇප් නම:</Text>
            <Text style={styles.infoValue}>මුදල් කළමනාකරණ</Text>
          </View>
          <View style={styles.infoRow}>
            <Text style={styles.infoLabel}>වෙළුම:</Text>
            <Text style={styles.infoValue}>v3.0 - Enhanced</Text>
          </View>
          <View style={styles.infoRow}>
            <Text style={styles.infoLabel}>නිර්මාණය:</Text>
            <Text style={styles.infoValue}>2024</Text>
          </View>
          <View style={styles.infoRow}>
            <Text style={styles.infoLabel}>භාෂාව:</Text>
            <Text style={styles.infoValue}>සිංහල</Text>
          </View>
        </View>

        {/* Data Management */}
        <Text style={styles.listTitle}>දත්ත කළමනාකරණය</Text>
        <TouchableOpacity style={styles.settingsCard}>
          <Text style={styles.settingsIcon}>🗂️</Text>
          <View style={styles.settingsContent}>
            <Text style={styles.settingsTitle}>දත්ත අපනයනය කරන්න</Text>
            <Text style={styles.settingsDescription}>JSON ආකාරයෙන් ඔබගේ දත්ත බාගත කරන්න</Text>
          </View>
        </TouchableOpacity>
        
        <TouchableOpacity style={styles.settingsCard}>
          <Text style={styles.settingsIcon}>📊</Text>
          <View style={styles.settingsContent}>
            <Text style={styles.settingsTitle}>මැසික වාර්තාව (HTML)</Text>
            <Text style={styles.settingsDescription}>උපාබ පවතින මාසයේ HTML වාර්තාව</Text>
          </View>
        </TouchableOpacity>
        
        <TouchableOpacity 
          style={[styles.settingsCard, styles.settingsCardDanger]}
          onPress={() => {
            Alert.alert(
              'තහවුරු කරන්න',
              'සියලුම දත්ත මකා දැමීමට අවශ්‍යද? මෙය ආපසු හරවන්න නොහැක!',
              [
                { text: 'නැත', style: 'cancel' },
                {
                  text: 'ඔව්, මකන්න',
                  style: 'destructive',
                  onPress: () => Alert.alert('දත්ත මකා දමන ලදී')
                }
              ]
            );
          }}
        >
          <Text style={styles.settingsIcon}>🗑️</Text>
          <View style={styles.settingsContent}>
            <Text style={[styles.settingsTitle, styles.settingsTitleDanger]}>සියලුම දත්ත මකන්න</Text>
            <Text style={[styles.settingsDescription, styles.settingsDescriptionDanger]}>ප්‍රවේශමෙන්! මෙය ආපසු හරවන්න බැහැ</Text>
          </View>
        </TouchableOpacity>
      </View>
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#F9FAFB',
  },
  mainContent: {
    flex: 1,
  },
  bottomNav: {
    flexDirection: 'row',
    backgroundColor: '#4F46E5',
    paddingVertical: 12,
    paddingHorizontal: 8,
    justifyContent: 'space-around',
    elevation: 8,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: -2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
  },
  navButton: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  navIcon: {
    fontSize: 24,
  },
  navLabel: {
    color: '#FFFFFF',
    fontSize: 11,
    marginTop: 4,
  },
  navLabelActive: {
    color: '#FCD34D',
  },
  screenContainer: {
    flex: 1,
    backgroundColor: '#F9FAFB',
  },
  dashboardGradient: {
    backgroundColor: '#4F46E5',
    padding: 16,
    minHeight: '100%',
  },
  dashboardHeader: {
    marginBottom: 24,
    paddingTop: 16,
  },
  headerCard: {
    backgroundColor: 'rgba(255, 255, 255, 0.1)',
    borderRadius: 12,
    padding: 16,
    marginBottom: 16,
  },
  headerTitle: {
    fontSize: 20,
    fontWeight: 'bold',
    color: '#FFFFFF',
    marginBottom: 8,
  },
  headerSubtitle: {
    fontSize: 14,
    color: 'rgba(255, 255, 255, 0.8)',
  },
  headerButtons: {
    flexDirection: 'row',
    gap: 8,
    marginTop: 12,
  },
  headerButton: {
    backgroundColor: 'rgba(255, 255, 255, 0.1)',
    paddingVertical: 6,
    paddingHorizontal: 12,
    borderRadius: 8,
  },
  headerButtonText: {
    color: 'rgba(255, 255, 255, 0.8)',
    fontSize: 12,
  },
  actionRow: {
    flexDirection: 'row',
    gap: 8,
  },
  actionButton: {
    flex: 1,
    borderRadius: 12,
    padding: 16,
    justifyContent: 'space-between',
  },
  actionButtonBlue: {
    backgroundColor: '#3B82F6',
  },
  actionButtonGreen: {
    backgroundColor: '#10B981',
  },
  actionButtonNumber: {
    color: '#FFFFFF',
    fontSize: 12,
    fontWeight: '600',
    marginBottom: 4,
  },
  actionButtonAmount: {
    color: '#FFFFFF',
    fontSize: 16,
    fontWeight: 'bold',
  },
  section: {
    marginBottom: 24,
  },
  sectionTitle: {
    color: '#FFFFFF',
    fontSize: 18,
    fontWeight: '600',
    marginBottom: 12,
  },
  cashGrid: {
    flexDirection: 'row',
    gap: 12,
  },
  cashCard: {
    flex: 1,
    borderRadius: 12,
    padding: 16,
    position: 'relative',
  },
  cashCardYellow: {
    backgroundColor: '#F59E0B',
  },
  cashCardRed: {
    backgroundColor: '#EF4444',
  },
  checkMark: {
    position: 'absolute',
    top: 8,
    right: 8,
    backgroundColor: '#FFFFFF',
    borderRadius: 12,
    width: 24,
    height: 24,
    alignItems: 'center',
    justifyContent: 'center',
  },
  checkMarkText: {
    fontSize: 12,
  },
  cashCardTitle: {
    color: '#FFFFFF',
    fontSize: 14,
    fontWeight: '600',
    marginBottom: 8,
  },
  cashCardBalance: {
    color: '#FFFFFF',
    fontSize: 24,
    fontWeight: 'bold',
  },
  mainActions: {
    gap: 12,
  },
  mainActionButton: {
    borderRadius: 12,
    paddingVertical: 16,
    paddingHorizontal: 24,
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    gap: 8,
    elevation: 4,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
  },
  mainActionBlue: {
    backgroundColor: '#3B82F6',
  },
  mainActionGreen: {
    backgroundColor: '#10B981',
  },
  mainActionRed: {
    backgroundColor: '#EF4444',
  },
  mainActionGray: {
    backgroundColor: '#6B7280',
  },
  mainActionIcon: {
    fontSize: 20,
  },
  mainActionText: {
    color: '#FFFFFF',
    fontSize: 16,
    fontWeight: '600',
  },
  transactionsSection: {
    marginTop: 24,
  },
  transactionsList: {
    gap: 8,
  },
  transactionItem: {
    backgroundColor: 'rgba(255, 255, 255, 0.15)',
    borderRadius: 12,
    padding: 12,
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
  },
  transactionLeft: {
    flexDirection: 'row',
    alignItems: 'center',
    flex: 1,
  },
  transactionIcon: {
    fontSize: 24,
    marginRight: 12,
  },
  depositIcon: {
    color: '#10B981',
  },
  withdrawalIcon: {
    color: '#EF4444',
  },
  expenseIcon: {
    color: '#F59E0B',
  },
  transactionDetails: {
    flex: 1,
  },
  transactionDescription: {
    color: '#FFFFFF',
    fontSize: 14,
    fontWeight: '600',
    marginBottom: 2,
  },
  transactionAccount: {
    color: 'rgba(255, 255, 255, 0.7)',
    fontSize: 12,
    marginBottom: 2,
  },
  transactionDate: {
    color: 'rgba(255, 255, 255, 0.6)',
    fontSize: 11,
  },
  transactionAmount: {
    fontSize: 16,
    fontWeight: 'bold',
    marginLeft: 8,
  },
  depositAmount: {
    color: '#10B981',
  },
  withdrawalAmount: {
    color: '#EF4444',
  },
  expenseAmount: {
    color: '#F59E0B',
  },
  screenHeader: {
    backgroundColor: '#4F46E5',
    padding: 24,
    alignItems: 'center',
  },
  screenHeaderText: {
    color: '#FFFFFF',
    fontSize: 24,
    fontWeight: 'bold',
  },
  screenHeaderSubtext: {
    color: 'rgba(255, 255, 255, 0.8)',
    fontSize: 14,
    marginTop: 4,
  },
  screenContent: {
    padding: 16,
  },
  summaryCard: {
    backgroundColor: '#FFFFFF',
    borderRadius: 12,
    padding: 24,
    alignItems: 'center',
    marginBottom: 16,
    elevation: 2,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.05,
    shadowRadius: 2,
  },
  summaryLabel: {
    color: '#6B7280',
    fontSize: 14,
    marginBottom: 8,
  },
  summaryAmount: {
    color: '#4F46E5',
    fontSize: 36,
    fontWeight: 'bold',
    marginBottom: 4,
  },
  summaryAmountGreen: {
    color: '#10B981',
  },
  summarySubtext: {
    color: '#9CA3AF',
    fontSize: 12,
  },
  addButton: {
    borderRadius: 12,
    paddingVertical: 16,
    paddingHorizontal: 24,
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    gap: 8,
    marginBottom: 16,
    elevation: 2,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.05,
    shadowRadius: 2,
  },
  addButtonBlue: {
    backgroundColor: '#4F46E5',
  },
  addButtonGreen: {
    backgroundColor: '#10B981',
  },
  addButtonIcon: {
    color: '#FFFFFF',
    fontSize: 20,
  },
  addButtonText: {
    color: '#FFFFFF',
    fontSize: 16,
    fontWeight: '600',
  },
  accountCard: {
    backgroundColor: '#FFFFFF',
    borderRadius: 12,
    padding: 16,
    marginBottom: 12,
    borderLeftWidth: 4,
    elevation: 2,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.05,
    shadowRadius: 2,
  },
  accountCardBlue: {
    borderLeftColor: '#3B82F6',
  },
  accountCardYellow: {
    borderLeftColor: '#F59E0B',
  },
  accountCardRed: {
    borderLeftColor: '#EF4444',
  },
  accountHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'flex-start',
    marginBottom: 12,
  },
  accountName: {
    fontSize: 18,
    fontWeight: 'bold',
    color: '#1F2937',
    flex: 1,
  },
  accountActions: {
    flexDirection: 'row',
    gap: 8,
  },
  iconButton: {
    padding: 4,
  },
  accountDetail: {
    fontSize: 14,
    color: '#6B7280',
    marginBottom: 4,
  },
  accountCategory: {
    fontSize: 14,
    color: '#3B82F6',
    marginBottom: 8,
  },
  accountBalance: {
    fontSize: 18,
    fontWeight: 'bold',
    color: '#1F2937',
  },
  balanceAmount: {
    color: '#4F46E5',
  },
  balanceYellow: {
    color: '#F59E0B',
  },
  balanceRed: {
    color: '#EF4444',
  },
  formCard: {
    backgroundColor: '#FFFFFF',
    borderRadius: 12,
    padding: 16,
    marginBottom: 24,
    elevation: 2,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.05,
    shadowRadius: 2,
  },
  formTitle: {
    fontSize: 16,
    fontWeight: 'bold',
    color: '#1F2937',
    marginBottom: 16,
  },
  formGroup: {
    marginBottom: 12,
  },
  label: {
    fontSize: 14,
    color: '#6B7280',
    marginBottom: 4,
  },
  input: {
    borderWidth: 1,
    borderColor: '#D1D5DB',
    borderRadius: 8,
    paddingHorizontal: 16,
    paddingVertical: 10,
    fontSize: 16,
    color: '#1F2937',
  },
  submitButton: {
    backgroundColor: '#4F46E5',
    borderRadius: 8,
    paddingVertical: 12,
    alignItems: 'center',
    marginTop: 4,
  },
  submitButtonText: {
    color: '#FFFFFF',
    fontSize: 16,
    fontWeight: '600',
  },
  listTitle: {
    fontSize: 18,
    fontWeight: 'bold',
    color: '#1F2937',
    marginBottom: 12,
  },
  categoryCard: {
    backgroundColor: '#FFFFFF',
    borderRadius: 12,
    padding: 16,
    marginBottom: 12,
    elevation: 2,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.05,
    shadowRadius: 2,
  },
  categoryHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'flex-start',
    marginBottom: 8,
  },
  categoryName: {
    fontSize: 16,
    fontWeight: '600',
    color: '#1F2937',
    flex: 1,
  },
  categoryActions: {
    flexDirection: 'row',
    gap: 8,
  },
  categoryInfo: {
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
  },
  infoCard: {
    backgroundColor: '#FFFFFF',
    borderRadius: 12,
    padding: 16,
    marginBottom: 24,
    elevation: 2,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.05,
    shadowRadius: 2,
  },
  infoRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    paddingVertical: 12,
    borderBottomWidth: 1,
    borderBottomColor: '#F3F4F6',
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
  settingsCard: {
    backgroundColor: '#FFFFFF',
    borderRadius: 12,
    padding: 16,
    marginBottom: 12,
    flexDirection: 'row',
    alignItems: 'center',
    gap: 12,
    elevation: 2,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.05,
    shadowRadius: 2,
  },
  settingsCardDanger: {
    backgroundColor: '#FEF2F2',
    borderWidth: 1,
    borderColor: '#FEE2E2',
  },
  settingsIcon: {
    fontSize: 24,
  },
  settingsContent: {
    flex: 1,
  },
  settingsTitle: {
    fontSize: 16,
    fontWeight: '600',
    color: '#1F2937',
    marginBottom: 4,
  },
  settingsTitleDanger: {
    color: '#DC2626',
  },
  settingsDescription: {
    fontSize: 14,
    color: '#6B7280',
  },
  settingsDescriptionDanger: {
    color: '#EF4444',
  },
  modalContainer: {
    flex: 1,
    backgroundColor: 'rgba(0, 0, 0, 0.5)',
    justifyContent: 'center',
    alignItems: 'center',
    padding: 20,
  },
  modalContent: {
    backgroundColor: '#FFFFFF',
    borderRadius: 16,
    padding: 24,
    width: '100%',
    maxWidth: 400,
    elevation: 5,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.25,
    shadowRadius: 4,
  },
  modalTitle: {
    fontSize: 20,
    fontWeight: 'bold',
    color: '#1F2937',
    marginBottom: 20,
    textAlign: 'center',
  },
  modalLabel: {
    fontSize: 14,
    color: '#6B7280',
    marginBottom: 8,
    fontWeight: '500',
  },
  modalInput: {
    borderWidth: 1,
    borderColor: '#D1D5DB',
    borderRadius: 8,
    paddingHorizontal: 16,
    paddingVertical: 12,
    fontSize: 16,
    color: '#1F2937',
    marginBottom: 16,
  },
  accountSelector: {
    marginBottom: 16,
    gap: 8,
  },
  accountOption: {
    borderWidth: 2,
    borderColor: '#E5E7EB',
    borderRadius: 8,
    padding: 12,
    backgroundColor: '#F9FAFB',
  },
  accountOptionSelected: {
    borderColor: '#4F46E5',
    backgroundColor: '#EEF2FF',
  },
  accountOptionText: {
    fontSize: 16,
    fontWeight: '600',
    color: '#1F2937',
    marginBottom: 4,
  },
  accountOptionTextSelected: {
    color: '#4F46E5',
  },
  accountOptionBalance: {
    fontSize: 14,
    color: '#6B7280',
  },
  selectedAccountInfo: {
    backgroundColor: '#EEF2FF',
    borderRadius: 8,
    padding: 12,
    marginBottom: 16,
  },
  selectedAccountName: {
    fontSize: 16,
    fontWeight: 'bold',
    color: '#4F46E5',
    marginBottom: 4,
  },
  selectedAccountBalance: {
    fontSize: 14,
    color: '#6B7280',
  },
  modalButtons: {
    flexDirection: 'row',
    gap: 12,
    marginTop: 8,
  },
  modalButton: {
    flex: 1,
    paddingVertical: 12,
    borderRadius: 8,
    alignItems: 'center',
    justifyContent: 'center',
  },
  modalButtonCancel: {
    backgroundColor: '#F3F4F6',
  },
  modalButtonConfirm: {
    backgroundColor: '#4F46E5',
  },
  modalButtonText: {
    color: '#FFFFFF',
    fontSize: 16,
    fontWeight: '600',
  },
  modalButtonTextCancel: {
    color: '#6B7280',
    fontSize: 16,
    fontWeight: '600',
  },
});
