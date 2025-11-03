import React from 'react';
import { View, Text, TouchableOpacity } from 'react-native';
import { styles } from '../styles';
import { formatCurrency } from '../utils/formatters';

const BalanceCard = ({ label, amount, type, onDeposit }) => {
  const isNegative = amount < 0;
  const cardStyle = isNegative 
    ? [styles.balanceCard, styles.negativeCard]
    : type === 'bank' 
      ? [styles.balanceCard, styles.bankCard]
      : [styles.balanceCard, styles.cashCard];

  return (
    <View style={cardStyle}>
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
