import React from 'react';
import { View, Text, TouchableOpacity } from 'react-native';
import { styles } from '../styles';
import { formatCurrency } from '../utils/formatters';

const BalanceCard = ({ label, amount, type, onDeposit }) => {
  const getCardStyle = () => {
    if (amount < 0) return styles.negativeCard;
    return type === 'bank' ? styles.bankCard : styles.cashCard;
  };

  return (
    <View style={[styles.balanceCard, getCardStyle()]}>
      {onDeposit && (
        <TouchableOpacity style={styles.depositBtn} onPress={onDeposit}>
          <Text style={styles.depositBtnText}>+</Text>
        </TouchableOpacity>
      )}
      <Text style={styles.balanceLabel}>{label}</Text>
      <Text style={styles.balanceAmount}>{formatCurrency(amount)}</Text>
    </View>
  );
};

export default BalanceCard;