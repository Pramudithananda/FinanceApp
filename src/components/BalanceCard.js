import React from 'react';
import { View, Text, TouchableOpacity } from 'react-native';
import { styles } from '../styles';
import { formatCurrency } from '../utils/formatters';

const BalanceCard = ({ label, amount, type, onDeposit }) => {
  const cardStyle = [styles.balanceCard];

  if (type === 'bank') {
    cardStyle.push(styles.bankCard);
  } else if (type === 'cash') {
    cardStyle.push(styles.cashCard);
  }

  if (amount < 0) {
    cardStyle.push(styles.negativeCard);
  }

  return (
    <View style={cardStyle}>
      {type === 'bank' && typeof onDeposit === 'function' ? (
        <TouchableOpacity style={styles.depositBtn} onPress={onDeposit}>
          <Text style={styles.depositBtnText}>+ තැන්පත්</Text>
        </TouchableOpacity>
      ) : null}

      <Text style={styles.balanceLabel}>{label}</Text>
      <Text style={styles.balanceAmount}>{formatCurrency(amount)}</Text>
    </View>
  );
};

export default BalanceCard;
