import React from 'react';
import { View, Text } from 'react-native';
import { styles } from '../styles';
import { formatCurrency } from '../utils/formatters';

const TransactionItem = ({ transaction }) => {
  let icon, amountClass, sign;
  
  if (transaction.type === 'bank-deposit') {
    icon = '🏦';
    amountClass = styles.depositAmount;
    sign = '+';
  } else if (transaction.type === 'income') {
    icon = '⬇️';
    amountClass = styles.incomeAmount;
    sign = '+';
  } else {
    icon = '⬆️';
    amountClass = styles.expenseAmount;
    sign = '-';
  }
  
  let description;
  if (transaction.type === 'bank-deposit') {
    description = 'බැංකුවට තැන්පත් කිරීම';
  } else if (transaction.type === 'income') {
    description = 'මුදල් ලබාගැනීම';
  } else {
    description = transaction.category?.name || 'වියදම';
  }
  
  if (transaction.description) {
    description = transaction.description;
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
      <Text style={[styles.transactionAmount, amountClass]}>
        {sign}{formatCurrency(transaction.amount)}
      </Text>
    </View>
  );
};

export default TransactionItem;
