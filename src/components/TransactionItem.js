import React from 'react';
import { View, Text } from 'react-native';
import { styles } from '../styles';
import { formatCurrency } from '../utils/formatters';

const TransactionItem = ({ transaction }) => {
  let icon = '⬆️';
  let amountStyle = styles.expenseAmount;
  let sign = '-';

  switch (transaction.type) {
    case 'bank-deposit':
      icon = '🏦';
      amountStyle = styles.depositAmount;
      sign = '+';
      break;
    case 'income':
      icon = '⬇️';
      amountStyle = styles.incomeAmount;
      sign = '+';
      break;
    default:
      icon = '⬆️';
      amountStyle = styles.expenseAmount;
      sign = '-';
      break;
  }

  let description = transaction.description;

  if (!description) {
    if (transaction.type === 'bank-deposit') {
      description = 'බැංකුවට තැන්පත් කිරීම';
    } else if (transaction.type === 'income') {
      description = 'මුදල් ලබාගැනීම';
    } else {
      description = transaction.category?.name || 'වියදම';
    }
  }

  return (
    <View style={styles.transactionItem}>
      <View style={styles.transactionIcon}>
        <Text>{icon}</Text>
      </View>
      <View style={styles.transactionDetails}>
        <Text style={styles.transactionDescription}>{description}</Text>
        <Text style={styles.transactionDate}>{transaction.date}</Text>
      </View>
      <Text style={[styles.transactionAmount, amountStyle]}>
        {sign}
        {formatCurrency(transaction.amount)}
      </Text>
    </View>
  );
};

export default TransactionItem;
