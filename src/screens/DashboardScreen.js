import React, { useState, useEffect } from 'react';
import {
  View,
  Text,
  ScrollView,
  TouchableOpacity,
  StyleSheet,
  SafeAreaView,
} from 'react-native';
import Icon from 'react-native-vector-icons/MaterialCommunityIcons';
import { formatCurrency } from '../utils/formatters';
import { loadData, saveData } from '../utils/storage';
import AccountCard from '../components/AccountCard';

export default function DashboardScreen() {
  const [accounts, setAccounts] = useState([
    { id: 1, name: "People's Bank", number: '1234567890', balance: 155000, type: 'bank' },
    { id: 2, name: "Commercial Bank", number: '0987654321', balance: 0, type: 'bank' },
    { id: 3, name: "පිබිදී", number: '2558', balance: 20800, type: 'bank' }
  ]);

  const [cashBalance, setCashBalance] = useState(42500);

  useEffect(() => {
    loadAccounts();
  }, []);

  const loadAccounts = async () => {
    const data = await loadData();
    if (data) {
      if (data.accounts) setAccounts(data.accounts);
      if (data.cashBalance !== undefined) setCashBalance(data.cashBalance);
    }
  };

  const saveAccounts = async () => {
    await saveData({
      accounts,
      cashBalance,
    });
  };

  useEffect(() => {
    saveAccounts();
  }, [accounts, cashBalance]);

  const totalBalance = accounts.reduce((sum, acc) => sum + acc.balance, 0) + cashBalance;
  const bankBalance = accounts.filter(a => a.type === 'bank').reduce((sum, acc) => sum + acc.balance, 0);
  const income = 175800;
  const expense = 42500;

  return (
    <SafeAreaView style={styles.container}>
      <ScrollView style={styles.scrollView} contentContainerStyle={styles.content}>
        {/* Header */}
        <View style={styles.header}>
          <Text style={styles.headerTitle}>Dashboard</Text>
        </View>

        {/* Total Balance Card */}
        <View style={styles.totalBalanceCard}>
          <Text style={styles.totalBalanceLabel}>සම්පූර්ණ ශේෂය</Text>
          <Text style={styles.totalBalanceAmount}>{formatCurrency(totalBalance)}</Text>
        </View>

        {/* Income & Expense */}
        <View style={styles.statsRow}>
          <View style={[styles.statCard, styles.incomeCard]}>
            <Text style={styles.statLabel}>බැංකු ශේෂය</Text>
            <Text style={styles.statAmount}>{formatCurrency(bankBalance)}</Text>
          </View>
          <View style={[styles.statCard, styles.expenseCard]}>
            <Text style={styles.statLabel}>මුදල් ශේෂය</Text>
            <Text style={styles.statAmount}>{formatCurrency(cashBalance)}</Text>
          </View>
        </View>

        {/* Recent Transactions */}
        <View style={styles.section}>
          <Text style={styles.sectionTitle}>ගනුම් කොරන්ත</Text>

          {/* Bank Accounts */}
          <View style={styles.accountSection}>
            <View style={styles.sectionHeader}>
              <Text style={styles.subsectionTitle}>බැංකු ගිණුම්</Text>
              <TouchableOpacity style={styles.addButton}>
                <Icon name="plus" size={20} color="#fff" />
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
            <View style={styles.sectionHeader}>
              <Text style={styles.subsectionTitle}>මුදල් ගිණුම්</Text>
              <TouchableOpacity style={styles.addButton}>
                <Icon name="plus" size={20} color="#fff" />
              </TouchableOpacity>
            </View>
            <View style={styles.cashCard}>
              <Text style={styles.cashCardTitle}>මුදල්</Text>
              <Text style={styles.cashCardAmount}>{formatCurrency(cashBalance)}</Text>
            </View>
          </View>
        </View>
      </ScrollView>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#f3f4f6',
  },
  scrollView: {
    flex: 1,
  },
  content: {
    paddingBottom: 20,
  },
  header: {
    backgroundColor: '#4f46e5',
    paddingVertical: 24,
    paddingHorizontal: 20,
    borderBottomLeftRadius: 30,
    borderBottomRightRadius: 30,
  },
  headerTitle: {
    fontSize: 28,
    fontWeight: 'bold',
    color: '#fff',
    textAlign: 'center',
  },
  totalBalanceCard: {
    backgroundColor: '#fff',
    borderRadius: 20,
    padding: 24,
    margin: 16,
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
  statsRow: {
    flexDirection: 'row',
    paddingHorizontal: 16,
    marginBottom: 16,
    gap: 12,
  },
  statCard: {
    flex: 1,
    borderRadius: 20,
    padding: 20,
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
  statLabel: {
    fontSize: 13,
    color: '#fff',
    opacity: 0.9,
    marginBottom: 8,
  },
  statAmount: {
    fontSize: 22,
    fontWeight: 'bold',
    color: '#fff',
  },
  section: {
    paddingHorizontal: 16,
    marginTop: 8,
  },
  sectionTitle: {
    fontSize: 20,
    fontWeight: 'bold',
    color: '#111827',
    marginBottom: 16,
  },
  accountSection: {
    marginBottom: 24,
  },
  sectionHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: 12,
  },
  subsectionTitle: {
    fontSize: 16,
    fontWeight: '600',
    color: '#374151',
  },
  addButton: {
    backgroundColor: '#4f46e5',
    borderRadius: 20,
    width: 40,
    height: 40,
    justifyContent: 'center',
    alignItems: 'center',
  },
  accountsList: {
    gap: 12,
  },
  cashCard: {
    backgroundColor: '#a855f7',
    borderRadius: 20,
    padding: 20,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 8,
    elevation: 4,
  },
  cashCardTitle: {
    fontSize: 18,
    fontWeight: '600',
    color: '#fff',
    marginBottom: 8,
  },
  cashCardAmount: {
    fontSize: 24,
    fontWeight: 'bold',
    color: '#fff',
  },
});
