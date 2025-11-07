import React, { memo } from 'react';
import { Pressable, StyleSheet, Text, View } from 'react-native';
import { palette, radius, shadow, spacing } from '../styles/theme';
import { formatCurrency, formatPercentage } from '../utils/formatters';

const CategoryCard = ({ category, onPress, onEdit, onDelete }) => {
  const progress = category.target > 0 ? (category.spent / category.target) * 100 : 0;
  const boundedProgress = Math.min(100, Math.max(0, progress));
  const overSpent = progress > 100;

  return (
    <Pressable onPress={onPress} style={({ pressed }) => [styles.card, pressed && styles.cardPressed]}>
      <View style={styles.header}>
        <View style={[styles.colorDot, { backgroundColor: category.color ?? palette.primary }]} />
        <Text style={styles.name}>{category.name}</Text>
        <View style={styles.actions}>
          <Pressable onPress={onEdit} hitSlop={10} style={styles.actionButton}>
            <Text style={styles.actionText}>✏️</Text>
          </Pressable>
          <Pressable onPress={onDelete} hitSlop={10} style={styles.actionButton}>
            <Text style={styles.actionText}>🗑️</Text>
          </Pressable>
        </View>
      </View>

      <View style={styles.row}>
        <Text style={styles.label}>ඉලක්කය</Text>
        <Text style={styles.value}>{formatCurrency(category.target)}</Text>
      </View>
      <View style={styles.row}>
        <Text style={styles.label}>වියදම්</Text>
        <Text style={[styles.value, overSpent && styles.overSpent]}>{formatCurrency(category.spent)}</Text>
      </View>
      <View style={styles.row}>
        <Text style={styles.label}>ඉතිරි</Text>
        <Text style={styles.value}>{formatCurrency(Math.max(0, category.target - category.spent))}</Text>
      </View>

      <View style={styles.progressTrack}>
        <View style={[styles.progressFill, { width: `${boundedProgress}%`, backgroundColor: overSpent ? palette.danger : palette.accent }]} />
      </View>

      <View style={styles.footer}>
        <Text style={styles.progressLabel}>{formatPercentage(progress)}</Text>
        {!!category.unitPrice && <Text style={styles.unit}>{`ඒකක මිල: ${formatCurrency(category.unitPrice)}`}</Text>}
      </View>
    </Pressable>
  );
};

const styles = StyleSheet.create({
  card: {
    backgroundColor: palette.surface,
    borderRadius: radius.lg,
    padding: spacing.lg,
    marginBottom: spacing.md,
    ...shadow.card,
  },
  cardPressed: {
    transform: [{ scale: 0.99 }],
  },
  header: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: spacing.md,
  },
  colorDot: {
    width: 12,
    height: 12,
    borderRadius: 6,
    marginRight: spacing.sm,
  },
  name: {
    flex: 1,
    fontSize: 16,
    fontWeight: '600',
    color: palette.text,
  },
  actions: {
    flexDirection: 'row',
  },
  actionButton: {
    paddingHorizontal: spacing.xs,
  },
  actionText: {
    fontSize: 15,
  },
  row: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    marginBottom: spacing.xs,
  },
  label: {
    color: palette.textSecondary,
    fontSize: 13,
  },
  value: {
    color: palette.text,
    fontWeight: '600',
  },
  overSpent: {
    color: palette.danger,
  },
  progressTrack: {
    height: 8,
    backgroundColor: palette.surfaceAlt,
    borderRadius: radius.md,
    marginVertical: spacing.sm,
    overflow: 'hidden',
  },
  progressFill: {
    height: '100%',
  },
  footer: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
  },
  progressLabel: {
    color: palette.textSecondary,
    fontSize: 12,
  },
  unit: {
    color: palette.textSecondary,
    fontSize: 12,
  },
});

export default memo(CategoryCard);
