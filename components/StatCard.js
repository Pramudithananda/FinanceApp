import React from 'react';
import { View, Text, StyleSheet } from 'react-native';

const StatCard = ({ label, amount, color, icon }) => {
  const formatCurrency = (amount) => {
    return `රු ${amount.toLocaleString('en-US')}`;
  };

  return (
    <View style={[styles.card, { backgroundColor: color }]}>
      {icon && <Text style={styles.icon}>{icon}</Text>}
      <Text style={styles.label}>{label}</Text>
      <Text style={styles.amount}>{formatCurrency(amount)}</Text>
    </View>
  );
};

const styles = StyleSheet.create({
  card: {
    flex: 1,
    borderRadius: 16,
    padding: 20,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 8,
    elevation: 5,
  },
  icon: {
    fontSize: 24,
    marginBottom: 8,
  },
  label: {
    fontSize: 12,
    color: 'rgba(255, 255, 255, 0.9)',
    marginBottom: 8,
  },
  amount: {
    fontSize: 20,
    fontWeight: 'bold',
    color: '#fff',
  },
});

export default StatCard;
