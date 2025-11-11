import React from 'react';
import { View, Text, StyleSheet } from 'react-native';
import { formatCurrency } from '../utils/formatters';

const AccountCard = ({ account }) => {
  const getCardColor = (id) => {
    if (id === 1) return '#4f46e5';
    if (id === 2) return '#10b981';
    return '#f97316';
  };

  return (
    <View style={[styles.card, { backgroundColor: getCardColor(account.id) }]}>
      <View style={styles.cardHeader}>
        <View style={styles.cardInfo}>
          <Text style={styles.accountName}>{account.name}</Text>
          <Text style={styles.accountNumber}>{account.number}</Text>
        </View>
        {account.id === 1 && (
          <View style={styles.activeIndicator}>
            <View style={styles.activeDot} />
          </View>
        )}
      </View>
      <Text style={styles.balance}>{formatCurrency(account.balance)}</Text>
    </View>
  );
};

const styles = StyleSheet.create({
  card: {
    borderRadius: 20,
    padding: 16,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.2,
    shadowRadius: 8,
    elevation: 4,
  },
  cardHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'flex-start',
    marginBottom: 12,
  },
  cardInfo: {
    flex: 1,
  },
  accountName: {
    fontSize: 18,
    fontWeight: '600',
    color: '#fff',
    marginBottom: 4,
  },
  accountNumber: {
    fontSize: 13,
    color: '#fff',
    opacity: 0.8,
  },
  activeIndicator: {
    backgroundColor: 'rgba(255, 255, 255, 0.3)',
    borderRadius: 12,
    padding: 4,
  },
  activeDot: {
    width: 16,
    height: 16,
    backgroundColor: '#fff',
    borderRadius: 8,
  },
  balance: {
    fontSize: 24,
    fontWeight: 'bold',
    color: '#fff',
  },
});

export default AccountCard;
