import React from 'react';
import { View, Text } from 'react-native';
import { styles } from '../styles';
import { formatCurrency } from '../utils/formatters';

const TransactionItem = ({ transaction }) => {
  let icon = '⬆️';
  let amountStyle = styles.expenseAmount;
  let sign = '-';
  let defaultDescription = transaction.category?.name || 'වියදම';

  if (transaction.type === 'bank-deposit') {
    icon = '🏦';
    amountStyle = styles.depositAmount;
    sign = '+';
    defaultDescription = 'බැංකුවට තැන්පත් කිරීම';
  } else if (transaction.type === 'income') {
    icon = '⬇️';
    amountStyle = styles.incomeAmount;
    sign = '+';
    defaultDescription = 'මුදල් ලබාගැනීම';
  }

  const description = transaction.description?.trim()?.length
    ? transaction.description
    : defaultDescription;

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
