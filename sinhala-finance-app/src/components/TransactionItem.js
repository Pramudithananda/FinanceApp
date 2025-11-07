import React from 'react';
import { View, Text } from 'react-native';
import { styles } from '../theme/styles';
import { formatCurrency, formatDateTime } from '../utils/formatters';
import { TRANSACTION_TYPES } from '../hooks/useFinanceData';

const typeConfig = {
  [TRANSACTION_TYPES.BANK_DEPOSIT]: {
    icon: '🏦',
    amountStyle: styles.amountDeposit,
    fallback: 'බැංකුවට තැන්පත් කිරීම',
    sign: '+',
  },
  [TRANSACTION_TYPES.CASH_WITHDRAWAL]: {
    icon: '⬇️',
    amountStyle: styles.amountIncome,
    fallback: 'බැංකුවෙන් cash වෙත',
    sign: '+',
  },
  [TRANSACTION_TYPES.CASH_EXPENSE]: {
    icon: '⬆️',
    amountStyle: styles.amountExpense,
    fallback: 'වියදම',
    sign: '-',
  },
};

const TransactionItem = ({ transaction }) => {
  const config = typeConfig[transaction.type] ?? typeConfig[TRANSACTION_TYPES.CASH_EXPENSE];
  const description =
    transaction.description?.trim() ||
    transaction.categoryName ||
    config.fallback;

  return (
    <View style={styles.transactionItem}>
      <View style={styles.transactionIcon}>
        <Text>{config.icon}</Text>
      </View>
      <View style={styles.transactionDetails}>
        <Text style={styles.transactionTitle}>{description}</Text>
        <Text style={styles.transactionMeta}>{formatDateTime(transaction.createdAt)}</Text>
      </View>
      <Text style={[styles.transactionAmount, config.amountStyle]}>
        {config.sign}
        {formatCurrency(transaction.amount)}
      </Text>
    </View>
  );
};

export default TransactionItem;
