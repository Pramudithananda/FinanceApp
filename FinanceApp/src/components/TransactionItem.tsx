import React from 'react';
import { View, Text } from 'react-native';
import { styles } from '../styles';
import { formatCurrency } from '../utils/formatters';

interface Transaction {
  id: number;
  type: string;
  amount: number;
  category?: {
    id: number;
    name: string;
  };
  description?: string;
  date: string;
  timestamp: number;
}

interface TransactionItemProps {
  transaction: Transaction;
}

const TransactionItem: React.FC<TransactionItemProps> = ({ transaction }) => {
  let icon: string, amountClass: any, sign: string;
  
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
  
  let description: string;
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