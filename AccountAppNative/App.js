import React, { useState } from 'react';
import {
  StyleSheet,
  Text,
  View,
  ScrollView,
  TouchableOpacity,
  TextInput,
  Modal,
  Alert,
  SafeAreaView,
  StatusBar,
} from 'react-native';
import {
  Wallet,
  CreditCard,
  Plus,
  Minus,
  TrendingUp,
  TrendingDown,
  DollarSign,
  Settings,
  BarChart3,
  Users,
  Shield,
  Eye,
  EyeOff,
  Search,
  Filter,
  Download,
  Upload,
  Bell,
} from 'lucide-react-native';

export default function App() {
  const [activeTab, setActiveTab] = useState('dashboard');
  const [showModal, setShowModal] = useState(false);
  const [modalType, setModalType] = useState('');
  const [showPassword, setShowPassword] = useState(false);
  const [searchTerm, setSearchTerm] = useState('');
  const [filterType, setFilterType] = useState('all');
  
  // Enhanced database states
  const [accounts, setAccounts] = useState([
    { id: 1, name: 'Bank of Ceylon', type: 'bank', balance: 50000, currency: 'LKR', accountNumber: '1234567890' },
    { id: 2, name: 'Commercial Bank', type: 'bank', balance: 25000, currency: 'LKR', accountNumber: '0987654321' },
    { id: 3, name: 'Cash Wallet', type: 'cash', balance: 10000, currency: 'LKR' }
  ]);
  
  const [transactions, setTransactions] = useState([]);
  const [expenses, setExpenses] = useState([]);
  const [income, setIncome] = useState([]);
  const [budgets, setBudgets] = useState([]);
  const [notifications, setNotifications] = useState([]);
  
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

  const exportData = () => {
    const data = {
      accounts,
      transactions,
      income,
      expenses,
      exportDate: new Date().toISOString()
    };
    
    Alert.alert('Export', 'Data exported successfully!');
  };

  const renderDashboard = () => (
    <ScrollView style={styles.container}>
      {/* Header Stats */}
      <View style={styles.statsGrid}>
        <View style={[styles.statCard, styles.totalBalance]}>
          <View style={styles.statIcon}>
            <DollarSign color="#fff" size={24} />
          </View>
          <View style={styles.statContent}>
            <Text style={styles.statLabel}>මුළු ශේෂය</Text>
            <Text style={styles.statAmount}>{formatCurrency(getTotalBalance())}</Text>
          </View>
        </View>
        
        <View style={[styles.statCard, styles.accounts]}>
          <View style={styles.statIcon}>
            <CreditCard color="#fff" size={24} />
          </View>
          <View style={styles.statContent}>
            <Text style={styles.statLabel}>ගිණුම්</Text>
            <Text style={styles.statAmount}>{accounts.length}</Text>
          </View>
        </View>
        
        <View style={[styles.statCard, styles.monthlyIncome]}>
          <View style={styles.statIcon}>
            <TrendingUp color="#fff" size={24} />
          </View>
          <View style={styles.statContent}>
            <Text style={styles.statLabel}>මාසික ආදායම</Text>
            <Text style={styles.statAmount}>{formatCurrency(income.reduce((sum, item) => sum + item.amount, 0))}</Text>
          </View>
        </View>
        
        <View style={[styles.statCard, styles.monthlyExpenses]}>
          <View style={styles.statIcon}>
            <TrendingDown color="#fff" size={24} />
          </View>
          <View style={styles.statContent}>
            <Text style={styles.statLabel}>මාසික වියදම්</Text>
            <Text style={styles.statAmount}>{formatCurrency(expenses.reduce((sum, item) => sum + item.amount, 0))}</Text>
          </View>
        </View>
      </View>

      {/* Account Cards */}
      <View style={styles.accountsSection}>
        <View style={styles.sectionHeader}>
          <Text style={styles.sectionTitle}>ගිණුම්</Text>
          <TouchableOpacity style={styles.addAccountBtn} onPress={() => openModal('account')}>
            <Plus size={20} color="#fff" />
            <Text style={styles.addAccountText}>ගිණුමක් එකතු කරන්න</Text>
          </TouchableOpacity>
        </View>
        
        <View style={styles.accountsGrid}>
          {accounts.map(account => (
            <View key={account.id} style={styles.accountCard}>
              <View style={styles.accountHeader}>
                <View style={styles.accountIcon}>
                  {account.type === 'bank' ? 
                    <CreditCard color="#3B82F6" size={24} /> : 
                    <Wallet color="#10B981" size={24} />
                  }
                </View>
                <View style={styles.accountInfo}>
                  <Text style={styles.accountName}>{account.name}</Text>
                  <Text style={styles.accountNumber}>{account.type === 'bank' ? account.accountNumber : 'Cash Account'}</Text>
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
            <Plus size={20} color="#fff" />
            <Text style={styles.actionText}>ආදායම</Text>
          </TouchableOpacity>
          
          <TouchableOpacity style={[styles.actionBtn, styles.expenseBtn]} onPress={() => openModal('expense')}>
            <Minus size={20} color="#fff" />
            <Text style={styles.actionText}>වියදම</Text>
          </TouchableOpacity>
          
          <TouchableOpacity style={[styles.actionBtn, styles.transferBtn]} onPress={() => openModal('transfer')}>
            <TrendingUp size={20} color="#fff" />
            <Text style={styles.actionText}>මාරුව</Text>
          </TouchableOpacity>
        </View>
      </View>

      {/* Recent Transactions */}
      <View style={styles.recentTransactions}>
        <View style={styles.sectionHeader}>
          <Text style={styles.sectionTitle}>මෑත ගනුදෙනු</Text>
          <TouchableOpacity style={styles.viewAllBtn} onPress={() => setActiveTab('transactions')}>
            <Text style={styles.viewAllText}>සියල්ල බලන්න</Text>
          </TouchableOpacity>
        </View>
        
        <View style={styles.transactionsList}>
          {transactions.slice(0, 5).map(transaction => (
            <View key={transaction.id} style={styles.transactionItem}>
              <View style={styles.transactionIcon}>
                {transaction.type === 'income' ? 
                  <TrendingUp color="#10B981" size={20} /> : 
                  <TrendingDown color="#EF4444" size={20} />
                }
              </View>
              <View style={styles.transactionDetails}>
                <Text style={styles.transactionDescription}>{transaction.description}</Text>
                <Text style={styles.transactionAccount}>{transaction.accountName}</Text>
                <Text style={styles.transactionDate}>{transaction.date}</Text>
              </View>
              <View style={styles.transactionAmount}>
                <Text style={[styles.amount, transaction.type === 'income' ? styles.positive : styles.negative]}>
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
    <ScrollView style={styles.container}>
      <View style={styles.pageHeader}>
        <Text style={styles.pageTitle}>ගිණුම් කළමනාකරණය</Text>
        <View style={styles.headerActions}>
          <View style={styles.searchBox}>
            <Search size={20} color="#6b7280" />
            <TextInput 
              style={styles.searchInput}
              placeholder="ගිණුම් සොයන්න..."
              value={searchTerm}
              onChangeText={setSearchTerm}
            />
          </View>
          <TouchableOpacity style={styles.addBtn} onPress={() => openModal('account')}>
            <Plus size={20} color="#fff" />
          </TouchableOpacity>
        </View>
      </View>
      
      <View style={styles.accountsList}>
        {accounts.map(account => (
          <View key={account.id} style={styles.accountListItem}>
            <View style={styles.accountDetails}>
              <View style={styles.accountIcon}>
                {account.type === 'bank' ? 
                  <CreditCard color="#3B82F6" size={24} /> : 
                  <Wallet color="#10B981" size={24} />
                }
              </View>
              <View style={styles.accountInfo}>
                <Text style={styles.accountName}>{account.name}</Text>
                <Text style={styles.accountNumber}>{account.type === 'bank' ? `Account: ${account.accountNumber}` : 'Cash Account'}</Text>
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
      </View>
    </ScrollView>
  );

  const renderTransactions = () => (
    <ScrollView style={styles.container}>
      <View style={styles.pageHeader}>
        <Text style={styles.pageTitle}>ගනුදෙනු</Text>
        <View style={styles.headerActions}>
          <View style={styles.filterDropdown}>
            <Filter size={20} color="#6b7280" />
            <TextInput 
              style={styles.filterInput}
              value={filterType}
              onChangeText={setFilterType}
              placeholder="සියල්ල"
            />
          </View>
          <TouchableOpacity style={styles.exportBtn} onPress={exportData}>
            <Download size={20} color="#fff" />
          </TouchableOpacity>
        </View>
      </View>
      
      <View style={styles.transactionsList}>
        {transactions.map(transaction => (
          <View key={transaction.id} style={styles.transactionListItem}>
            <View style={styles.transactionIcon}>
              {transaction.type === 'income' ? 
                <TrendingUp color="#10B981" size={20} /> : 
                <TrendingDown color="#EF4444" size={20} />
              }
            </View>
            <View style={styles.transactionInfo}>
              <Text style={styles.transactionDescription}>{transaction.description}</Text>
              <Text style={styles.transactionAccount}>{transaction.accountName} • {transaction.date}</Text>
              {transaction.category && <Text style={styles.category}>{transaction.category}</Text>}
            </View>
            <View style={styles.transactionAmount}>
              <Text style={[styles.amount, transaction.type === 'income' ? styles.positive : styles.negative]}>
                {transaction.type === 'income' ? '+' : '-'}{formatCurrency(transaction.amount)}
              </Text>
            </View>
          </View>
        ))}
      </View>
    </ScrollView>
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
                <Text style={styles.closeBtnText}>×</Text>
              </TouchableOpacity>
            </View>
            
            <View style={styles.modalBody}>
              <View style={styles.formGroup}>
                <Text style={styles.formLabel}>මුදල</Text>
                <View style={styles.inputGroup}>
                  <Text style={styles.currencySymbol}>රු.</Text>
                  <TextInput
                    style={styles.formInput}
                    value={formData.amount}
                    onChangeText={(text) => setFormData({...formData, amount: text})}
                    placeholder="0.00"
                    keyboardType="numeric"
                  />
                </View>
              </View>
              
              <View style={styles.formGroup}>
                <Text style={styles.formLabel}>විස්තරය</Text>
                <TextInput
                  style={styles.formInput}
                  value={formData.description}
                  onChangeText={(text) => setFormData({...formData, description: text})}
                  placeholder="විස්තරය ඇතුළත් කරන්න"
                />
              </View>
              
              <View style={styles.formGroup}>
                <Text style={styles.formLabel}>ගිණුම</Text>
                <TextInput
                  style={styles.formInput}
                  value={formData.accountId.toString()}
                  onChangeText={(text) => setFormData({...formData, accountId: parseInt(text) || 1})}
                  placeholder="ගිණුම තෝරන්න"
                />
              </View>
              
              <View style={styles.formGroup}>
                <Text style={styles.formLabel}>ගිණුම</Text>
                <TextInput
                  style={styles.formInput}
                  value={formData.date}
                  onChangeText={(text) => setFormData({...formData, date: text})}
                  placeholder="YYYY-MM-DD"
                />
              </View>
              
              <View style={styles.formGroup}>
                <Text style={styles.formLabel}>වර්ගය</Text>
                <TextInput
                  style={styles.formInput}
                  value={formData.category}
                  onChangeText={(text) => setFormData({...formData, category: text})}
                  placeholder="උදා: ආහාර, ප්‍රවාහන, රක්ෂණ"
                />
              </View>
              
              <View style={styles.formGroup}>
                <Text style={styles.formLabel}>සටහන්</Text>
                <TextInput
                  style={styles.formTextarea}
                  value={formData.notes}
                  onChangeText={(text) => setFormData({...formData, notes: text})}
                  placeholder="අමතර සටහන්..."
                  multiline
                  numberOfLines={3}
                />
              </View>
            </View>
            
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
      <StatusBar barStyle="dark-content" backgroundColor="#f8fafc" />
      
      {/* Top Navigation */}
      <View style={styles.topNav}>
        <View style={styles.navBrand}>
          <Wallet size={24} color="#1f2937" />
          <Text style={styles.navTitle}>ගිණුම් කළමනාකරණය</Text>
        </View>
        <View style={styles.navActions}>
          <TouchableOpacity style={styles.notificationBtn}>
            <Bell size={20} color="#6b7280" />
            <View style={styles.notificationBadge}>
              <Text style={styles.notificationBadgeText}>3</Text>
            </View>
          </TouchableOpacity>
          <TouchableOpacity style={styles.settingsBtn}>
            <Settings size={20} color="#6b7280" />
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
          <BarChart3 size={24} color={activeTab === 'dashboard' ? '#3b82f6' : '#6b7280'} />
          <Text style={[styles.navItemText, activeTab === 'dashboard' && styles.navItemTextActive]}>Dashboard</Text>
        </TouchableOpacity>
        
        <TouchableOpacity 
          style={[styles.navItem, activeTab === 'accounts' && styles.navItemActive]}
          onPress={() => setActiveTab('accounts')}
        >
          <CreditCard size={24} color={activeTab === 'accounts' ? '#3b82f6' : '#6b7280'} />
          <Text style={[styles.navItemText, activeTab === 'accounts' && styles.navItemTextActive]}>ගිණුම්</Text>
        </TouchableOpacity>
        
        <TouchableOpacity 
          style={[styles.navItem, activeTab === 'transactions' && styles.navItemActive]}
          onPress={() => setActiveTab('transactions')}
        >
          <TrendingUp size={24} color={activeTab === 'transactions' ? '#3b82f6' : '#6b7280'} />
          <Text style={[styles.navItemText, activeTab === 'transactions' && styles.navItemTextActive]}>ගනුදෙනු</Text>
        </TouchableOpacity>
      </View>
      
      {renderModal()}
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  app: {
    flex: 1,
    backgroundColor: '#f8fafc',
  },
  topNav: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    padding: 16,
    backgroundColor: '#fff',
    borderBottomWidth: 1,
    borderBottomColor: '#e5e7eb',
  },
  navBrand: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  navTitle: {
    fontSize: 20,
    fontWeight: 'bold',
    color: '#1f2937',
    marginLeft: 12,
  },
  navActions: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  notificationBtn: {
    position: 'relative',
    padding: 8,
    marginRight: 8,
  },
  notificationBadge: {
    position: 'absolute',
    top: 4,
    right: 4,
    backgroundColor: '#ef4444',
    borderRadius: 10,
    minWidth: 20,
    height: 20,
    justifyContent: 'center',
    alignItems: 'center',
  },
  notificationBadgeText: {
    color: '#fff',
    fontSize: 12,
    fontWeight: 'bold',
  },
  settingsBtn: {
    padding: 8,
  },
  mainContent: {
    flex: 1,
  },
  container: {
    flex: 1,
    padding: 16,
  },
  statsGrid: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    justifyContent: 'space-between',
    marginBottom: 24,
  },
  statCard: {
    width: '48%',
    backgroundColor: '#fff',
    borderRadius: 12,
    padding: 16,
    marginBottom: 12,
    flexDirection: 'row',
    alignItems: 'center',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
    elevation: 3,
  },
  totalBalance: {
    backgroundColor: '#3b82f6',
  },
  accounts: {
    backgroundColor: '#10b981',
  },
  monthlyIncome: {
    backgroundColor: '#f59e0b',
  },
  monthlyExpenses: {
    backgroundColor: '#ef4444',
  },
  statIcon: {
    width: 48,
    height: 48,
    borderRadius: 12,
    justifyContent: 'center',
    alignItems: 'center',
    marginRight: 12,
  },
  statContent: {
    flex: 1,
  },
  statLabel: {
    fontSize: 14,
    fontWeight: '600',
    color: '#fff',
    marginBottom: 4,
  },
  statAmount: {
    fontSize: 18,
    fontWeight: 'bold',
    color: '#fff',
  },
  accountsSection: {
    backgroundColor: '#fff',
    borderRadius: 12,
    padding: 16,
    marginBottom: 24,
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
    marginBottom: 16,
  },
  sectionTitle: {
    fontSize: 18,
    fontWeight: 'bold',
    color: '#1f2937',
  },
  addAccountBtn: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: '#3b82f6',
    paddingHorizontal: 12,
    paddingVertical: 8,
    borderRadius: 8,
  },
  addAccountText: {
    color: '#fff',
    fontWeight: '600',
    marginLeft: 4,
  },
  accountsGrid: {
    gap: 12,
  },
  accountCard: {
    backgroundColor: '#f9fafb',
    borderRadius: 12,
    padding: 16,
    borderWidth: 1,
    borderColor: '#e5e7eb',
  },
  accountHeader: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 12,
  },
  accountIcon: {
    width: 48,
    height: 48,
    backgroundColor: '#f3f4f6',
    borderRadius: 8,
    justifyContent: 'center',
    alignItems: 'center',
    marginRight: 12,
  },
  accountInfo: {
    flex: 1,
  },
  accountName: {
    fontSize: 16,
    fontWeight: '600',
    color: '#1f2937',
    marginBottom: 2,
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
    fontWeight: 'bold',
    color: '#1f2937',
    marginBottom: 2,
  },
  balanceCurrency: {
    fontSize: 14,
    color: '#6b7280',
  },
  quickActions: {
    backgroundColor: '#fff',
    borderRadius: 12,
    padding: 16,
    marginBottom: 24,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
    elevation: 3,
  },
  actionButtons: {
    flexDirection: 'row',
    justifyContent: 'space-between',
  },
  actionBtn: {
    flex: 1,
    alignItems: 'center',
    padding: 16,
    borderRadius: 12,
    marginHorizontal: 4,
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
  actionText: {
    color: '#fff',
    fontWeight: '600',
    marginTop: 4,
  },
  recentTransactions: {
    backgroundColor: '#fff',
    borderRadius: 12,
    padding: 16,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
    elevation: 3,
  },
  viewAllBtn: {
    borderWidth: 1,
    borderColor: '#d1d5db',
    paddingHorizontal: 12,
    paddingVertical: 6,
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
    backgroundColor: '#f9fafb',
    borderRadius: 12,
    padding: 12,
    borderWidth: 1,
    borderColor: '#e5e7eb',
  },
  transactionIcon: {
    width: 40,
    height: 40,
    backgroundColor: '#f3f4f6',
    borderRadius: 8,
    justifyContent: 'center',
    alignItems: 'center',
    marginRight: 12,
  },
  transactionDetails: {
    flex: 1,
  },
  transactionDescription: {
    fontSize: 16,
    fontWeight: '600',
    color: '#1f2937',
    marginBottom: 2,
  },
  transactionAccount: {
    fontSize: 14,
    color: '#6b7280',
    marginBottom: 2,
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
    fontWeight: 'bold',
  },
  positive: {
    color: '#10b981',
  },
  negative: {
    color: '#ef4444',
  },
  bottomNav: {
    flexDirection: 'row',
    backgroundColor: '#fff',
    borderTopWidth: 1,
    borderTopColor: '#e5e7eb',
    paddingVertical: 8,
  },
  navItem: {
    flex: 1,
    alignItems: 'center',
    paddingVertical: 8,
  },
  navItemActive: {
    backgroundColor: '#eff6ff',
  },
  navItemText: {
    fontSize: 12,
    color: '#6b7280',
    marginTop: 4,
  },
  navItemTextActive: {
    color: '#3b82f6',
    fontWeight: '600',
  },
  modalOverlay: {
    flex: 1,
    backgroundColor: 'rgba(0, 0, 0, 0.5)',
    justifyContent: 'center',
    alignItems: 'center',
    padding: 16,
  },
  modalContent: {
    backgroundColor: '#fff',
    borderRadius: 16,
    width: '100%',
    maxHeight: '80%',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.25,
    shadowRadius: 8,
    elevation: 8,
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
    fontWeight: 'bold',
    color: '#1f2937',
  },
  closeBtn: {
    padding: 4,
  },
  closeBtnText: {
    fontSize: 24,
    color: '#6b7280',
  },
  modalBody: {
    padding: 20,
  },
  formGroup: {
    marginBottom: 16,
  },
  formLabel: {
    fontSize: 14,
    fontWeight: '600',
    color: '#374151',
    marginBottom: 8,
  },
  formInput: {
    borderWidth: 2,
    borderColor: '#e5e7eb',
    borderRadius: 8,
    padding: 12,
    fontSize: 16,
    backgroundColor: '#f9fafb',
  },
  inputGroup: {
    flexDirection: 'row',
    alignItems: 'center',
    borderWidth: 2,
    borderColor: '#e5e7eb',
    borderRadius: 8,
    backgroundColor: '#f9fafb',
  },
  currencySymbol: {
    padding: 12,
    backgroundColor: '#e5e7eb',
    color: '#6b7280',
    fontWeight: '600',
  },
  formTextarea: {
    borderWidth: 2,
    borderColor: '#e5e7eb',
    borderRadius: 8,
    padding: 12,
    fontSize: 16,
    backgroundColor: '#f9fafb',
    height: 80,
    textAlignVertical: 'top',
  },
  modalFooter: {
    flexDirection: 'row',
    padding: 20,
    borderTopWidth: 1,
    borderTopColor: '#e5e7eb',
  },
  cancelBtn: {
    flex: 1,
    borderWidth: 2,
    borderColor: '#d1d5db',
    paddingVertical: 12,
    borderRadius: 8,
    marginRight: 8,
    alignItems: 'center',
  },
  cancelBtnText: {
    color: '#6b7280',
    fontWeight: '600',
  },
  confirmBtn: {
    flex: 1,
    backgroundColor: '#3b82f6',
    paddingVertical: 12,
    borderRadius: 8,
    marginLeft: 8,
    alignItems: 'center',
  },
  confirmBtnText: {
    color: '#fff',
    fontWeight: '600',
  },
  pageHeader: {
    padding: 16,
    backgroundColor: '#fff',
    borderBottomWidth: 1,
    borderBottomColor: '#e5e7eb',
  },
  pageTitle: {
    fontSize: 24,
    fontWeight: 'bold',
    color: '#1f2937',
    marginBottom: 16,
  },
  headerActions: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  searchBox: {
    flex: 1,
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: '#f9fafb',
    borderRadius: 8,
    paddingHorizontal: 12,
    marginRight: 12,
  },
  searchInput: {
    flex: 1,
    paddingVertical: 12,
    marginLeft: 8,
    fontSize: 16,
  },
  addBtn: {
    backgroundColor: '#3b82f6',
    padding: 12,
    borderRadius: 8,
  },
  accountsList: {
    padding: 16,
  },
  accountListItem: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: '#fff',
    borderRadius: 12,
    padding: 16,
    marginBottom: 12,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
    elevation: 3,
  },
  accountDetails: {
    flex: 1,
    flexDirection: 'row',
    alignItems: 'center',
  },
  balance: {
    fontSize: 18,
    fontWeight: 'bold',
    color: '#1f2937',
    marginBottom: 2,
  },
  currency: {
    fontSize: 14,
    color: '#6b7280',
  },
  accountActions: {
    flexDirection: 'row',
  },
  actionBtnText: {
    color: '#3b82f6',
    fontWeight: '600',
    marginHorizontal: 8,
  },
  filterDropdown: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: '#f9fafb',
    borderRadius: 8,
    paddingHorizontal: 12,
    marginRight: 12,
  },
  filterInput: {
    paddingVertical: 12,
    marginLeft: 8,
    fontSize: 16,
    minWidth: 100,
  },
  exportBtn: {
    backgroundColor: '#10b981',
    padding: 12,
    borderRadius: 8,
  },
  transactionListItem: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: '#fff',
    borderRadius: 12,
    padding: 16,
    marginBottom: 12,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
    elevation: 3,
  },
  transactionInfo: {
    flex: 1,
    marginLeft: 12,
  },
  category: {
    fontSize: 12,
    color: '#6b7280',
    backgroundColor: '#f3f4f6',
    paddingHorizontal: 8,
    paddingVertical: 2,
    borderRadius: 4,
    alignSelf: 'flex-start',
    marginTop: 4,
  },
});