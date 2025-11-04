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
  Dimensions,
  StatusBar,
} from 'react-native';
import LinearGradient from 'react-native-linear-gradient';
import Icon from 'react-native-vector-icons/Feather';
import AsyncStorage from '@react-native-async-storage/async-storage';

const { width, height } = Dimensions.get('window');

const AccountManagerApp = () => {
  const [activeTab, setActiveTab] = useState('dashboard');
  const [showModal, setShowModal] = useState(false);
  const [modalType, setModalType] = useState('');
  const [searchQuery, setSearchQuery] = useState('');

  // User Profile
  const [userProfile, setUserProfile] = useState({
    name: 'අමිල රණසිංහ',
    email: 'amila@example.com',
    currency: 'LKR'
  });

  // Account States
  const [accounts, setAccounts] = useState({
    bank: { balance: 50000, name: 'Commercial Bank', number: '1234-5678-9012' },
    cash: { balance: 10000, name: 'මාර්ගස්ථ මුදල්' },
    savings: { balance: 25000, name: 'Savings Account', number: '9876-5432-1098' }
  });

  const [transactions, setTransactions] = useState([]);
  const [categories, setCategories] = useState({
    income: ['වැටුප', 'ව්‍යාපාරික ආදායම', 'ආයෝජන', 'වෙනත්'],
    expense: ['ආහාර', 'ප්‍රවාහන', 'බලශක්ති', 'සන්නිවේදන', 'සෞඛ්‍ය', 'අධ්‍යාපන', 'විනෝදාස්වාද', 'වෙනත්']
  });

  // Form States
  const [formData, setFormData] = useState({
    amount: '',
    description: '',
    date: new Date().toISOString().split('T')[0],
    accountType: 'bank',
    category: '',
    type: 'income'
  });

  // Load data from storage
  useEffect(() => {
    loadData();
  }, []);

  const loadData = async () => {
    try {
      const savedAccounts = await AsyncStorage.getItem('accounts');
      const savedTransactions = await AsyncStorage.getItem('transactions');
      
      if (savedAccounts) {
        setAccounts(JSON.parse(savedAccounts));
      }
      if (savedTransactions) {
        setTransactions(JSON.parse(savedTransactions));
      }
    } catch (error) {
      console.log('Error loading data:', error);
    }
  };

  // Save data to storage
  const saveData = async () => {
    try {
      await AsyncStorage.setItem('accounts', JSON.stringify(accounts));
      await AsyncStorage.setItem('transactions', JSON.stringify(transactions));
    } catch (error) {
      console.log('Error saving data:', error);
    }
  };

  const formatCurrency = (amount) => {
    return `රු. ${amount.toLocaleString()}.00`;
  };

  const getTotalBalance = () => {
    return Object.values(accounts).reduce((total, account) => total + account.balance, 0);
  };

  const getMonthlyStats = () => {
    const currentMonth = new Date().getMonth();
    const currentYear = new Date().getFullYear();
    
    const monthlyTransactions = transactions.filter(t => {
      const transactionDate = new Date(t.date);
      return transactionDate.getMonth() === currentMonth && 
             transactionDate.getFullYear() === currentYear;
    });
    
    const income = monthlyTransactions
      .filter(t => t.type === 'income')
      .reduce((sum, t) => sum + t.amount, 0);
    
    const expenses = monthlyTransactions
      .filter(t => t.type === 'expense')
      .reduce((sum, t) => sum + t.amount, 0);
    
    return { income, expenses, net: income - expenses };
  };

  const handleTransaction = () => {
    const { amount, description, date, accountType, category, type } = formData;
    const transactionAmount = parseFloat(amount);
    
    if (!transactionAmount || transactionAmount <= 0) {
      Alert.alert('දෝෂය', 'කරුණාකර වලංගු මුදලක් ඇතුළත් කරන්න');
      return;
    }

    const newTransaction = {
      id: Date.now(),
      type,
      amount: transactionAmount,
      description: description || (type === 'income' ? 'ආදායම' : 'වියදම'),
      date,
      accountType,
      category: category || (type === 'income' ? categories.income[0] : categories.expense[0])
    };

    // Update account balance
    setAccounts(prev => ({
      ...prev,
      [accountType]: {
        ...prev[accountType],
        balance: prev[accountType].balance + (type === 'income' ? transactionAmount : -transactionAmount)
      }
    }));

    setTransactions(prev => [newTransaction, ...prev]);
    resetForm();
    setShowModal(false);
    
    // Save data
    setTimeout(saveData, 100);
  };

  const resetForm = () => {
    setFormData({
      amount: '',
      description: '',
      date: new Date().toISOString().split('T')[0],
      accountType: 'bank',
      category: '',
      type: 'income'
    });
  };

  const openModal = (type) => {
    setModalType(type);
    setFormData(prev => ({ ...prev, type }));
    setShowModal(true);
  };

  const filteredTransactions = transactions.filter(t => 
    t.description.toLowerCase().includes(searchQuery.toLowerCase()) ||
    t.category.toLowerCase().includes(searchQuery.toLowerCase())
  );

  const renderDashboard = () => (
    <ScrollView style={styles.container} showsVerticalScrollIndicator={false}>
      {/* User Header */}
      <View style={styles.userHeader}>
        <View style={styles.userInfo}>
          <View style={styles.avatar}>
            <Text style={styles.avatarText}>👤</Text>
          </View>
          <View>
            <Text style={styles.userName}>{userProfile.name}</Text>
            <Text style={styles.userEmail}>{userProfile.email}</Text>
          </View>
        </View>
        <View style={styles.headerActions}>
          <TouchableOpacity style={styles.iconButton}>
            <Icon name="bell" size={20} color="white" />
          </TouchableOpacity>
          <TouchableOpacity style={styles.iconButton}>
            <Icon name="settings" size={20} color="white" />
          </TouchableOpacity>
        </View>
      </View>

      {/* Total Balance Card */}
      <LinearGradient
        colors={['rgba(255,255,255,0.2)', 'rgba(255,255,255,0.1)']}
        style={styles.totalBalanceCard}
      >
        <View style={styles.balanceHeader}>
          <Icon name="piggy-bank" size={24} color="white" />
          <Text style={styles.balanceTitle}>මුළු ශේෂය</Text>
        </View>
        <Text style={styles.totalAmount}>{formatCurrency(getTotalBalance())}</Text>
        <View style={styles.balanceTrend}>
          <Icon name="trending-up" size={16} color="white" />
          <Text style={styles.trendText}>මෙම මාසයේ 12% වැඩිවීම</Text>
        </View>
      </LinearGradient>

      {/* Account Cards */}
      <View style={styles.accountsGrid}>
        {Object.entries(accounts).map(([key, account]) => (
          <LinearGradient
            key={key}
            colors={['rgba(255,255,255,0.15)', 'rgba(255,255,255,0.05)']}
            style={styles.accountCard}
          >
            <View style={styles.accountHeader}>
              {key === 'bank' && <Icon name="credit-card" size={20} color="white" />}
              {key === 'cash' && <Icon name="wallet" size={20} color="white" />}
              {key === 'savings' && <Icon name="target" size={20} color="white" />}
              <Text style={styles.accountName}>{account.name}</Text>
            </View>
            <Text style={styles.accountBalance}>{formatCurrency(account.balance)}</Text>
            {account.number && <Text style={styles.accountNumber}>{account.number}</Text>}
          </LinearGradient>
        ))}
      </View>

      {/* Monthly Stats */}
      <View style={styles.statsContainer}>
        <Text style={styles.sectionTitle}>මෙම මාසයේ සංඛ්‍යා</Text>
        <View style={styles.statsGrid}>
          <LinearGradient
            colors={['#10B981', '#059669']}
            style={styles.statCard}
          >
            <Icon name="trending-up" size={20} color="white" />
            <View>
              <Text style={styles.statLabel}>ආදායම්</Text>
              <Text style={styles.statValue}>{formatCurrency(getMonthlyStats().income)}</Text>
            </View>
          </LinearGradient>
          
          <LinearGradient
            colors={['#EF4444', '#DC2626']}
            style={styles.statCard}
          >
            <Icon name="trending-down" size={20} color="white" />
            <View>
              <Text style={styles.statLabel}>වියදම්</Text>
              <Text style={styles.statValue}>{formatCurrency(getMonthlyStats().expenses)}</Text>
            </View>
          </LinearGradient>
          
          <LinearGradient
            colors={['#3B82F6', '#1D4ED8']}
            style={styles.statCard}
          >
            <Icon name="dollar-sign" size={20} color="white" />
            <View>
              <Text style={styles.statLabel}>ශුද්ධ ආදායම</Text>
              <Text style={styles.statValue}>{formatCurrency(getMonthlyStats().net)}</Text>
            </View>
          </LinearGradient>
        </View>
      </View>

      {/* Quick Actions */}
      <View style={styles.quickActions}>
        <Text style={styles.sectionTitle}>ක්‍රියාවන්</Text>
        <View style={styles.actionButtons}>
          <TouchableOpacity
            style={[styles.actionBtn, styles.incomeBtn]}
            onPress={() => openModal('income')}
          >
            <Icon name="plus" size={20} color="white" />
            <Text style={styles.actionBtnText}>ආදායම</Text>
          </TouchableOpacity>
          
          <TouchableOpacity
            style={[styles.actionBtn, styles.expenseBtn]}
            onPress={() => openModal('expense')}
          >
            <Icon name="minus" size={20} color="white" />
            <Text style={styles.actionBtnText}>වියදම</Text>
          </TouchableOpacity>
          
          <TouchableOpacity
            style={[styles.actionBtn, styles.transferBtn]}
            onPress={() => openModal('transfer')}
          >
            <Icon name="credit-card" size={20} color="white" />
            <Text style={styles.actionBtnText}>මාරුකිරීම</Text>
          </TouchableOpacity>
        </View>
      </View>
    </ScrollView>
  );

  const renderTransactions = () => (
    <View style={styles.transactionsContainer}>
      <View style={styles.transactionsHeader}>
        <Text style={styles.pageTitle}>ගනුදෙනු</Text>
        <View style={styles.searchBox}>
          <Icon name="search" size={16} color="#6B7280" />
          <TextInput
            style={styles.searchInput}
            placeholder="ගනුදෙනු සොයන්න..."
            value={searchQuery}
            onChangeText={setSearchQuery}
            placeholderTextColor="#6B7280"
          />
        </View>
      </View>
      
      <ScrollView style={styles.transactionsList} showsVerticalScrollIndicator={false}>
        {filteredTransactions.map(transaction => (
          <View key={transaction.id} style={styles.transactionItem}>
            <View style={styles.transactionIcon}>
              {transaction.type === 'income' ? 
                <Icon name="trending-up" size={20} color="#10B981" /> : 
                <Icon name="trending-down" size={20} color="#EF4444" />
              }
            </View>
            <View style={styles.transactionDetails}>
              <Text style={styles.transactionDescription}>{transaction.description}</Text>
              <Text style={styles.transactionMeta}>
                {transaction.category} • {transaction.date} • {accounts[transaction.accountType]?.name}
              </Text>
            </View>
            <Text style={[
              styles.transactionAmount,
              transaction.type === 'income' ? styles.positive : styles.negative
            ]}>
              {transaction.type === 'income' ? '+' : '-'}{formatCurrency(transaction.amount)}
            </Text>
          </View>
        ))}
      </ScrollView>
    </View>
  );

  const renderAnalytics = () => (
    <View style={styles.analyticsContainer}>
      <Text style={styles.pageTitle}>විශ්ලේෂණ</Text>
      <View style={styles.analyticsGrid}>
        <View style={styles.chartCard}>
          <Text style={styles.chartTitle}>ආදායම් vs වියදම්</Text>
          <View style={styles.chartPlaceholder}>
            <Icon name="bar-chart-3" size={48} color="#6B7280" />
            <Text style={styles.chartPlaceholderText}>විස්තරාත්මක ප්‍රස්තාර</Text>
          </View>
        </View>
        <View style={styles.chartCard}>
          <Text style={styles.chartTitle}>වියදම් වර්ගීකරණය</Text>
          <View style={styles.chartPlaceholder}>
            <Icon name="pie-chart" size={48} color="#6B7280" />
            <Text style={styles.chartPlaceholderText}>වර්ගීකරණ ප්‍රස්තාර</Text>
          </View>
        </View>
      </View>
    </View>
  );

  const renderModal = () => (
    <Modal
      visible={showModal}
      animationType="slide"
      transparent={true}
      onRequestClose={() => setShowModal(false)}
    >
      <View style={styles.modalOverlay}>
        <View style={styles.modalContent}>
          <Text style={styles.modalTitle}>
            {modalType === 'income' && 'ආදායම එකතු කරන්න'}
            {modalType === 'expense' && 'වියදම එකතු කරන්න'}
            {modalType === 'transfer' && 'මුදල් මාරුකිරීම'}
          </Text>
          
          <View style={styles.formGroup}>
            <Text style={styles.label}>මුදල</Text>
            <TextInput
              style={styles.input}
              value={formData.amount}
              onChangeText={(text) => setFormData(prev => ({ ...prev, amount: text }))}
              placeholder="0.00"
              keyboardType="numeric"
            />
          </View>
          
          <View style={styles.formGroup}>
            <Text style={styles.label}>විස්තරය</Text>
            <TextInput
              style={styles.input}
              value={formData.description}
              onChangeText={(text) => setFormData(prev => ({ ...prev, description: text }))}
              placeholder="විස්තරය ඇතුළත් කරන්න"
            />
          </View>
          
          <View style={styles.formGroup}>
            <Text style={styles.label}>දිනය</Text>
            <TextInput
              style={styles.input}
              value={formData.date}
              onChangeText={(text) => setFormData(prev => ({ ...prev, date: text }))}
              placeholder="YYYY-MM-DD"
            />
          </View>
          
          <View style={styles.formGroup}>
            <Text style={styles.label}>ගිණුම</Text>
            <View style={styles.pickerContainer}>
              {Object.entries(accounts).map(([key, account]) => (
                <TouchableOpacity
                  key={key}
                  style={[
                    styles.pickerOption,
                    formData.accountType === key && styles.pickerOptionActive
                  ]}
                  onPress={() => setFormData(prev => ({ ...prev, accountType: key }))}
                >
                  <Text style={[
                    styles.pickerOptionText,
                    formData.accountType === key && styles.pickerOptionTextActive
                  ]}>
                    {account.name}
                  </Text>
                </TouchableOpacity>
              ))}
            </View>
          </View>
          
          <View style={styles.formGroup}>
            <Text style={styles.label}>වර්ගය</Text>
            <View style={styles.pickerContainer}>
              {categories[formData.type].map(cat => (
                <TouchableOpacity
                  key={cat}
                  style={[
                    styles.pickerOption,
                    formData.category === cat && styles.pickerOptionActive
                  ]}
                  onPress={() => setFormData(prev => ({ ...prev, category: cat }))}
                >
                  <Text style={[
                    styles.pickerOptionText,
                    formData.category === cat && styles.pickerOptionTextActive
                  ]}>
                    {cat}
                  </Text>
                </TouchableOpacity>
              ))}
            </View>
          </View>
          
          <View style={styles.modalButtons}>
            <TouchableOpacity
              style={styles.cancelBtn}
              onPress={() => setShowModal(false)}
            >
              <Text style={styles.cancelBtnText}>අවලංගු කරන්න</Text>
            </TouchableOpacity>
            
            <TouchableOpacity
              style={styles.confirmBtn}
              onPress={handleTransaction}
            >
              <Text style={styles.confirmBtnText}>තහවුරු කරන්න</Text>
            </TouchableOpacity>
          </View>
        </View>
      </View>
    </Modal>
  );

  return (
    <LinearGradient
      colors={['#667eea', '#764ba2']}
      style={styles.app}
    >
      <View style={styles.mainContent}>
        {activeTab === 'dashboard' && renderDashboard()}
        {activeTab === 'transactions' && renderTransactions()}
        {activeTab === 'analytics' && renderAnalytics()}
      </View>
      
      <View style={styles.bottomNav}>
        <TouchableOpacity
          style={[styles.navItem, activeTab === 'dashboard' && styles.navItemActive]}
          onPress={() => setActiveTab('dashboard')}
        >
          <Icon
            name="bar-chart-3"
            size={24}
            color={activeTab === 'dashboard' ? '#3B82F6' : '#6B7280'}
          />
          <Text style={[
            styles.navText,
            activeTab === 'dashboard' && styles.navTextActive
          ]}>
            උපකරණ පුවරුව
          </Text>
        </TouchableOpacity>
        
        <TouchableOpacity
          style={[styles.navItem, activeTab === 'transactions' && styles.navItemActive]}
          onPress={() => setActiveTab('transactions')}
        >
          <Icon
            name="file-text"
            size={24}
            color={activeTab === 'transactions' ? '#3B82F6' : '#6B7280'}
          />
          <Text style={[
            styles.navText,
            activeTab === 'transactions' && styles.navTextActive
          ]}>
            ගනුදෙනු
          </Text>
        </TouchableOpacity>
        
        <TouchableOpacity
          style={[styles.navItem, activeTab === 'analytics' && styles.navItemActive]}
          onPress={() => setActiveTab('analytics')}
        >
          <Icon
            name="pie-chart"
            size={24}
            color={activeTab === 'analytics' ? '#3B82F6' : '#6B7280'}
          />
          <Text style={[
            styles.navText,
            activeTab === 'analytics' && styles.navTextActive
          ]}>
            විශ්ලේෂණ
          </Text>
        </TouchableOpacity>
      </View>
      
      {renderModal()}
    </LinearGradient>
  );
};

const styles = StyleSheet.create({
  app: {
    flex: 1,
  },
  mainContent: {
    flex: 1,
  },
  container: {
    flex: 1,
    padding: 20,
  },
  userHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: 24,
  },
  userInfo: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  avatar: {
    width: 48,
    height: 48,
    backgroundColor: 'rgba(255,255,255,0.2)',
    borderRadius: 24,
    justifyContent: 'center',
    alignItems: 'center',
    marginRight: 12,
  },
  avatarText: {
    fontSize: 24,
  },
  userName: {
    fontSize: 18,
    fontWeight: '600',
    color: 'white',
  },
  userEmail: {
    fontSize: 14,
    color: 'rgba(255,255,255,0.8)',
  },
  headerActions: {
    flexDirection: 'row',
    gap: 8,
  },
  iconButton: {
    backgroundColor: 'rgba(255,255,255,0.1)',
    padding: 8,
    borderRadius: 8,
  },
  totalBalanceCard: {
    borderRadius: 16,
    padding: 24,
    marginBottom: 24,
    alignItems: 'center',
  },
  balanceHeader: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 12,
  },
  balanceTitle: {
    fontSize: 16,
    fontWeight: '600',
    color: 'white',
    marginLeft: 8,
  },
  totalAmount: {
    fontSize: 32,
    fontWeight: 'bold',
    color: 'white',
    marginBottom: 8,
  },
  balanceTrend: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  trendText: {
    fontSize: 14,
    color: 'rgba(255,255,255,0.8)',
    marginLeft: 4,
  },
  accountsGrid: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: 16,
    marginBottom: 24,
  },
  accountCard: {
    flex: 1,
    minWidth: width * 0.4,
    borderRadius: 12,
    padding: 16,
  },
  accountHeader: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 8,
  },
  accountName: {
    fontSize: 14,
    fontWeight: '600',
    color: 'white',
    marginLeft: 8,
  },
  accountBalance: {
    fontSize: 20,
    fontWeight: 'bold',
    color: 'white',
    marginBottom: 4,
  },
  accountNumber: {
    fontSize: 12,
    color: 'rgba(255,255,255,0.7)',
  },
  statsContainer: {
    marginBottom: 24,
  },
  sectionTitle: {
    fontSize: 18,
    fontWeight: '600',
    color: 'white',
    marginBottom: 16,
  },
  statsGrid: {
    gap: 12,
  },
  statCard: {
    flexDirection: 'row',
    alignItems: 'center',
    padding: 16,
    borderRadius: 12,
    marginBottom: 12,
  },
  statLabel: {
    fontSize: 12,
    color: 'rgba(255,255,255,0.8)',
  },
  statValue: {
    fontSize: 16,
    fontWeight: 'bold',
    color: 'white',
  },
  quickActions: {
    marginBottom: 24,
  },
  actionButtons: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: 12,
  },
  actionBtn: {
    flex: 1,
    minWidth: width * 0.25,
    flexDirection: 'column',
    alignItems: 'center',
    padding: 16,
    borderRadius: 12,
    gap: 8,
  },
  incomeBtn: {
    backgroundColor: '#10B981',
  },
  expenseBtn: {
    backgroundColor: '#EF4444',
  },
  transferBtn: {
    backgroundColor: '#3B82F6',
  },
  actionBtnText: {
    color: 'white',
    fontWeight: '600',
    fontSize: 12,
  },
  transactionsContainer: {
    flex: 1,
    backgroundColor: 'rgba(255,255,255,0.95)',
    margin: 20,
    borderRadius: 16,
    padding: 20,
  },
  transactionsHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: 20,
  },
  pageTitle: {
    fontSize: 24,
    fontWeight: 'bold',
    color: '#1F2937',
  },
  searchBox: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: '#F3F4F6',
    borderRadius: 8,
    padding: 8,
    gap: 8,
  },
  searchInput: {
    fontSize: 14,
    width: 150,
  },
  transactionsList: {
    flex: 1,
  },
  transactionItem: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: 'white',
    padding: 16,
    borderRadius: 12,
    marginBottom: 12,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
    elevation: 2,
  },
  transactionIcon: {
    marginRight: 16,
    padding: 8,
    borderRadius: 8,
    backgroundColor: '#F9FAFB',
  },
  transactionDetails: {
    flex: 1,
  },
  transactionDescription: {
    fontSize: 16,
    fontWeight: '600',
    color: '#1F2937',
    marginBottom: 4,
  },
  transactionMeta: {
    fontSize: 12,
    color: '#6B7280',
  },
  transactionAmount: {
    fontSize: 16,
    fontWeight: 'bold',
  },
  positive: {
    color: '#10B981',
  },
  negative: {
    color: '#EF4444',
  },
  analyticsContainer: {
    flex: 1,
    backgroundColor: 'rgba(255,255,255,0.95)',
    margin: 20,
    borderRadius: 16,
    padding: 20,
  },
  analyticsGrid: {
    gap: 16,
  },
  chartCard: {
    backgroundColor: 'white',
    borderRadius: 12,
    padding: 20,
    alignItems: 'center',
    marginBottom: 16,
  },
  chartTitle: {
    fontSize: 18,
    fontWeight: '600',
    color: '#1F2937',
    marginBottom: 16,
  },
  chartPlaceholder: {
    alignItems: 'center',
    gap: 12,
  },
  chartPlaceholderText: {
    color: '#6B7280',
    fontSize: 14,
  },
  bottomNav: {
    flexDirection: 'row',
    backgroundColor: 'rgba(255,255,255,0.95)',
    padding: 12,
    borderTopWidth: 1,
    borderTopColor: 'rgba(255,255,255,0.2)',
  },
  navItem: {
    flex: 1,
    alignItems: 'center',
    padding: 8,
    borderRadius: 8,
  },
  navItemActive: {
    backgroundColor: 'rgba(59,130,246,0.1)',
  },
  navText: {
    fontSize: 12,
    color: '#6B7280',
    marginTop: 4,
  },
  navTextActive: {
    color: '#3B82F6',
    fontWeight: '600',
  },
  modalOverlay: {
    flex: 1,
    backgroundColor: 'rgba(0,0,0,0.6)',
    justifyContent: 'center',
    alignItems: 'center',
    padding: 16,
  },
  modalContent: {
    backgroundColor: 'white',
    borderRadius: 16,
    padding: 24,
    width: '100%',
    maxWidth: 400,
  },
  modalTitle: {
    fontSize: 20,
    fontWeight: 'bold',
    color: '#1F2937',
    textAlign: 'center',
    marginBottom: 24,
  },
  formGroup: {
    marginBottom: 16,
  },
  label: {
    fontSize: 14,
    fontWeight: '600',
    color: '#374151',
    marginBottom: 8,
  },
  input: {
    borderWidth: 2,
    borderColor: '#E5E7EB',
    borderRadius: 8,
    padding: 12,
    fontSize: 16,
    backgroundColor: '#F9FAFB',
  },
  pickerContainer: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: 8,
  },
  pickerOption: {
    padding: 8,
    borderRadius: 6,
    backgroundColor: '#F3F4F6',
  },
  pickerOptionActive: {
    backgroundColor: '#3B82F6',
  },
  pickerOptionText: {
    fontSize: 14,
    color: '#6B7280',
  },
  pickerOptionTextActive: {
    color: 'white',
    fontWeight: '600',
  },
  modalButtons: {
    flexDirection: 'row',
    gap: 12,
    marginTop: 24,
  },
  cancelBtn: {
    flex: 1,
    padding: 12,
    borderRadius: 8,
    backgroundColor: '#F3F4F6',
    alignItems: 'center',
  },
  cancelBtnText: {
    fontSize: 16,
    fontWeight: '600',
    color: '#6B7280',
  },
  confirmBtn: {
    flex: 1,
    padding: 12,
    borderRadius: 8,
    backgroundColor: '#3B82F6',
    alignItems: 'center',
  },
  confirmBtnText: {
    fontSize: 16,
    fontWeight: '600',
    color: 'white',
  },
});

export default AccountManagerApp;