import React, { useState } from 'react';
import {
  View,
  Text,
  ScrollView,
  TouchableOpacity,
  StyleSheet,
  StatusBar,
} from 'react-native';

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

  const AccountCard = ({ account }) => {
    const getCardColor = () => {
      if (account.id === 1) return '#4F46E5'; // indigo-600
      if (account.id === 2) return '#10B981'; // green-500
      return '#F97316'; // orange-500
    };

    return (
      <View style={[styles.accountCard, { backgroundColor: getCardColor() }]}>
        <View style={styles.accountHeader}>
          <View>
            <Text style={styles.accountName}>{account.name}</Text>
            <Text style={styles.accountNumber}>{account.number}</Text>
          </View>
          {account.id === 1 && (
            <View style={styles.defaultBadge}>
              <View style={styles.defaultBadgeInner} />
            </View>
          )}
        </View>
        <Text style={styles.accountBalance}>{formatCurrency(account.balance)}</Text>
      </View>
    );
  };

  const DashboardView = () => (
    <ScrollView style={styles.content}>
      {/* Header */}
      <View style={styles.header}>
        <Text style={styles.headerTitle}>Dashboard</Text>
      </View>

      <View style={styles.container}>
        {/* Total Balance Card */}
        <View style={styles.totalBalanceCard}>
          <Text style={styles.totalBalanceLabel}>සම්පූර්ණ ශේෂය</Text>
          <Text style={styles.totalBalanceAmount}>{formatCurrency(totalBalance)}</Text>
        </View>

        {/* Income & Expense */}
        <View style={styles.summaryRow}>
          <View style={[styles.summaryCard, styles.blueCard]}>
            <Text style={styles.summaryLabel}>බැංකු ශේෂය</Text>
            <Text style={styles.summaryAmount}>{formatCurrency(income)}</Text>
          </View>
          <View style={[styles.summaryCard, styles.greenCard]}>
            <Text style={styles.summaryLabel}>මුදල් ශේෂය</Text>
            <Text style={styles.summaryAmount}>{formatCurrency(expense)}</Text>
          </View>
        </View>

        {/* Recent Transactions */}
        <View style={styles.section}>
          <Text style={styles.sectionTitle}>ගනුම් කොරන්ත</Text>
          
          {/* Bank Accounts */}
          <View style={styles.accountSection}>
            <View style={styles.accountSectionHeader}>
              <Text style={styles.accountSectionTitle}>බැංකු ගිණුම්</Text>
              <TouchableOpacity style={styles.addButton}>
                <Text style={styles.addButtonText}>+</Text>
              </TouchableOpacity>
            </View>
            <View style={styles.accountsList}>
              {accounts.filter(a => a.type === 'bank').map((account) => (
                <AccountCard key={account.id} account={account} />
              ))}
            </View>
          </View>

          {/* Cash Accounts */}
          <View style={styles.accountSection}>
            <View style={styles.accountSectionHeader}>
              <Text style={styles.accountSectionTitle}>මුදල් ගිණුම්</Text>
              <TouchableOpacity style={styles.addButton}>
                <Text style={styles.addButtonText}>+</Text>
              </TouchableOpacity>
            </View>
            <View style={[styles.accountCard, styles.purpleCard]}>
              <Text style={styles.accountName}>මුදල්</Text>
              <Text style={styles.accountBalance}>{formatCurrency(42500)}</Text>
            </View>
          </View>
        </View>
      </View>
    </ScrollView>
  );

  const PlaceholderView = ({ icon, title }) => (
    <View style={styles.placeholderView}>
      <Text style={styles.placeholderIcon}>{icon}</Text>
      <Text style={styles.placeholderTitle}>{title}</Text>
    </View>
  );

  return (
    <View style={styles.appContainer}>
      <StatusBar barStyle="light-content" backgroundColor="#4F46E5" />
      
      {/* Content */}
      {activeTab === 'dashboard' && <DashboardView />}
      {activeTab === 'bank' && <PlaceholderView icon="🏦" title="බැංකු ගිණුම්" />}
      {activeTab === 'cash' && <PlaceholderView icon="💰" title="මුදල්" />}
      {activeTab === 'categories' && <PlaceholderView icon="📁" title="ප්‍රවර්ග" />}
      {activeTab === 'settings' && <PlaceholderView icon="⚙️" title="සැකසුම්" />}

      {/* Bottom Navigation */}
      <View style={styles.bottomNav}>
        <TouchableOpacity 
          style={[styles.navButton, activeTab === 'dashboard' && styles.navButtonActive]}
          onPress={() => setActiveTab('dashboard')}
        >
          <Text style={styles.navIcon}>🏠</Text>
          <Text style={styles.navLabel}>Dashboard</Text>
        </TouchableOpacity>
        
        <TouchableOpacity 
          style={[styles.navButton, activeTab === 'bank' && styles.navButtonActive]}
          onPress={() => setActiveTab('bank')}
        >
          <Text style={styles.navIcon}>🏦</Text>
          <Text style={styles.navLabel}>Bank</Text>
        </TouchableOpacity>
        
        <TouchableOpacity 
          style={[styles.navButton, activeTab === 'cash' && styles.navButtonActive]}
          onPress={() => setActiveTab('cash')}
        >
          <Text style={styles.navIcon}>💰</Text>
          <Text style={styles.navLabel}>Cash</Text>
        </TouchableOpacity>
        
        <TouchableOpacity 
          style={[styles.navButton, activeTab === 'categories' && styles.navButtonActive]}
          onPress={() => setActiveTab('categories')}
        >
          <Text style={styles.navIcon}>📁</Text>
          <Text style={styles.navLabel}>Categories</Text>
        </TouchableOpacity>
        
        <TouchableOpacity 
          style={[styles.navButton, activeTab === 'settings' && styles.navButtonActive]}
          onPress={() => setActiveTab('settings')}
        >
          <Text style={styles.navIcon}>⚙️</Text>
          <Text style={styles.navLabel}>Settings</Text>
        </TouchableOpacity>
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  appContainer: {
    flex: 1,
    backgroundColor: '#F9FAFB',
  },
  content: {
    flex: 1,
    marginBottom: 80,
  },
  header: {
    backgroundColor: '#4F46E5',
    padding: 24,
    borderBottomLeftRadius: 24,
    borderBottomRightRadius: 24,
  },
  headerTitle: {
    fontSize: 30,
    fontWeight: 'bold',
    color: 'white',
    textAlign: 'center',
  },
  container: {
    padding: 16,
  },
  totalBalanceCard: {
    backgroundColor: 'white',
    borderRadius: 16,
    padding: 24,
    alignItems: 'center',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 8,
    elevation: 4,
    marginBottom: 16,
  },
  totalBalanceLabel: {
    fontSize: 14,
    color: '#6B7280',
    marginBottom: 8,
  },
  totalBalanceAmount: {
    fontSize: 36,
    fontWeight: 'bold',
    color: '#4F46E5',
  },
  summaryRow: {
    flexDirection: 'row',
    gap: 16,
    marginBottom: 24,
  },
  summaryCard: {
    flex: 1,
    borderRadius: 16,
    padding: 24,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 8,
    elevation: 4,
  },
  blueCard: {
    backgroundColor: '#3B82F6',
  },
  greenCard: {
    backgroundColor: '#10B981',
  },
  summaryLabel: {
    fontSize: 12,
    color: 'rgba(255, 255, 255, 0.9)',
    marginBottom: 8,
  },
  summaryAmount: {
    fontSize: 20,
    fontWeight: 'bold',
    color: 'white',
  },
  section: {
    marginTop: 8,
  },
  sectionTitle: {
    fontSize: 20,
    fontWeight: 'bold',
    marginBottom: 12,
  },
  accountSection: {
    marginBottom: 16,
  },
  accountSectionHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: 12,
  },
  accountSectionTitle: {
    fontSize: 16,
    fontWeight: '600',
    color: '#374151',
  },
  addButton: {
    backgroundColor: '#4F46E5',
    width: 40,
    height: 40,
    borderRadius: 20,
    justifyContent: 'center',
    alignItems: 'center',
  },
  addButtonText: {
    color: 'white',
    fontSize: 24,
    fontWeight: 'bold',
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
    shadowRadius: 8,
    elevation: 4,
    marginBottom: 12,
  },
  accountHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'flex-start',
    marginBottom: 8,
  },
  accountName: {
    fontSize: 18,
    fontWeight: '600',
    color: 'white',
  },
  accountNumber: {
    fontSize: 12,
    color: 'rgba(255, 255, 255, 0.8)',
    marginTop: 4,
  },
  defaultBadge: {
    backgroundColor: 'rgba(255, 255, 255, 0.3)',
    borderRadius: 12,
    padding: 4,
  },
  defaultBadgeInner: {
    width: 16,
    height: 16,
    backgroundColor: 'white',
    borderRadius: 8,
  },
  accountBalance: {
    fontSize: 24,
    fontWeight: 'bold',
    color: 'white',
  },
  purpleCard: {
    backgroundColor: '#A855F7',
  },
  placeholderView: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: 24,
  },
  placeholderIcon: {
    fontSize: 64,
    marginBottom: 16,
  },
  placeholderTitle: {
    fontSize: 24,
    fontWeight: 'bold',
  },
  bottomNav: {
    position: 'absolute',
    bottom: 0,
    left: 0,
    right: 0,
    backgroundColor: '#4F46E5',
    flexDirection: 'row',
    height: 80,
    paddingBottom: 8,
  },
  navButton: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    paddingVertical: 12,
  },
  navButtonActive: {
    backgroundColor: '#4338CA',
  },
  navIcon: {
    fontSize: 24,
    marginBottom: 4,
  },
  navLabel: {
    fontSize: 10,
    color: 'white',
    marginTop: 4,
  },
});
