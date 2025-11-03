import React from 'react';
import { View, Text, TouchableOpacity } from 'react-native';
import { styles } from '../styles';
import { formatCurrency } from '../utils/formatters';

const BalanceCard = ({ label, amount, type, onDeposit }) => {
  const backgroundStyle =
    type === 'bank' ? styles.bankCard : type === 'cash' ? styles.cashCard : null;
  const isNegative = amount < 0;

  return (
    <View
      style={[
        styles.balanceCard,
        backgroundStyle,
        isNegative && styles.negativeCard,
      ]}
    >
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
