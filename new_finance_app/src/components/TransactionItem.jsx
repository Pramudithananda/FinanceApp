import React from 'react';
import { StyleSheet, Text, View } from 'react-native';
import { palette, radius, spacing } from '../styles/theme';
import { formatCurrency, formatDateTime } from '../utils/formatters';

const typeConfig = {
  'bank-deposit': {
    icon: '🏦',
    color: palette.accent,
    sign: '+',
    label: 'බැංකුවට තැන්පත්',
  },
  'cash-withdrawal': {
    icon: '💸',
    color: palette.warning,
    sign: '−',
    label: 'බැංකුවෙන් මුදල්',
  },
  income: {
    icon: '💹',
    color: palette.success,
    sign: '+',
    label: 'ආදායම',
  },
  expense: {
    icon: '🧾',
    color: palette.danger,
    sign: '−',
    label: 'වියදම',
  },
};

const TransactionItem = ({ transaction }) => {
  const config = typeConfig[transaction.type] ?? typeConfig.expense;
  const description =
    transaction.description ||
    (transaction.type === 'expense' ? transaction.categoryName ?? config.label : config.label);

  return (
    <View style={styles.container}>
      <View style={[styles.icon, { backgroundColor: `${config.color}22` }]}>
        <Text style={styles.iconText}>{config.icon}</Text>
      </View>
      <View style={styles.meta}>
        <Text style={styles.title}>{description}</Text>
        {!!transaction.categoryName && transaction.type === 'expense' ? (
          <Text style={styles.categoryText}>{transaction.categoryName}</Text>
        ) : null}
        <Text style={styles.date}>{formatDateTime(transaction.createdAt)}</Text>
      </View>
      <Text style={[styles.amount, { color: config.color }]}>
        {config.sign}
        {formatCurrency(transaction.amount)}
      </Text>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: palette.surface,
    borderRadius: radius.lg,
    padding: spacing.md,
    marginBottom: spacing.sm,
  },
  icon: {
    width: 44,
    height: 44,
    borderRadius: 22,
    alignItems: 'center',
    justifyContent: 'center',
    marginRight: spacing.md,
  },
  iconText: {
    fontSize: 22,
  },
  meta: {
    flex: 1,
  },
  title: {
    color: palette.text,
    fontWeight: '600',
    marginBottom: 2,
  },
  categoryText: {
    color: palette.textSecondary,
    fontSize: 12,
  },
  date: {
    color: palette.textSecondary,
    fontSize: 12,
  },
  amount: {
    fontSize: 16,
    fontWeight: '700',
  },
});

export default TransactionItem;
