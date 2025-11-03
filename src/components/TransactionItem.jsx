import React from 'react';
import { View, Text } from 'react-native';
import { styles } from '../styles';
import { formatCurrency } from '../utils/formatters';

const TransactionItem = ({ transaction }) => {
  let icon;
  let amountStyle = styles.transactionAmount;
  let sign = '';

  switch (transaction.type) {
    case 'bank-deposit':
      icon = '??';
      amountStyle = [styles.transactionAmount, styles.depositAmount];
      sign = '+';
      break;
    case 'income':
      icon = '??';
      amountStyle = [styles.transactionAmount, styles.incomeAmount];
      sign = '+';
      break;
    case 'expense':
    default:
      icon = '??';
      amountStyle = [styles.transactionAmount, styles.expenseAmount];
      sign = '-';
      break;
  }

  let description = transaction.description;

  if (!description) {
    if (transaction.type === 'bank-deposit') {
      description = '??????? ??????? ?????';
    } else if (transaction.type === 'income') {
      description = '????? ????????';
    } else {
      description = transaction.category?.name || '?????';
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
      <Text style={amountStyle}>
        {sign}
        {formatCurrency(transaction.amount)}
      </Text>
    </View>
  );
};

export default TransactionItem;
