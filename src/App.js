import React, { useState } from 'react';
import {
  View,
  Text,
  ScrollView,
  TouchableOpacity,
  StyleSheet,
  SafeAreaView,
  StatusBar,
} from 'react-native';
import Icon from 'react-native-vector-icons/Feather';

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
    <ScrollView style={styles.scrollContent}>
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
        <View style={styles.statsGrid}>
          <View style={[styles.statCard, styles.bankCard]}>
            <Text style={styles.statLabel}>බැංකු ශේෂය</Text>
            <Text style={styles.statAmount}>{formatCurrency(income)}</Text>
          </View>
          <View style={[styles.statCard, styles.cashCard]}>
            <Text style={styles.statLabel}>මුදල් ශේෂය</Text>
            <Text style={styles.statAmount}>{formatCurrency(expense)}</Text>
          </View>
        </View>

        {/* Accounts Section */}
        <View style={styles.section}>
          <Text style={styles.sectionTitle}>ගනුම් කොරන්ත</Text>
          
          {/* Bank Accounts */}
          <View style={styles.accountsGroup}>
            <View style={styles.accountsHeader}>
              <Text style={styles.accountsGroupTitle}>බැංකු ගිණුම්</Text>
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
                    index === 0 ? styles.accountCard1 : 
                    index === 1 ? styles.accountCard2 : 
                    styles.accountCard3
                  ]}
                >
                  <View style={styles.accountHeader}>
                    <View>
                      <Text style={styles.accountName}>{account.name}</Text>
                      <Text style={styles.accountNumber}>{account.number}</Text>
                    </View>
                    {index === 0 && (
                      <View style={styles.defaultBadge}>
                        <View style={styles.defaultBadgeInner} />
                      </View>
                    )}
                  </View>
                  <Text style={styles.accountBalance}>{formatCurrency(account.balance)}</Text>
                </View>
              ))}
            </View>
          </View>

          {/* Cash Accounts */}
          <View style={styles.accountsGroup}>
            <View style={styles.accountsHeader}>
              <Text style={styles.accountsGroupTitle}>මුදල් ගිණුම්</Text>
              <TouchableOpacity style={styles.addButton}>
                <Icon name="plus" size={20} color="#fff" />
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

  const PlaceholderView = ({ icon, title }) => (
    <View style={styles.placeholderView}>
      <Icon name={icon} size={64} color="#4F46E5" />
      <Text style={styles.placeholderTitle}>{title}</Text>
    </View>
  );

  return (
    <SafeAreaView style={styles.container}>
      <StatusBar barStyle="light-content" backgroundColor="#4F46E5" />
      
      {/* Content */}
      <View style={styles.mainContent}>
        {activeTab === 'dashboard' && <DashboardView />}
        {activeTab === 'bank' && <PlaceholderView icon="briefcase" title="බැංකු ගිණුම්" />}
        {activeTab === 'cash' && <PlaceholderView icon="dollar-sign" title="මුදල්" />}
        {activeTab === 'categories' && <PlaceholderView icon="folder" title="ප්‍රවර්ග" />}
        {activeTab === 'settings' && <PlaceholderView icon="settings" title="සැකසුම්" />}
      </View>

      {/* Bottom Navigation */}
      <View style={styles.bottomNav}>
        <TouchableOpacity 
          style={[styles.navButton, activeTab === 'dashboard' && styles.navButtonActive]}
          onPress={() => setActiveTab('dashboard')}
        >
          <Icon name="home" size={24} color="#fff" />
          <Text style={styles.navText}>Dashboard</Text>
        </TouchableOpacity>
        
        <TouchableOpacity 
          style={[styles.navButton, activeTab === 'bank' && styles.navButtonActive]}
          onPress={() => setActiveTab('bank')}
        >
          <Icon name="briefcase" size={24} color="#fff" />
          <Text style={styles.navText}>Bank</Text>
        </TouchableOpacity>
        
        <TouchableOpacity 
          style={[styles.navButton, activeTab === 'cash' && styles.navButtonActive]}
          onPress={() => setActiveTab('cash')}
        >
          <Icon name="dollar-sign" size={24} color="#fff" />
          <Text style={styles.navText}>Cash</Text>
        </TouchableOpacity>
        
        <TouchableOpacity 
          style={[styles.navButton, activeTab === 'categories' && styles.navButtonActive]}
          onPress={() => setActiveTab('categories')}
        >
          <Icon name="folder" size={24} color="#fff" />
          <Text style={styles.navText}>Categories</Text>
        </TouchableOpacity>
        
        <TouchableOpacity 
          style={[styles.navButton, activeTab === 'settings' && styles.navButtonActive]}
          onPress={() => setActiveTab('settings')}
        >
          <Icon name="settings" size={24} color="#fff" />
          <Text style={styles.navText}>Settings</Text>
        </TouchableOpacity>
      </View>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#F3F4F6',
  },
  mainContent: {
    flex: 1,
  },
  scrollContent: {
    flex: 1,
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
  statsGrid: {
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
    elevation: 4,
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
    color: '#111827',
  },
  accountsGroup: {
    marginBottom: 16,
  },
  accountsHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: 12,
  },
  accountsGroupTitle: {
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
    marginBottom: 12,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
    elevation: 3,
  },
  accountCard1: {
    backgroundColor: '#4F46E5',
  },
  accountCard2: {
    backgroundColor: '#10B981',
  },
  accountCard3: {
    backgroundColor: '#F97316',
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
    color: '#fff',
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
    backgroundColor: '#fff',
    borderRadius: 8,
  },
  accountBalance: {
    fontSize: 24,
    fontWeight: 'bold',
    color: '#fff',
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
    flexDirection: 'row',
    backgroundColor: '#4F46E5',
    paddingBottom: 8,
    paddingTop: 8,
  },
  navButton: {
    flex: 1,
    alignItems: 'center',
    paddingVertical: 12,
  },
  navButtonActive: {
    backgroundColor: '#4338CA',
  },
  navText: {
    fontSize: 10,
    color: '#fff',
    marginTop: 4,
  },
});
