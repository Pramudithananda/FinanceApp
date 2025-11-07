import React from 'react';
import { Pressable, StyleSheet, Text, View } from 'react-native';
import { palette, radius, shadow, spacing } from '../styles/theme';
import { formatCurrency } from '../utils/formatters';

const balanceTypeConfig = {
  bank: {
    background: palette.primary,
    highlight: 'rgba(255,255,255,0.15)',
    emoji: '🏦',
  },
  cash: {
    background: palette.success,
    highlight: 'rgba(255,255,255,0.25)',
    emoji: '💵',
  },
};

const BalanceCard = ({ label, amount, type, onAction, actionLabel }) => {
  const config = balanceTypeConfig[type] ?? balanceTypeConfig.bank;

  return (
    <View style={[styles.card, { backgroundColor: config.background }]}>
      <View style={styles.header}>
        <Text style={styles.emoji}>{config.emoji}</Text>
        <Text style={styles.label}>{label}</Text>
      </View>

      <Text style={styles.amount}>{formatCurrency(amount)}</Text>

      {onAction ? (
        <Pressable onPress={onAction} style={({ pressed }) => [styles.actionButton, pressed && styles.actionButtonPressed]}>
          <Text style={styles.actionLabel}>{actionLabel}</Text>
        </Pressable>
      ) : (
        <View style={[styles.placeholder, { backgroundColor: config.highlight }]} />
      )}
    </View>
  );
};

const styles = StyleSheet.create({
  card: {
    flex: 1,
    borderRadius: radius.lg,
    padding: spacing.lg,
    ...shadow.card,
  },
  header: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: spacing.sm,
  },
  emoji: {
    fontSize: 24,
    marginRight: spacing.sm,
  },
  label: {
    color: palette.surface,
    fontSize: 16,
    fontWeight: '600',
  },
  amount: {
    color: palette.surface,
    fontSize: 22,
    fontWeight: '700',
    marginBottom: spacing.md,
  },
  actionButton: {
    backgroundColor: 'rgba(15,23,42,0.15)',
    paddingVertical: spacing.sm,
    borderRadius: radius.md,
    alignItems: 'center',
  },
  actionButtonPressed: {
    opacity: 0.8,
  },
  actionLabel: {
    color: palette.surface,
    fontWeight: '600',
  },
  placeholder: {
    height: 16,
    borderRadius: radius.md,
  },
});

export default BalanceCard;
