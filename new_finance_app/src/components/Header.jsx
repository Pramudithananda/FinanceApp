import React from 'react';
import { StyleSheet, Text, View } from 'react-native';
import { palette, radius, spacing } from '../styles/theme';
import { formatCurrency } from '../utils/formatters';

const Header = ({ title, subtitle, bankBalance, cashBalance }) => (
  <View style={styles.wrapper}>
    <View style={styles.badge}>
      <Text style={styles.badgeText}>💰</Text>
    </View>
    <View style={styles.textBlock}>
      <Text style={styles.title}>{title}</Text>
      <Text style={styles.subtitle}>{subtitle}</Text>
    </View>
    <View style={styles.balanceBlock}>
      <Text style={styles.balanceTitle}>බැංකු ශේෂය</Text>
      <Text style={styles.balanceValue}>{formatCurrency(bankBalance)}</Text>
      <Text style={[styles.balanceTitle, styles.cashLabel]}>මුදල් ශේෂය</Text>
      <Text style={[styles.balanceValue, styles.cashValue]}>{formatCurrency(cashBalance)}</Text>
    </View>
  </View>
);

const styles = StyleSheet.create({
  wrapper: {
    backgroundColor: palette.primaryDark,
    paddingHorizontal: spacing.lg,
    paddingTop: spacing.xl,
    paddingBottom: spacing.lg,
    borderBottomLeftRadius: radius.xl,
    borderBottomRightRadius: radius.xl,
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
  },
  badge: {
    backgroundColor: palette.accent,
    width: 60,
    height: 60,
    borderRadius: radius.lg,
    alignItems: 'center',
    justifyContent: 'center',
  },
  badgeText: {
    fontSize: 28,
  },
  textBlock: {
    flex: 1,
    paddingHorizontal: spacing.md,
  },
  title: {
    color: palette.surface,
    fontSize: 20,
    fontWeight: '700',
    marginBottom: spacing.xs,
  },
  subtitle: {
    color: 'rgba(255,255,255,0.8)',
    fontSize: 14,
  },
  balanceBlock: {
    alignItems: 'flex-end',
  },
  balanceTitle: {
    color: 'rgba(255,255,255,0.7)',
    fontSize: 12,
  },
  balanceValue: {
    color: palette.surface,
    fontSize: 16,
    fontWeight: '600',
  },
  cashLabel: {
    marginTop: spacing.sm,
  },
  cashValue: {
    color: palette.success,
  },
});

export default Header;
