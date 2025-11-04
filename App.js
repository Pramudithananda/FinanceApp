import React, { useState, useEffect } from 'react';
import {
  View,
  Text,
  StyleSheet,
  ScrollView,
  TouchableOpacity,
  TextInput,
  Modal,
  Alert,
  StatusBar,
  SafeAreaView,
  Dimensions,
  Platform
} from 'react-native';
import Icon from 'react-native-vector-icons/MaterialIcons';

const { width, height } = Dimensions.get('window');

const App = () => {
  const [activeTab, setActiveTab] = useState('dashboard');
  const [showModal, setShowModal] = useState(false);
  const [modalType, setModalType] = useState('');
  const [searchTerm, setSearchTerm] = useState('');
  
  // Database states
  const [accounts, setAccounts] = useState([
    { id: 1, name: 'Bank of Ceylon', type: 'bank', balance: 50000, currency: 'LKR', accountNumber: '1234567890' },
    { id: 2, name: 'Commercial Bank', type: 'bank', balance: 25000, currency: 'LKR', accountNumber: '0987654321' },
    { id: 3, name: 'Cash Wallet', type: 'cash', balance: 10000, currency: 'LKR' }
  ]);
  
  const [transactions, setTransactions] = useState([]);
  const [expenses, setExpenses] = useState([]);
  const [income, setIncome] = useState([]);
  
  // Form states
  const [formData, setFormData] = useState({
    amount: '',
    description: '',
    date: new Date().toISOString().split('T')[0],
    accountId: 1,
    category: '',
    notes: ''
  });

  const formatCurrency = (amount) => {
    return `රු. ${amount.toLocaleString()}.00`;
  };

  const getTotalBalance = () => {
    return accounts.reduce((total, account) => total + account.balance, 0);
  };

  const getAccountById = (id) => {
    return accounts.find(account => account.id === id);
  };

  const handleTransaction = () => {
    const { amount, description, date, accountId, category, notes } = formData;
    const transactionAmount = parseFloat(amount);
    
    if (!transactionAmount || transactionAmount <= 0) {
      Alert.alert('Error', 'කරුණාකර වලංගු මුදලක් ඇතුළත් කරන්න');
      return;
    }

    const account = getAccountById(accountId);
    if (!account) return;

    const newTransaction = {
      id: Date.now(),
      type: modalType,
      amount: transactionAmount,
      description: description || 'Transaction',
      date: date,
      accountId: accountId,
      category: category,
      notes: notes,
      accountName: account.name
    };

    // Update account balance
    setAccounts(prev => prev.map(acc => 
      acc.id === accountId 
        ? { ...acc, balance: acc.balance + (modalType === 'income' ? transactionAmount : -transactionAmount) }
        : acc
    ));

    // Add to appropriate list
    if (modalType === 'income') {
      setIncome(prev => [newTransaction, ...prev]);
    } else if (modalType === 'expense') {
      setExpenses(prev => [newTransaction, ...prev]);
    }
    
    setTransactions(prev => [newTransaction, ...prev]);
    resetForm();
    setShowModal(false);
  };

  const resetForm = () => {
    setFormData({
      amount: '',
      description: '',
      date: new Date().toISOString().split('T')[0],
      accountId: 1,
      category: '',
      notes: ''
    });
  };

  const openModal = (type) => {
    setModalType(type);
    setShowModal(true);
    resetForm();
  };

  const renderDashboard = () => (
    <ScrollView style={styles.container} showsVerticalScrollIndicator={false}>
      {/* Header Stats */}
      <View style={styles.statsGrid}>
        <View style={[styles.statCard, styles.totalBalance]}>
          <View style={styles.statIcon}>
            <Icon name="account-balance-wallet" size={24} color="#fff" />
          </View>
          <View style={styles.statContent}>
            <Text style={styles.statTitle}>මුළු ශේෂය</Text>
            <Text style={styles.statAmount}>{formatCurrency(getTotalBalance())}</Text>
          </View>
        </View>
        
        <View style={[styles.statCard, styles.accounts]}>
          <View style={styles.statIcon}>
            <Icon name="account-balance" size={24} color="#fff" />
          </View>
          <View style={styles.statContent}>
            <Text style={styles.statTitle}>ගිණුම්</Text>
            <Text style={styles.statAmount}>{accounts.length}</Text>
          </View>
        </View>
        
        <View style={[styles.statCard, styles.monthlyIncome]}>
          <View style={styles.statIcon}>
            <Icon name="trending-up" size={24} color="#fff" />
          </View>
          <View style={styles.statContent}>
            <Text style={styles.statTitle}>මාසික ආදායම</Text>
            <Text style={styles.statAmount}>{formatCurrency(income.reduce((sum, item) => sum + item.amount, 0))}</Text>
          </View>
        </View>
        
        <View style={[styles.statCard, styles.monthlyExpenses]}>
          <View style={styles.statIcon}>
            <Icon name="trending-down" size={24} color="#fff" />
          </View>
          <View style={styles.statContent}>
            <Text style={styles.statTitle}>මාසික වියදම්</Text>
            <Text style={styles.statAmount}>{formatCurrency(expenses.reduce((sum, item) => sum + item.amount, 0))}</Text>
          </View>
        </View>
      </View>

      {/* Account Cards */}
      <View style={styles.accountsSection}>
        <View style={styles.sectionHeader}>
          <Text style={styles.sectionTitle}>ගිණුම්</Text>
          <TouchableOpacity style={styles.addAccountBtn} onPress={() => openModal('account')}>
            <Icon name="add" size={20} color="#fff" />
            <Text style={styles.addAccountText}>ගිණුමක් එකතු කරන්න</Text>
          </TouchableOpacity>
        </View>
        
        <View style={styles.accountsGrid}>
          {accounts.map(account => (
            <View key={account.id} style={styles.accountCard}>
              <View style={styles.accountHeader}>
                <View style={styles.accountIcon}>
                  {account.type === 'bank' ? 
                    <Icon name="account-balance" size={24} color="#3B82F6" /> : 
                    <Icon name="account-balance-wallet" size={24} color="#10B981" />
                  }
                </View>
                <View style={styles.accountInfo}>
                  <Text style={styles.accountName}>{account.name}</Text>
                  <Text style={styles.accountNumber}>
                    {account.type === 'bank' ? account.accountNumber : 'Cash Account'}
                  </Text>
                </View>
              </View>
              <View style={styles.accountBalance}>
                <Text style={styles.balanceAmount}>{formatCurrency(account.balance)}</Text>
                <Text style={styles.balanceCurrency}>{account.currency}</Text>
              </View>
            </View>
          ))}
        </View>
      </View>

      {/* Quick Actions */}
      <View style={styles.quickActions}>
        <Text style={styles.sectionTitle}>ක්‍රියාවන්</Text>
        <View style={styles.actionButtons}>
          <TouchableOpacity style={[styles.actionBtn, styles.incomeBtn]} onPress={() => openModal('income')}>
            <Icon name="add" size={20} color="#fff" />
            <Text style={styles.actionBtnText}>ආදායම</Text>
          </TouchableOpacity>
          
          <TouchableOpacity style={[styles.actionBtn, styles.expenseBtn]} onPress={() => openModal('expense')}>
            <Icon name="remove" size={20} color="#fff" />
            <Text style={styles.actionBtnText}>වියදම</Text>
          </TouchableOpacity>
          
          <TouchableOpacity style={[styles.actionBtn, styles.transferBtn]} onPress={() => openModal('transfer')}>
            <Icon name="swap-horiz" size={20} color="#fff" />
            <Text style={styles.actionBtnText}>මාරුව</Text>
          </TouchableOpacity>
        </View>
      </View>

      {/* Recent Transactions */}
      <View style={styles.recentTransactions}>
        <View style={styles.sectionHeader}>
          <Text style={styles.sectionTitle}>මෑත ගනුදෙනු</Text>
          <TouchableOpacity style={styles.viewAllBtn}>
            <Text style={styles.viewAllText}>සියල්ල බලන්න</Text>
          </TouchableOpacity>
        </View>
        
        <View style={styles.transactionsList}>
          {transactions.slice(0, 5).map(transaction => (
            <View key={transaction.id} style={styles.transactionItem}>
              <View style={styles.transactionIcon}>
                {transaction.type === 'income' ? 
                  <Icon name="trending-up" size={20} color="#10B981" /> : 
                  <Icon name="trending-down" size={20} color="#EF4444" />
                }
              </View>
              <View style={styles.transactionDetails}>
                <Text style={styles.transactionDescription}>{transaction.description}</Text>
                <Text style={styles.transactionAccount}>{transaction.accountName}</Text>
                <Text style={styles.transactionDate}>{transaction.date}</Text>
              </View>
              <View style={styles.transactionAmount}>
                <Text style={[
                  styles.amount,
                  transaction.type === 'income' ? styles.positive : styles.negative
                ]}>
                  {transaction.type === 'income' ? '+' : '-'}{formatCurrency(transaction.amount)}
                </Text>
              </View>
            </View>
          ))}
        </View>
      </View>
    </ScrollView>
  );

  const renderAccounts = () => (
    <View style={styles.pageContainer}>
      <View style={styles.pageHeader}>
        <Text style={styles.pageTitle}>ගිණුම් කළමනාකරණය</Text>
        <View style={styles.headerActions}>
          <View style={styles.searchBox}>
            <Icon name="search" size={20} color="#6B7280" />
            <TextInput
              style={styles.searchInput}
              placeholder="ගිණුම් සොයන්න..."
              value={searchTerm}
              onChangeText={setSearchTerm}
            />
          </View>
          <TouchableOpacity style={styles.addBtn} onPress={() => openModal('account')}>
            <Icon name="add" size={20} color="#fff" />
          </TouchableOpacity>
        </View>
      </View>
      
      <ScrollView style={styles.accountsList}>
        {accounts.map(account => (
          <View key={account.id} style={styles.accountListItem}>
            <View style={styles.accountDetails}>
              <View style={styles.accountIcon}>
                {account.type === 'bank' ? 
                  <Icon name="account-balance" size={24} color="#3B82F6" /> : 
                  <Icon name="account-balance-wallet" size={24} color="#10B981" />
                }
              </View>
              <View style={styles.accountInfo}>
                <Text style={styles.accountName}>{account.name}</Text>
                <Text style={styles.accountNumber}>
                  {account.type === 'bank' ? `Account: ${account.accountNumber}` : 'Cash Account'}
                </Text>
              </View>
            </View>
            <View style={styles.accountBalance}>
              <Text style={styles.balance}>{formatCurrency(account.balance)}</Text>
              <Text style={styles.currency}>{account.currency}</Text>
            </View>
            <View style={styles.accountActions}>
              <TouchableOpacity style={styles.actionBtn}>
                <Text style={styles.actionBtnText}>Edit</Text>
              </TouchableOpacity>
              <TouchableOpacity style={styles.actionBtn}>
                <Text style={styles.actionBtnText}>View</Text>
              </TouchableOpacity>
            </View>
          </View>
        ))}
      </ScrollView>
    </View>
  );

  const renderTransactions = () => (
    <View style={styles.pageContainer}>
      <View style={styles.pageHeader}>
        <Text style={styles.pageTitle}>ගනුදෙනු</Text>
        <View style={styles.headerActions}>
          <TouchableOpacity style={styles.exportBtn}>
            <Icon name="file-download" size={20} color="#fff" />
          </TouchableOpacity>
        </View>
      </View>
      
      <ScrollView style={styles.transactionsList}>
        {transactions.map(transaction => (
          <View key={transaction.id} style={styles.transactionListItem}>
            <View style={styles.transactionIcon}>
              {transaction.type === 'income' ? 
                <Icon name="trending-up" size={20} color="#10B981" /> : 
                <Icon name="trending-down" size={20} color="#EF4444" />
              }
            </View>
            <View style={styles.transactionInfo}>
              <Text style={styles.transactionDescription}>{transaction.description}</Text>
              <Text style={styles.transactionAccount}>{transaction.accountName} • {transaction.date}</Text>
              {transaction.category && <Text style={styles.category}>{transaction.category}</Text>}
            </View>
            <View style={styles.transactionAmount}>
              <Text style={[
                styles.amount,
                transaction.type === 'income' ? styles.positive : styles.negative
              ]}>
                {transaction.type === 'income' ? '+' : '-'}{formatCurrency(transaction.amount)}
              </Text>
            </View>
          </View>
        ))}
      </ScrollView>
    </View>
  );

  const renderModal = () => {
    if (!showModal) return null;
    
    return (
      <Modal
        visible={showModal}
        animationType="slide"
        transparent={true}
        onRequestClose={() => setShowModal(false)}
      >
        <View style={styles.modalOverlay}>
          <View style={styles.modalContent}>
            <View style={styles.modalHeader}>
              <Text style={styles.modalTitle}>
                {modalType === 'income' && 'ආදායම එකතු කරන්න'}
                {modalType === 'expense' && 'වියදම එකතු කරන්න'}
                {modalType === 'transfer' && 'මාරුවක් කරන්න'}
                {modalType === 'account' && 'නව ගිණුමක් එකතු කරන්න'}
              </Text>
              <TouchableOpacity style={styles.closeBtn} onPress={() => setShowModal(false)}>
                <Icon name="close" size={24} color="#6B7280" />
              </TouchableOpacity>
            </View>
            
            <ScrollView style={styles.modalBody}>
              <View style={styles.formGroup}>
                <Text style={styles.label}>මුදල</Text>
                <View style={styles.inputGroup}>
                  <Text style={styles.currencySymbol}>රු.</Text>
                  <TextInput
                    style={styles.input}
                    value={formData.amount}
                    onChangeText={(text) => setFormData({...formData, amount: text})}
                    placeholder="0.00"
                    keyboardType="numeric"
                  />
                </View>
              </View>
              
              <View style={styles.formGroup}>
                <Text style={styles.label}>විස්තරය</Text>
                <TextInput
                  style={styles.input}
                  value={formData.description}
                  onChangeText={(text) => setFormData({...formData, description: text})}
                  placeholder="විස්තරය ඇතුළත් කරන්න"
                />
              </View>
              
              <View style={styles.formGroup}>
                <Text style={styles.label}>ගිණුම</Text>
                <View style={styles.selectContainer}>
                  {accounts.map(account => (
                    <TouchableOpacity
                      key={account.id}
                      style={[
                        styles.selectOption,
                        formData.accountId === account.id && styles.selectOptionActive
                      ]}
                      onPress={() => setFormData({...formData, accountId: account.id})}
                    >
                      <Text style={[
                        styles.selectOptionText,
                        formData.accountId === account.id && styles.selectOptionTextActive
                      ]}>
                        {account.name} - {formatCurrency(account.balance)}
                      </Text>
                    </TouchableOpacity>
                  ))}
                </View>
              </View>
              
              <View style={styles.formGroup}>
                <Text style={styles.label}>ගිණුම</Text>
                <TextInput
                  style={styles.input}
                  value={formData.date}
                  onChangeText={(text) => setFormData({...formData, date: text})}
                  placeholder="YYYY-MM-DD"
                />
              </View>
              
              <View style={styles.formGroup}>
                <Text style={styles.label}>වර්ගය</Text>
                <TextInput
                  style={styles.input}
                  value={formData.category}
                  onChangeText={(text) => setFormData({...formData, category: text})}
                  placeholder="උදා: ආහාර, ප්‍රවාහන, රක්ෂණ"
                />
              </View>
              
              <View style={styles.formGroup}>
                <Text style={styles.label}>සටහන්</Text>
                <TextInput
                  style={[styles.input, styles.textarea]}
                  value={formData.notes}
                  onChangeText={(text) => setFormData({...formData, notes: text})}
                  placeholder="අමතර සටහන්..."
                  multiline
                  numberOfLines={3}
                />
              </View>
            </ScrollView>
            
            <View style={styles.modalFooter}>
              <TouchableOpacity style={styles.cancelBtn} onPress={() => setShowModal(false)}>
                <Text style={styles.cancelBtnText}>අවලංගු කරන්න</Text>
              </TouchableOpacity>
              <TouchableOpacity style={styles.confirmBtn} onPress={handleTransaction}>
                <Text style={styles.confirmBtnText}>තහවුරු කරන්න</Text>
              </TouchableOpacity>
            </View>
          </View>
        </View>
      </Modal>
    );
  };

  return (
    <SafeAreaView style={styles.app}>
      <StatusBar barStyle="dark-content" backgroundColor="#667eea" />
      
      {/* Top Navigation */}
      <View style={styles.topNav}>
        <View style={styles.navBrand}>
          <Icon name="account-balance-wallet" size={24} color="#1f2937" />
          <Text style={styles.navTitle}>ගිණුම් කළමනාකරණය</Text>
        </View>
        <View style={styles.navActions}>
          <TouchableOpacity style={styles.notificationBtn}>
            <Icon name="notifications" size={20} color="#6b7280" />
            <View style={styles.notificationBadge}>
              <Text style={styles.notificationBadgeText}>3</Text>
            </View>
          </TouchableOpacity>
          <TouchableOpacity style={styles.settingsBtn}>
            <Icon name="settings" size={20} color="#6b7280" />
          </TouchableOpacity>
        </View>
      </View>

      {/* Main Content */}
      <View style={styles.mainContent}>
        {activeTab === 'dashboard' && renderDashboard()}
        {activeTab === 'accounts' && renderAccounts()}
        {activeTab === 'transactions' && renderTransactions()}
      </View>
      
      {/* Bottom Navigation */}
      <View style={styles.bottomNav}>
        <TouchableOpacity 
          style={[styles.navItem, activeTab === 'dashboard' && styles.navItemActive]}
          onPress={() => setActiveTab('dashboard')}
        >
          <Icon 
            name="dashboard" 
            size={24} 
            color={activeTab === 'dashboard' ? '#3b82f6' : '#9ca3af'} 
          />
          <Text style={[styles.navText, activeTab === 'dashboard' && styles.navTextActive]}>
            Dashboard
          </Text>
        </TouchableOpacity>
        
        <TouchableOpacity 
          style={[styles.navItem, activeTab === 'accounts' && styles.navItemActive]}
          onPress={() => setActiveTab('accounts')}
        >
          <Icon 
            name="account-balance" 
            size={24} 
            color={activeTab === 'accounts' ? '#3b82f6' : '#9ca3af'} 
          />
          <Text style={[styles.navText, activeTab === 'accounts' && styles.navTextActive]}>
            ගිණුම්
          </Text>
        </TouchableOpacity>
        
        <TouchableOpacity 
          style={[styles.navItem, activeTab === 'transactions' && styles.navItemActive]}
          onPress={() => setActiveTab('transactions')}
        >
          <Icon 
            name="trending-up" 
            size={24} 
            color={activeTab === 'transactions' ? '#3b82f6' : '#9ca3af'} 
          />
          <Text style={[styles.navText, activeTab === 'transactions' && styles.navTextActive]}>
            ගනුදෙනු
          </Text>
        </TouchableOpacity>
      </View>
      
      {renderModal()}
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  app: {
    flex: 1,
    backgroundColor: '#667eea',
  },
  topNav: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    paddingHorizontal: 20,
    paddingVertical: 15,
    backgroundColor: 'rgba(255, 255, 255, 0.95)',
    borderBottomWidth: 1,
    borderBottomColor: 'rgba(255, 255, 255, 0.2)',
  },
  navBrand: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 10,
  },
  navTitle: {
    fontSize: 18,
    fontWeight: '700',
    color: '#1f2937',
  },
  navActions: {
    flexDirection: 'row',
    gap: 15,
  },
  notificationBtn: {
    position: 'relative',
    padding: 8,
  },
  notificationBadge: {
    position: 'absolute',
    top: 0,
    right: 0,
    backgroundColor: '#ef4444',
    borderRadius: 10,
    minWidth: 20,
    height: 20,
    justifyContent: 'center',
    alignItems: 'center',
  },
  notificationBadgeText: {
    color: 'white',
    fontSize: 12,
    fontWeight: '600',
  },
  settingsBtn: {
    padding: 8,
  },
  mainContent: {
    flex: 1,
    paddingBottom: 80,
  },
  container: {
    flex: 1,
    padding: 20,
  },
  statsGrid: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: 15,
    marginBottom: 20,
  },
  statCard: {
    flex: 1,
    minWidth: width * 0.4,
    backgroundColor: 'rgba(255, 255, 255, 0.95)',
    borderRadius: 15,
    padding: 20,
    flexDirection: 'row',
    alignItems: 'center',
    gap: 15,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
    elevation: 3,
  },
  totalBalance: {
    backgroundColor: 'rgba(59, 130, 246, 0.1)',
  },
  accounts: {
    backgroundColor: 'rgba(16, 185, 129, 0.1)',
  },
  monthlyIncome: {
    backgroundColor: 'rgba(245, 158, 11, 0.1)',
  },
  monthlyExpenses: {
    backgroundColor: 'rgba(239, 68, 68, 0.1)',
  },
  statIcon: {
    width: 50,
    height: 50,
    borderRadius: 12,
    justifyContent: 'center',
    alignItems: 'center',
  },
  totalBalance .statIcon: {
    backgroundColor: '#3b82f6',
  },
  accounts .statIcon: {
    backgroundColor: '#10b981',
  },
  monthlyIncome .statIcon: {
    backgroundColor: '#f59e0b',
  },
  monthlyExpenses .statIcon: {
    backgroundColor: '#ef4444',
  },
  statContent: {
    flex: 1,
  },
  statTitle: {
    fontSize: 14,
    fontWeight: '600',
    color: '#6b7280',
    marginBottom: 5,
  },
  statAmount: {
    fontSize: 18,
    fontWeight: '700',
    color: '#1f2937',
  },
  accountsSection: {
    backgroundColor: 'rgba(255, 255, 255, 0.95)',
    borderRadius: 15,
    padding: 20,
    marginBottom: 20,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
    elevation: 3,
  },
  sectionHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: 15,
  },
  sectionTitle: {
    fontSize: 20,
    fontWeight: '700',
    color: '#1f2937',
  },
  addAccountBtn: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 8,
    backgroundColor: '#3b82f6',
    paddingHorizontal: 15,
    paddingVertical: 10,
    borderRadius: 8,
  },
  addAccountText: {
    color: 'white',
    fontWeight: '600',
    fontSize: 14,
  },
  accountsGrid: {
    gap: 15,
  },
  accountCard: {
    backgroundColor: 'white',
    borderRadius: 12,
    padding: 20,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.1,
    shadowRadius: 2,
    elevation: 2,
  },
  accountHeader: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 15,
    marginBottom: 15,
  },
  accountIcon: {
    width: 50,
    height: 50,
    backgroundColor: '#f3f4f6',
    borderRadius: 8,
    justifyContent: 'center',
    alignItems: 'center',
  },
  accountInfo: {
    flex: 1,
  },
  accountName: {
    fontSize: 16,
    fontWeight: '600',
    color: '#1f2937',
    marginBottom: 5,
  },
  accountNumber: {
    fontSize: 14,
    color: '#6b7280',
  },
  accountBalance: {
    alignItems: 'flex-end',
  },
  balanceAmount: {
    fontSize: 18,
    fontWeight: '700',
    color: '#1f2937',
    marginBottom: 5,
  },
  balanceCurrency: {
    fontSize: 14,
    color: '#6b7280',
  },
  quickActions: {
    backgroundColor: 'rgba(255, 255, 255, 0.95)',
    borderRadius: 15,
    padding: 20,
    marginBottom: 20,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
    elevation: 3,
  },
  actionButtons: {
    flexDirection: 'row',
    gap: 15,
  },
  actionBtn: {
    flex: 1,
    alignItems: 'center',
    padding: 20,
    borderRadius: 12,
    gap: 10,
  },
  incomeBtn: {
    backgroundColor: '#10b981',
  },
  expenseBtn: {
    backgroundColor: '#ef4444',
  },
  transferBtn: {
    backgroundColor: '#f59e0b',
  },
  actionBtnText: {
    color: 'white',
    fontWeight: '600',
    fontSize: 14,
  },
  recentTransactions: {
    backgroundColor: 'rgba(255, 255, 255, 0.95)',
    borderRadius: 15,
    padding: 20,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
    elevation: 3,
  },
  viewAllBtn: {
    borderWidth: 1,
    borderColor: '#d1d5db',
    paddingHorizontal: 15,
    paddingVertical: 8,
    borderRadius: 8,
  },
  viewAllText: {
    color: '#6b7280',
    fontSize: 14,
  },
  transactionsList: {
    gap: 12,
  },
  transactionItem: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 15,
    padding: 15,
    backgroundColor: 'white',
    borderRadius: 12,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.1,
    shadowRadius: 2,
    elevation: 2,
  },
  transactionIcon: {
    width: 40,
    height: 40,
    backgroundColor: '#f3f4f6',
    borderRadius: 8,
    justifyContent: 'center',
    alignItems: 'center',
  },
  transactionDetails: {
    flex: 1,
  },
  transactionDescription: {
    fontSize: 16,
    fontWeight: '600',
    color: '#1f2937',
    marginBottom: 5,
  },
  transactionAccount: {
    fontSize: 14,
    color: '#6b7280',
    marginBottom: 3,
  },
  transactionDate: {
    fontSize: 12,
    color: '#9ca3af',
  },
  transactionAmount: {
    alignItems: 'flex-end',
  },
  amount: {
    fontSize: 16,
    fontWeight: '700',
  },
  positive: {
    color: '#10b981',
  },
  negative: {
    color: '#ef4444',
  },
  pageContainer: {
    flex: 1,
    padding: 20,
  },
  pageHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: 20,
  },
  pageTitle: {
    fontSize: 24,
    fontWeight: '700',
    color: 'white',
  },
  headerActions: {
    flexDirection: 'row',
    gap: 15,
  },
  searchBox: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: 'rgba(255, 255, 255, 0.95)',
    borderRadius: 8,
    paddingHorizontal: 15,
    paddingVertical: 10,
    gap: 10,
  },
  searchInput: {
    flex: 1,
    fontSize: 16,
  },
  addBtn: {
    backgroundColor: '#3b82f6',
    padding: 10,
    borderRadius: 8,
  },
  exportBtn: {
    backgroundColor: '#10b981',
    padding: 10,
    borderRadius: 8,
  },
  accountsList: {
    flex: 1,
  },
  accountListItem: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: 'rgba(255, 255, 255, 0.95)',
    borderRadius: 12,
    padding: 20,
    marginBottom: 15,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
    elevation: 3,
  },
  accountDetails: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 15,
    flex: 1,
  },
  accountBalance: {
    alignItems: 'flex-end',
    marginRight: 15,
  },
  balance: {
    fontSize: 16,
    fontWeight: '700',
    color: '#1f2937',
  },
  currency: {
    fontSize: 12,
    color: '#6b7280',
  },
  accountActions: {
    flexDirection: 'row',
    gap: 10,
  },
  transactionListItem: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: 'rgba(255, 255, 255, 0.95)',
    borderRadius: 12,
    padding: 20,
    marginBottom: 15,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
    elevation: 3,
  },
  transactionInfo: {
    flex: 1,
    marginLeft: 15,
  },
  category: {
    fontSize: 12,
    color: '#6b7280',
    backgroundColor: '#f3f4f6',
    paddingHorizontal: 8,
    paddingVertical: 4,
    borderRadius: 4,
    alignSelf: 'flex-start',
    marginTop: 5,
  },
  bottomNav: {
    position: 'absolute',
    bottom: 0,
    left: 0,
    right: 0,
    backgroundColor: 'rgba(255, 255, 255, 0.95)',
    flexDirection: 'row',
    paddingVertical: 10,
    paddingHorizontal: 20,
    borderTopWidth: 1,
    borderTopColor: 'rgba(255, 255, 255, 0.2)',
  },
  navItem: {
    flex: 1,
    alignItems: 'center',
    paddingVertical: 8,
    borderRadius: 8,
  },
  navItemActive: {
    backgroundColor: 'rgba(59, 130, 246, 0.1)',
  },
  navText: {
    fontSize: 12,
    fontWeight: '500',
    color: '#9ca3af',
    marginTop: 5,
  },
  navTextActive: {
    color: '#3b82f6',
    fontWeight: '600',
  },
  modalOverlay: {
    flex: 1,
    backgroundColor: 'rgba(0, 0, 0, 0.6)',
    justifyContent: 'center',
    alignItems: 'center',
    padding: 20,
  },
  modalContent: {
    backgroundColor: 'white',
    borderRadius: 15,
    width: '100%',
    maxHeight: '90%',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 20 },
    shadowOpacity: 0.25,
    shadowRadius: 20,
    elevation: 10,
  },
  modalHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    padding: 20,
    borderBottomWidth: 1,
    borderBottomColor: '#e5e7eb',
  },
  modalTitle: {
    fontSize: 18,
    fontWeight: '700',
    color: '#1f2937',
  },
  closeBtn: {
    padding: 5,
  },
  modalBody: {
    padding: 20,
  },
  formGroup: {
    marginBottom: 20,
  },
  label: {
    fontSize: 14,
    fontWeight: '600',
    color: '#374151',
    marginBottom: 8,
  },
  input: {
    borderWidth: 2,
    borderColor: '#e5e7eb',
    borderRadius: 8,
    padding: 12,
    fontSize: 16,
    backgroundColor: '#f9fafb',
  },
  textarea: {
    height: 80,
    textAlignVertical: 'top',
  },
  inputGroup: {
    flexDirection: 'row',
    alignItems: 'center',
    borderWidth: 2,
    borderColor: '#e5e7eb',
    borderRadius: 8,
    backgroundColor: '#f9fafb',
    overflow: 'hidden',
  },
  currencySymbol: {
    padding: 12,
    backgroundColor: '#e5e7eb',
    color: '#6b7280',
    fontWeight: '600',
  },
  selectContainer: {
    gap: 10,
  },
  selectOption: {
    padding: 12,
    borderWidth: 2,
    borderColor: '#e5e7eb',
    borderRadius: 8,
    backgroundColor: '#f9fafb',
  },
  selectOptionActive: {
    borderColor: '#3b82f6',
    backgroundColor: '#3b82f6',
  },
  selectOptionText: {
    fontSize: 16,
    color: '#374151',
  },
  selectOptionTextActive: {
    color: 'white',
    fontWeight: '600',
  },
  modalFooter: {
    flexDirection: 'row',
    gap: 15,
    padding: 20,
    borderTopWidth: 1,
    borderTopColor: '#e5e7eb',
  },
  cancelBtn: {
    flex: 1,
    padding: 12,
    borderWidth: 2,
    borderColor: '#d1d5db',
    borderRadius: 8,
    backgroundColor: 'white',
    alignItems: 'center',
  },
  cancelBtnText: {
    color: '#6b7280',
    fontWeight: '600',
    fontSize: 16,
  },
  confirmBtn: {
    flex: 1,
    padding: 12,
    backgroundColor: '#3b82f6',
    borderRadius: 8,
    alignItems: 'center',
  },
  confirmBtnText: {
    color: 'white',
    fontWeight: '600',
    fontSize: 16,
  },
});

export default App;