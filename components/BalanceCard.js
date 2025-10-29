import React from 'react';
import { View, Text, TouchableOpacity } from 'react-native';
import { styles } from '../styles';
import { formatCurrency } from '../utils/formatters';

const BalanceCard = ({ label, amount, type, onDeposit }) => {
  return (
    <TouchableOpacity 
      style={[styles.balanceCard, type === 'bank' ? styles.bankCard : styles.cashCard]}
      onPress={onDeposit}
      disabled={!onDeposit}
    >
      <Text style={styles.balanceLabel}>{label}</Text>
      <Text style={styles.balanceAmount}>{formatCurrency(amount)}</Text>
      {onDeposit && (
        <Text style={styles.balanceHint}>Tap to deposit</Text>
      )}
    </TouchableOpacity>
  );
};

export default BalanceCard;