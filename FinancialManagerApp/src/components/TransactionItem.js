import React from 'react';
import { View, Text, TouchableOpacity } from 'react-native';
import { styles } from '../styles';
import { formatCurrency } from '../utils/formatters';

const TransactionItem = ({ transaction, onEdit, onDelete }) => {
  let icon, amountStyle, sign;
  
  if (transaction.type === 'bank-deposit') {
    icon = '🏦';
    amountStyle = styles.depositAmount; // Already green
    sign = '+';
  } else if (transaction.type === 'income') {
    icon = '⬇️';
    amountStyle = styles.incomeAmount;
    sign = '+';
  } else {
    icon = '⬆️';
    amountStyle = styles.expenseAmount;
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
      <View style={styles.transactionRight}>
        <Text style={[styles.transactionAmount, amountStyle]}>
          {sign}{formatCurrency(transaction.amount)}
        </Text>
        <View style={styles.transactionActions}>
          <TouchableOpacity
            style={styles.transactionActionButton}
            onPress={() => onEdit(transaction)}
          >
            <Text style={styles.transactionActionText}>✏️</Text>
          </TouchableOpacity>
          <TouchableOpacity
            style={styles.transactionActionButton}
            onPress={() => onDelete(transaction)}
          >
            <Text style={styles.transactionActionText}>🗑️</Text>
          </TouchableOpacity>
        </View>
      </View>
    </View>
  );
};

export default TransactionItem;
