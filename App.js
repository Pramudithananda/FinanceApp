import React, { useState, useEffect } from 'react';
import {
  View,
  Text,
  ScrollView,
  TouchableOpacity,
  SafeAreaView,
  StatusBar,
  StyleSheet,
} from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';
import Icon from 'react-native-vector-icons/MaterialCommunityIcons';

export default function FinanceApp() {
  const [activeTab, setActiveTab] = useState('dashboard');
  const [accounts, setAccounts] = useState([
    { id: 1, name: "People's Bank", number: '1234567890', balance: 155000, type: 'bank' },
    { id: 2, name: "Commercial Bank", number: '0987654321', balance: 0, type: 'bank' },
    { id: 3, name: "පිබිදී", number: '2558', balance: 20800, type: 'bank' }
  ]);
  const [cashBalance, setCashBalance] = useState(42500);

  useEffect(() => {
    loadData();
  }, []);

  useEffect(() => {
    saveData();
  }, [accounts, cashBalance]);

  const loadData = async () => {
    try {
      const savedAccounts = await AsyncStorage.getItem('accounts');
      const savedCash = await AsyncStorage.getItem('cashBalance');
      
      if (savedAccounts) setAccounts(JSON.parse(savedAccounts));
      if (savedCash) setCashBalance(parseFloat(savedCash));
    } catch (error) {
      console.error('Error loading data:', error);
    }
  };

  const saveData = async () => {
    try {
      await AsyncStorage.setItem('accounts', JSON.stringify(accounts));
      await AsyncStorage.setItem('cashBalance', cashBalance.toString());
    } catch (error) {
      console.error('Error saving data:', error);
    }
  };

  const totalBalance = accounts.reduce((sum, acc) => sum + acc.balance, 0);
  const bankBalance = accounts.filter(a => a.type === 'bank').reduce((sum, acc) => sum + acc.balance, 0);
  const income = 175800;
  const expense = 42500;

  const formatCurrency = (amount) => {
    return `රු ${amount.toLocaleString('en-US')}`;
  };

  const DashboardView = () => (
    <ScrollView style={styles.scrollView}>
      {/* Header */}
      <View style={styles.header}>
        <Text style={styles.headerTitle}>Dashboard</Text>
      </View>

      <View style={styles.content}>
        {/* Total Balance Card */}
        <View style={styles.totalBalanceCard}>
          <Text style={styles.balanceLabel}>සම්පූර්ණ ශේෂය</Text>
          <Text style={styles.totalBalanceAmount}>{formatCurrency(totalBalance)}</Text>
        </View>

        {/* Income & Cash */}
        <View style={styles.row}>
          <View style={[styles.statCard, styles.bankCard]}>
            <Text style={styles.statLabel}>බැංකු ශේෂය</Text>
            <Text style={styles.statAmount}>{formatCurrency(income)}</Text>
          </View>
          <View style={[styles.statCard, styles.cashCard]}>
            <Text style={styles.statLabel}>මුදල් ශේෂය</Text>
            <Text style={styles.statAmount}>{formatCurrency(expense)}</Text>
          </View>
        </View>

        {/* Recent Transactions Section */}
        <View style={styles.section}>
          <Text style={styles.sectionTitle}>ගනුම් කොරන්ත</Text>
          
          {/* Bank Accounts */}
          <View style={styles.accountSection}>
            <View style={styles.accountHeader}>
              <Text style={styles.accountHeaderText}>බැංකු ගිණුම්</Text>
              <TouchableOpacity style={styles.addButton}>
                <Icon name="plus" size={20} color="#fff" />
              </TouchableOpacity>
            </View>
            
            <View style={styles.accountsList}>
              {accounts.filter(a => a.type === 'bank').map((account, index) => (
                <View 
                  key={account.id} 
                  style={[
                    styles.accountCard,
                    index === 0 && styles.accountCardPrimary,
                    index === 1 && styles.accountCardSecondary,
                    index === 2 && styles.accountCardTertiary,
                  ]}
                >
                  <View style={styles.accountCardHeader}>
                    <View>
                      <Text style={styles.accountName}>{account.name}</Text>
                      <Text style={styles.accountNumber}>{account.number}</Text>
                    </View>
                    {index === 0 && (
                      <View style={styles.primaryBadge}>
                        <View style={styles.primaryBadgeInner}></View>
                      </View>
                    )}
                  </View>
                  <Text style={styles.accountBalance}>{formatCurrency(account.balance)}</Text>
                </View>
              ))}
            </View>
          </View>

          {/* Cash Accounts */}
          <View style={styles.accountSection}>
            <View style={styles.accountHeader}>
              <Text style={styles.accountHeaderText}>මුදල් ගිණුම්</Text>
              <TouchableOpacity style={styles.addButton}>
                <Icon name="plus" size={20} color="#fff" />
              </TouchableOpacity>
            </View>
            
            <View style={[styles.accountCard, styles.cashAccountCard]}>
              <Text style={styles.accountName}>මුදල්</Text>
              <Text style={styles.accountBalance}>{formatCurrency(cashBalance)}</Text>
            </View>
          </View>
        </View>
      </View>
    </ScrollView>
  );

  const PlaceholderView = ({ icon, title, color }) => (
    <View style={styles.placeholderView}>
      <Icon name={icon} size={64} color={color} />
      <Text style={styles.placeholderTitle}>{title}</Text>
    </View>
  );

  return (
    <SafeAreaView style={styles.container}>
      <StatusBar barStyle="light-content" backgroundColor="#4F46E5" />
      
      {/* Content */}
      <View style={styles.mainContent}>
        {activeTab === 'dashboard' && <DashboardView />}
        {activeTab === 'bank' && <PlaceholderView icon="bank" title="බැංකු ගිණුම්" color="#4F46E5" />}
        {activeTab === 'cash' && <PlaceholderView icon="cash" title="මුදල්" color="#10B981" />}
        {activeTab === 'categories' && <PlaceholderView icon="folder-open" title="ප්‍රවර්ග" color="#F59E0B" />}
        {activeTab === 'settings' && <PlaceholderView icon="cog" title="සැකසුම්" color="#6B7280" />}
      </View>

      {/* Bottom Navigation */}
      <View style={styles.bottomNav}>
        <TouchableOpacity 
          style={[styles.navButton, activeTab === 'dashboard' && styles.navButtonActive]}
          onPress={() => setActiveTab('dashboard')}
        >
          <Icon name="view-dashboard" size={24} color="#fff" />
          <Text style={styles.navButtonText}>Dashboard</Text>
        </TouchableOpacity>
        
        <TouchableOpacity 
          style={[styles.navButton, activeTab === 'bank' && styles.navButtonActive]}
          onPress={() => setActiveTab('bank')}
        >
          <Icon name="bank" size={24} color="#fff" />
          <Text style={styles.navButtonText}>Bank</Text>
        </TouchableOpacity>
        
        <TouchableOpacity 
          style={[styles.navButton, activeTab === 'cash' && styles.navButtonActive]}
          onPress={() => setActiveTab('cash')}
        >
          <Icon name="cash" size={24} color="#fff" />
          <Text style={styles.navButtonText}>Cash</Text>
        </TouchableOpacity>
        
        <TouchableOpacity 
          style={[styles.navButton, activeTab === 'categories' && styles.navButtonActive]}
          onPress={() => setActiveTab('categories')}
        >
          <Icon name="folder-open" size={24} color="#fff" />
          <Text style={styles.navButtonText}>Categories</Text>
        </TouchableOpacity>
        
        <TouchableOpacity 
          style={[styles.navButton, activeTab === 'settings' && styles.navButtonActive]}
          onPress={() => setActiveTab('settings')}
        >
          <Icon name="cog" size={24} color="#fff" />
          <Text style={styles.navButtonText}>Settings</Text>
        </TouchableOpacity>
      </View>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#F9FAFB',
  },
  mainContent: {
    flex: 1,
    backgroundColor: '#fff',
  },
  scrollView: {
    flex: 1,
  },
  header: {
    backgroundColor: '#4F46E5',
    padding: 24,
    borderBottomLeftRadius: 24,
    borderBottomRightRadius: 24,
  },
  headerTitle: {
    fontSize: 28,
    fontWeight: 'bold',
    color: '#fff',
    textAlign: 'center',
  },
  content: {
    padding: 16,
  },
  totalBalanceCard: {
    backgroundColor: '#fff',
    borderRadius: 16,
    padding: 24,
    alignItems: 'center',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 8,
    elevation: 5,
    marginBottom: 16,
  },
  balanceLabel: {
    fontSize: 14,
    color: '#6B7280',
    marginBottom: 8,
  },
  totalBalanceAmount: {
    fontSize: 36,
    fontWeight: 'bold',
    color: '#4F46E5',
  },
  row: {
    flexDirection: 'row',
    gap: 16,
    marginBottom: 24,
  },
  statCard: {
    flex: 1,
    borderRadius: 16,
    padding: 24,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 8,
    elevation: 5,
  },
  bankCard: {
    backgroundColor: '#3B82F6',
  },
  cashCard: {
    backgroundColor: '#10B981',
  },
  statLabel: {
    fontSize: 12,
    color: 'rgba(255, 255, 255, 0.9)',
    marginBottom: 8,
  },
  statAmount: {
    fontSize: 20,
    fontWeight: 'bold',
    color: '#fff',
  },
  section: {
    marginTop: 8,
  },
  sectionTitle: {
    fontSize: 20,
    fontWeight: 'bold',
    marginBottom: 12,
    color: '#1F2937',
  },
  accountSection: {
    marginBottom: 16,
  },
  accountHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: 12,
  },
  accountHeaderText: {
    fontSize: 16,
    fontWeight: '600',
    color: '#374151',
  },
  addButton: {
    backgroundColor: '#4F46E5',
    borderRadius: 20,
    width: 40,
    height: 40,
    justifyContent: 'center',
    alignItems: 'center',
  },
  accountsList: {
    gap: 12,
  },
  accountCard: {
    borderRadius: 16,
    padding: 16,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
    elevation: 3,
    marginBottom: 12,
  },
  accountCardPrimary: {
    backgroundColor: '#4F46E5',
  },
  accountCardSecondary: {
    backgroundColor: '#10B981',
  },
  accountCardTertiary: {
    backgroundColor: '#F97316',
  },
  cashAccountCard: {
    backgroundColor: '#9333EA',
  },
  accountCardHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'flex-start',
    marginBottom: 8,
  },
  accountName: {
    fontSize: 18,
    fontWeight: '600',
    color: '#fff',
    marginBottom: 4,
  },
  accountNumber: {
    fontSize: 12,
    color: 'rgba(255, 255, 255, 0.8)',
  },
  accountBalance: {
    fontSize: 24,
    fontWeight: 'bold',
    color: '#fff',
  },
  primaryBadge: {
    backgroundColor: 'rgba(255, 255, 255, 0.3)',
    borderRadius: 12,
    padding: 4,
  },
  primaryBadgeInner: {
    width: 16,
    height: 16,
    backgroundColor: '#fff',
    borderRadius: 8,
  },
  placeholderView: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: 24,
  },
  placeholderTitle: {
    fontSize: 24,
    fontWeight: 'bold',
    marginTop: 16,
    color: '#1F2937',
  },
  bottomNav: {
    flexDirection: 'row',
    backgroundColor: '#4F46E5',
    paddingBottom: 8,
  },
  navButton: {
    flex: 1,
    alignItems: 'center',
    paddingVertical: 12,
  },
  navButtonActive: {
    backgroundColor: '#4338CA',
  },
  navButtonText: {
    color: '#fff',
    fontSize: 10,
    marginTop: 4,
  },
});
