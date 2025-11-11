import React from 'react';
import { View, Text, StyleSheet } from 'react-native';

const BalanceCard = ({ label, amount, highlighted = false }) => {
  const formatCurrency = (amount) => {
    return `රු ${amount.toLocaleString('en-US')}`;
  };

  return (
    <View style={[styles.card, highlighted && styles.highlightedCard]}>
      <Text style={[styles.label, highlighted && styles.highlightedLabel]}>
        {label}
      </Text>
      <Text style={[styles.amount, highlighted && styles.highlightedAmount]}>
        {formatCurrency(amount)}
      </Text>
    </View>
  );
};

const styles = StyleSheet.create({
  card: {
    backgroundColor: '#fff',
    borderRadius: 16,
    padding: 24,
    alignItems: 'center',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 8,
    elevation: 5,
  },
  highlightedCard: {
    backgroundColor: '#4F46E5',
  },
  label: {
    fontSize: 14,
    color: '#6B7280',
    marginBottom: 8,
  },
  highlightedLabel: {
    color: 'rgba(255, 255, 255, 0.9)',
  },
  amount: {
    fontSize: 36,
    fontWeight: 'bold',
    color: '#4F46E5',
  },
  highlightedAmount: {
    color: '#fff',
  },
});

export default BalanceCard;
