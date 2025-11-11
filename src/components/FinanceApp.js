import React, { useState } from 'react';
import {
  View,
  Text,
  ScrollView,
  TouchableOpacity,
  StyleSheet,
  SafeAreaView,
} from 'react-native';
import { Ionicons } from '@expo/vector-icons';

export default function FinanceApp() {
  const [activeTab, setActiveTab] = useState('dashboard');
  const [accounts, setAccounts] = useState([
    { id: 1, name: "People's Bank", number: '1234567890', balance: 155000, type: 'bank' },
    { id: 2, name: "Commercial Bank", number: '0987654321', balance: 0, type: 'bank' },
    { id: 3, name: "පිබිදී", number: '2558', balance: 20800, type: 'bank' }
  ]);

  const totalBalance = accounts.reduce((sum, acc) => sum + acc.balance, 0);
  const bankBalance = accounts.filter(a => a.type === 'bank').reduce((sum, acc) => sum + acc.balance, 0);
  const income = 175800;
  const expense = 42500;

  const formatCurrency = (amount) => {
    return `රු ${amount.toLocaleString('en-US')}`;
  };

  const DashboardView = () => (
    <ScrollView style={styles.scrollView} contentContainerStyle={styles.scrollContent}>
      {/* Header */}
      <View style={styles.header}>
        <Text style={styles.headerTitle}>Dashboard</Text>
      </View>

      <View style={styles.content}>
        {/* Total Balance Card */}
        <View style={styles.totalBalanceCard}>
          <Text style={styles.totalBalanceLabel}>සම්පූර්ණ ශේෂය</Text>
          <Text style={styles.totalBalanceAmount}>{formatCurrency(totalBalance)}</Text>
        </View>

        {/* Income & Expense */}
        <View style={styles.incomeExpenseGrid}>
          <View style={[styles.incomeExpenseCard, styles.incomeCard]}>
            <Text style={styles.incomeExpenseLabel}>බැංකු ශේෂය</Text>
            <Text style={styles.incomeExpenseAmount}>{formatCurrency(income)}</Text>
          </View>
          <View style={[styles.incomeExpenseCard, styles.expenseCard]}>
            <Text style={styles.incomeExpenseLabel}>මුදල් ශේෂය</Text>
            <Text style={styles.incomeExpenseAmount}>{formatCurrency(expense)}</Text>
          </View>
        </View>

        {/* Recent Transactions */}
        <View style={styles.transactionsSection}>
          <Text style={styles.sectionTitle}>ගනුම් කොරන්ත</Text>
          
          {/* Bank Accounts */}
          <View style={styles.accountGroup}>
            <View style={styles.accountGroupHeader}>
              <Text style={styles.accountGroupTitle}>බැංකු ගිණුම්</Text>
              <TouchableOpacity style={styles.addButton}>
                <Ionicons name="add" size={20} color="white" />
              </TouchableOpacity>
            </View>
            <View style={styles.accountsList}>
              {accounts.filter(a => a.type === 'bank').map((account) => (
                <View
                  key={account.id}
                  style={[
                    styles.accountCard,
                    account.id === 1 && styles.accountCardIndigo,
                    account.id === 2 && styles.accountCardGreen,
                    account.id === 3 && styles.accountCardOrange,
                  ]}
                >
                  <View style={styles.accountCardHeader}>
                    <View style={styles.accountInfo}>
                      <Text style={styles.accountName}>{account.name}</Text>
                      <Text style={styles.accountNumber}>{account.number}</Text>
                    </View>
                    {account.id === 1 && (
                      <View style={styles.accountBadge}>
                        <View style={styles.accountBadgeDot} />
                      </View>
                    )}
                  </View>
                  <Text style={styles.accountBalance}>{formatCurrency(account.balance)}</Text>
                </View>
              ))}
            </View>
          </View>

          {/* Cash Accounts */}
          <View style={styles.accountGroup}>
            <View style={styles.accountGroupHeader}>
              <Text style={styles.accountGroupTitle}>මුදල් ගිණුම්</Text>
              <TouchableOpacity style={styles.addButton}>
                <Ionicons name="add" size={20} color="white" />
              </TouchableOpacity>
            </View>
            <View style={styles.cashCard}>
              <Text style={styles.accountName}>මුදල්</Text>
              <Text style={styles.accountBalance}>{formatCurrency(42500)}</Text>
            </View>
          </View>
        </View>
      </View>
    </ScrollView>
  );

  const TabIcon = ({ name, focused, label }) => (
    <View style={styles.tabIconContainer}>
      <Ionicons 
        name={name} 
        size={24} 
        color={focused ? '#ffffff' : '#c7d2fe'} 
      />
      <Text style={[styles.tabLabel, focused && styles.tabLabelActive]}>
        {label}
      </Text>
    </View>
  );

  return (
    <SafeAreaView style={styles.container}>
      <View style={styles.appContainer}>
        {activeTab === 'dashboard' && <DashboardView />}
        {activeTab === 'bank' && (
          <View style={styles.placeholderView}>
            <Ionicons name="business" size={64} color="#4f46e5" />
            <Text style={styles.placeholderTitle}>බැංකු ගිණුම්</Text>
          </View>
        )}
        {activeTab === 'cash' && (
          <View style={styles.placeholderView}>
            <Ionicons name="wallet" size={64} color="#10b981" />
            <Text style={styles.placeholderTitle}>මුදල්</Text>
          </View>
        )}
        {activeTab === 'categories' && (
          <View style={styles.placeholderView}>
            <Ionicons name="folder-open" size={64} color="#f59e0b" />
            <Text style={styles.placeholderTitle}>ප්‍රවර්ග</Text>
          </View>
        )}
        {activeTab === 'settings' && (
          <View style={styles.placeholderView}>
            <Ionicons name="settings" size={64} color="#6b7280" />
            <Text style={styles.placeholderTitle}>සැකසුම්</Text>
          </View>
        )}

        {/* Bottom Navigation */}
        <View style={styles.bottomNav}>
          <TouchableOpacity
            onPress={() => setActiveTab('dashboard')}
            style={[styles.tabButton, activeTab === 'dashboard' && styles.tabButtonActive]}
          >
            <TabIcon 
              name={activeTab === 'dashboard' ? 'home' : 'home-outline'} 
              focused={activeTab === 'dashboard'}
              label="Dashboard"
            />
          </TouchableOpacity>
          <TouchableOpacity
            onPress={() => setActiveTab('bank')}
            style={[styles.tabButton, activeTab === 'bank' && styles.tabButtonActive]}
          >
            <TabIcon 
              name={activeTab === 'bank' ? 'business' : 'business-outline'} 
              focused={activeTab === 'bank'}
              label="Bank"
            />
          </TouchableOpacity>
          <TouchableOpacity
            onPress={() => setActiveTab('cash')}
            style={[styles.tabButton, activeTab === 'cash' && styles.tabButtonActive]}
          >
            <TabIcon 
              name={activeTab === 'cash' ? 'wallet' : 'wallet-outline'} 
              focused={activeTab === 'cash'}
              label="Cash"
            />
          </TouchableOpacity>
          <TouchableOpacity
            onPress={() => setActiveTab('categories')}
            style={[styles.tabButton, activeTab === 'categories' && styles.tabButtonActive]}
          >
            <TabIcon 
              name={activeTab === 'categories' ? 'folder-open' : 'folder-outline'} 
              focused={activeTab === 'categories'}
              label="Categories"
            />
          </TouchableOpacity>
          <TouchableOpacity
            onPress={() => setActiveTab('settings')}
            style={[styles.tabButton, activeTab === 'settings' && styles.tabButtonActive]}
          >
            <TabIcon 
              name={activeTab === 'settings' ? 'settings' : 'settings-outline'} 
              focused={activeTab === 'settings'}
              label="Settings"
            />
          </TouchableOpacity>
        </View>
      </View>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#f3f4f6',
  },
  appContainer: {
    flex: 1,
    maxWidth: 500,
    width: '100%',
    alignSelf: 'center',
    backgroundColor: '#ffffff',
  },
  scrollView: {
    flex: 1,
  },
  scrollContent: {
    paddingBottom: 100,
  },
  header: {
    backgroundColor: '#4f46e5',
    paddingVertical: 24,
    paddingHorizontal: 24,
    borderBottomLeftRadius: 30,
    borderBottomRightRadius: 30,
  },
  headerTitle: {
    fontSize: 28,
    fontWeight: 'bold',
    color: '#ffffff',
    textAlign: 'center',
  },
  content: {
    padding: 16,
  },
  totalBalanceCard: {
    backgroundColor: '#ffffff',
    borderRadius: 20,
    padding: 24,
    marginBottom: 16,
    alignItems: 'center',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 8,
    elevation: 4,
  },
  totalBalanceLabel: {
    fontSize: 14,
    color: '#6b7280',
    marginBottom: 8,
  },
  totalBalanceAmount: {
    fontSize: 36,
    fontWeight: 'bold',
    color: '#4f46e5',
  },
  incomeExpenseGrid: {
    flexDirection: 'row',
    gap: 12,
    marginBottom: 24,
  },
  incomeExpenseCard: {
    flex: 1,
    borderRadius: 20,
    padding: 24,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 8,
    elevation: 4,
  },
  incomeCard: {
    backgroundColor: '#3b82f6',
  },
  expenseCard: {
    backgroundColor: '#10b981',
  },
  incomeExpenseLabel: {
    fontSize: 14,
    color: '#ffffff',
    opacity: 0.9,
    marginBottom: 8,
  },
  incomeExpenseAmount: {
    fontSize: 24,
    fontWeight: 'bold',
    color: '#ffffff',
  },
  transactionsSection: {
    marginTop: 8,
  },
  sectionTitle: {
    fontSize: 20,
    fontWeight: 'bold',
    marginBottom: 16,
    color: '#111827',
  },
  accountGroup: {
    marginBottom: 24,
  },
  accountGroupHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: 12,
  },
  accountGroupTitle: {
    fontSize: 16,
    fontWeight: '600',
    color: '#374151',
  },
  addButton: {
    backgroundColor: '#4f46e5',
    borderRadius: 20,
    padding: 8,
    width: 36,
    height: 36,
    justifyContent: 'center',
    alignItems: 'center',
  },
  accountsList: {
    gap: 12,
  },
  accountCard: {
    borderRadius: 20,
    padding: 16,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
    elevation: 3,
  },
  accountCardIndigo: {
    backgroundColor: '#4f46e5',
  },
  accountCardGreen: {
    backgroundColor: '#10b981',
  },
  accountCardOrange: {
    backgroundColor: '#f97316',
  },
  accountCardHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'flex-start',
    marginBottom: 12,
  },
  accountInfo: {
    flex: 1,
  },
  accountName: {
    fontSize: 18,
    fontWeight: '600',
    color: '#ffffff',
    marginBottom: 4,
  },
  accountNumber: {
    fontSize: 14,
    color: '#ffffff',
    opacity: 0.8,
  },
  accountBadge: {
    backgroundColor: 'rgba(255, 255, 255, 0.3)',
    borderRadius: 12,
    padding: 4,
    width: 24,
    height: 24,
    justifyContent: 'center',
    alignItems: 'center',
  },
  accountBadgeDot: {
    width: 8,
    height: 8,
    backgroundColor: '#ffffff',
    borderRadius: 4,
  },
  accountBalance: {
    fontSize: 24,
    fontWeight: 'bold',
    color: '#ffffff',
  },
  cashCard: {
    backgroundColor: '#a855f7',
    borderRadius: 20,
    padding: 16,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
    elevation: 3,
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
    color: '#111827',
  },
  bottomNav: {
    position: 'absolute',
    bottom: 0,
    left: 0,
    right: 0,
    backgroundColor: '#4f46e5',
    flexDirection: 'row',
    borderTopWidth: 0,
    maxWidth: 500,
    alignSelf: 'center',
    width: '100%',
  },
  tabButton: {
    flex: 1,
    paddingVertical: 12,
    alignItems: 'center',
    justifyContent: 'center',
  },
  tabButtonActive: {
    backgroundColor: '#4338ca',
  },
  tabIconContainer: {
    alignItems: 'center',
    justifyContent: 'center',
  },
  tabLabel: {
    fontSize: 10,
    marginTop: 4,
    color: '#c7d2fe',
  },
  tabLabelActive: {
    color: '#ffffff',
    fontWeight: '600',
  },
});
