import React from 'react';
import { View, Text } from 'react-native';
import { styles } from '../styles';
import { formatCurrency } from '../utils/formatters';

const getMetaForType = (transaction) => {
  switch (transaction.type) {
    case 'bank-deposit':
      return { icon: '🏦', amountStyle: styles.amountNeutral, label: 'බැංකු තැන්පත්' };
    case 'income':
      return { icon: '⬇️', amountStyle: styles.amountPositive, label: 'මුදල් ලබාගැනීම' };
    case 'expense':
    default:
      return {
        icon: '⬆️',
        amountStyle: styles.amountNegative,
        label: transaction.category?.name || 'වියදම',
      };
  }
};

const TransactionItem = ({ transaction }) => {
  const meta = getMetaForType(transaction);
  const amountPrefix = meta.amountStyle === styles.amountNegative ? '-' : '+';

  return (
    <View style={styles.transactionItem}>
      <View style={styles.transactionIcon}>
        <Text>{meta.icon}</Text>
      </View>

      <View style={styles.transactionDetails}>
        <Text style={styles.transactionDescription}>
          {transaction.description || meta.label}
        </Text>
        <Text style={styles.transactionDate}>{transaction.date}</Text>
      </View>

      <Text style={[styles.transactionAmount, meta.amountStyle]}>
        {amountPrefix}
        {formatCurrency(transaction.amount)}
      </Text>
    </View>
  );
};

export default TransactionItem;
