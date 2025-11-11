import React from 'react';
import {
  View,
  Text,
  ScrollView,
  StyleSheet,
  TouchableOpacity,
  Dimensions,
} from 'react-native';
import { useApp } from '../context/AppContext';
import { formatCurrency } from '../utils/formatters';
import Icon from 'react-native-vector-icons/MaterialCommunityIcons';

const { width } = Dimensions.get('window');

export default function DashboardScreen({ navigation }) {
  const { accounts, getTotalBalance, getBankBalance, getCashBalance } = useApp();

  const totalBalance = getTotalBalance();
  const bankBalance = getBankBalance();
  const cashBalance = getCashBalance();

  const bankAccounts = accounts.filter(a => a.type === 'bank');
  const cashAccounts = accounts.filter(a => a.type === 'cash');

  const getAccountColor = (index) => {
    const colors = ['#4F46E5', '#10B981', '#F59E0B', '#8B5CF6'];
    return colors[index % colors.length];
  };

  return (
    <ScrollView style={styles.container}>
      {/* Total Balance Card */}
      <View style={styles.totalBalanceCard}>
        <Text style={styles.totalBalanceLabel}>සම්පූර්ණ ශේෂය</Text>
        <Text style={styles.totalBalanceAmount}>{formatCurrency(totalBalance)}</Text>
      </View>

      {/* Income & Expense Summary */}
      <View style={styles.summaryContainer}>
        <View style={[styles.summaryCard, { backgroundColor: '#3B82F6' }]}>
          <Icon name="bank" size={28} color="#FFFFFF" />
          <Text style={styles.summaryLabel}>බැංකු ශේෂය</Text>
          <Text style={styles.summaryAmount}>{formatCurrency(bankBalance)}</Text>
        </View>
        <View style={[styles.summaryCard, { backgroundColor: '#10B981' }]}>
          <Icon name="cash" size={28} color="#FFFFFF" />
          <Text style={styles.summaryLabel}>මුදල් ශේෂය</Text>
          <Text style={styles.summaryAmount}>{formatCurrency(cashBalance)}</Text>
        </View>
      </View>

      {/* Bank Accounts Section */}
      <View style={styles.section}>
        <View style={styles.sectionHeader}>
          <Text style={styles.sectionTitle}>බැංකු ගිණුම්</Text>
          <TouchableOpacity
            style={styles.addButton}
            onPress={() => navigation.navigate('Bank')}
          >
            <Icon name="plus-circle" size={28} color="#4F46E5" />
          </TouchableOpacity>
        </View>

        {bankAccounts.map((account, index) => (
          <TouchableOpacity
            key={account.id}
            style={[styles.accountCard, { backgroundColor: getAccountColor(index) }]}
            onPress={() => navigation.navigate('Bank')}
          >
            <View style={styles.accountHeader}>
              <View>
                <Text style={styles.accountName}>{account.name}</Text>
                <Text style={styles.accountNumber}>{account.number}</Text>
              </View>
              {index === 0 && (
                <View style={styles.primaryBadge}>
                  <Icon name="star" size={16} color="#FFFFFF" />
                </View>
              )}
            </View>
            <Text style={styles.accountBalance}>{formatCurrency(account.balance)}</Text>
          </TouchableOpacity>
        ))}
      </View>

      {/* Cash Accounts Section */}
      <View style={styles.section}>
        <View style={styles.sectionHeader}>
          <Text style={styles.sectionTitle}>මුදල් ගිණුම්</Text>
          <TouchableOpacity
            style={styles.addButton}
            onPress={() => navigation.navigate('Cash')}
          >
            <Icon name="plus-circle" size={28} color="#4F46E5" />
          </TouchableOpacity>
        </View>

        {cashAccounts.map((account) => (
          <TouchableOpacity
            key={account.id}
            style={[styles.accountCard, { backgroundColor: '#8B5CF6' }]}
            onPress={() => navigation.navigate('Cash')}
          >
            <View style={styles.accountHeader}>
              <View>
                <Text style={styles.accountName}>{account.name}</Text>
                <Text style={styles.accountNumber}>දැනට ඇති මුදල්</Text>
              </View>
            </View>
            <Text style={styles.accountBalance}>{formatCurrency(account.balance)}</Text>
          </TouchableOpacity>
        ))}
      </View>

      <View style={styles.bottomPadding} />
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#F3F4F6',
  },
  totalBalanceCard: {
    backgroundColor: '#FFFFFF',
    margin: 16,
    padding: 24,
    borderRadius: 20,
    alignItems: 'center',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 8,
    elevation: 5,
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
  summaryContainer: {
    flexDirection: 'row',
    paddingHorizontal: 16,
    gap: 12,
    marginBottom: 8,
  },
  summaryCard: {
    flex: 1,
    padding: 20,
    borderRadius: 16,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 8,
    elevation: 5,
  },
  summaryLabel: {
    fontSize: 12,
    color: '#FFFFFF',
    marginTop: 8,
    opacity: 0.9,
  },
  summaryAmount: {
    fontSize: 20,
    fontWeight: 'bold',
    color: '#FFFFFF',
    marginTop: 4,
  },
  section: {
    padding: 16,
  },
  sectionHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: 12,
  },
  sectionTitle: {
    fontSize: 20,
    fontWeight: 'bold',
    color: '#1F2937',
  },
  addButton: {
    padding: 4,
  },
  accountCard: {
    padding: 20,
    borderRadius: 16,
    marginBottom: 12,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 8,
    elevation: 5,
  },
  accountHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'flex-start',
    marginBottom: 12,
  },
  accountName: {
    fontSize: 18,
    fontWeight: '600',
    color: '#FFFFFF',
  },
  accountNumber: {
    fontSize: 13,
    color: '#FFFFFF',
    opacity: 0.8,
    marginTop: 4,
  },
  primaryBadge: {
    backgroundColor: 'rgba(255, 255, 255, 0.3)',
    borderRadius: 20,
    padding: 8,
  },
  accountBalance: {
    fontSize: 28,
    fontWeight: 'bold',
    color: '#FFFFFF',
  },
  bottomPadding: {
    height: 24,
  },
});
