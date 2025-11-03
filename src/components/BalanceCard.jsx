import React from 'react';
import { View, Text, TouchableOpacity } from 'react-native';
import { styles } from '../styles';
import { formatCurrency } from '../utils/formatters';

const BalanceCard = ({ label, amount, type, onDeposit }) => {
  const cardStyles = [styles.balanceCard];

  if (type === 'bank') {
    cardStyles.push(styles.bankCard);
  } else if (type === 'cash') {
    cardStyles.push(styles.cashCard);
  }

  if (amount < 0) {
    cardStyles.push(styles.negativeCard);
  }

  return (
    <View style={cardStyles}>
      {type === 'bank' && onDeposit && (
        <TouchableOpacity
          style={styles.depositBadge}
          onPress={onDeposit}
          accessibilityRole="button"
          accessibilityLabel="??????? ??????? ?????"
        >
          <Text style={styles.depositBadgeText}>?</Text>
        </TouchableOpacity>
      )}

      <Text style={styles.balanceLabel}>{label}</Text>
      <Text style={styles.balanceAmount}>{formatCurrency(amount)}</Text>
    </View>
  );
};

export default BalanceCard;
