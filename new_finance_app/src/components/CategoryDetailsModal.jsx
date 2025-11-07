import React from 'react';
import { Modal, Pressable, ScrollView, StyleSheet, Text, View } from 'react-native';
import { palette, radius, spacing } from '../styles/theme';
import { formatCurrency, formatDateTime, formatPercentage } from '../utils/formatters';

const CategoryDetailsModal = ({ visible, category, transactions = [], onClose }) => {
  if (!category) {
    return null;
  }

  const progress = category.target > 0 ? (category.spent / category.target) * 100 : 0;
  const remaining = Math.max(0, category.target - category.spent);
  const averageSpend = transactions.length > 0 ? category.spent / transactions.length : 0;

  return (
    <Modal visible={visible} animationType="fade" transparent onRequestClose={onClose}>
      <View style={styles.overlay}>
        <Pressable style={styles.backdrop} onPress={onClose} />
        <View style={styles.card}>
          <View style={styles.header}>
            <View style={[styles.colorBadge, { backgroundColor: category.color ?? palette.primary }]} />
            <View style={styles.headerContent}>
              <Text style={styles.title}>{category.name}</Text>
              <Text style={styles.subtitle}>කාණ්ඩ විස්තර</Text>
            </View>
            <Pressable onPress={onClose} hitSlop={12}>
              <Text style={styles.close}>✕</Text>
            </Pressable>
          </View>

          <View style={styles.statsRow}>
            <View style={styles.statCard}>
              <Text style={styles.statLabel}>ඉලක්කය</Text>
              <Text style={styles.statValue}>{formatCurrency(category.target)}</Text>
            </View>
            <View style={styles.statCard}>
              <Text style={styles.statLabel}>වියදම්</Text>
              <Text style={styles.statValue}>{formatCurrency(category.spent)}</Text>
            </View>
            <View style={styles.statCard}>
              <Text style={styles.statLabel}>ඉතිරි</Text>
              <Text style={styles.statValue}>{formatCurrency(remaining)}</Text>
            </View>
          </View>

          <View style={styles.progress}>
            <View style={styles.progressTrack}>
              <View
                style={[
                  styles.progressFill,
                  {
                    width: `${Math.min(100, Math.max(0, progress))}%`,
                    backgroundColor: progress > 100 ? palette.danger : palette.accent,
                  },
                ]}
              />
            </View>
            <Text style={styles.progressText}>{formatPercentage(progress)}</Text>
          </View>

          <View style={styles.metaRow}>
            <View style={styles.metaItem}>
              <Text style={styles.metaLabel}>ගනුදෙනු ගණන</Text>
              <Text style={styles.metaValue}>{transactions.length}</Text>
            </View>
            <View style={styles.metaItem}>
              <Text style={styles.metaLabel}>සමාන්‍ය වියදම</Text>
              <Text style={styles.metaValue}>{formatCurrency(averageSpend)}</Text>
            </View>
            <View style={styles.metaItem}>
              <Text style={styles.metaLabel}>අවසන් යාවත්කාලීන</Text>
              <Text style={styles.metaValueSecondary}>{formatDateTime(category.updatedAt)}</Text>
            </View>
          </View>

          <Text style={styles.sectionTitle}>ගනුදෙනු ඉතිහාසය</Text>

          <ScrollView style={styles.transactionList} contentContainerStyle={styles.transactionContent}>
            {transactions.length === 0 ? (
              <View style={styles.emptyState}>
                <Text style={styles.emptyText}>මෙම කාණ්ඩය සඳහා ගනුදෙනු නොමැත.</Text>
              </View>
            ) : (
              transactions.map((transaction) => (
                <View key={transaction.id} style={styles.transactionItem}>
                  <View style={styles.transactionHeader}>
                    <Text style={styles.transactionAmount}>{formatCurrency(transaction.amount)}</Text>
                    <Text style={styles.transactionDate}>{formatDateTime(transaction.createdAt)}</Text>
                  </View>
                  {transaction.description ? <Text style={styles.transactionDescription}>{transaction.description}</Text> : null}
                </View>
              ))
            )}
          </ScrollView>
        </View>
      </View>
    </Modal>
  );
};

const styles = StyleSheet.create({
  overlay: {
    flex: 1,
    backgroundColor: palette.overlay,
    justifyContent: 'center',
    paddingHorizontal: spacing.lg,
  },
  backdrop: {
    ...StyleSheet.absoluteFillObject,
  },
  card: {
    backgroundColor: palette.surface,
    borderRadius: radius.xl,
    paddingVertical: spacing.lg,
    paddingHorizontal: spacing.lg,
    maxHeight: '85%',
  },
  header: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: spacing.lg,
  },
  colorBadge: {
    width: 36,
    height: 36,
    borderRadius: 18,
    marginRight: spacing.md,
  },
  headerContent: {
    flex: 1,
  },
  title: {
    fontSize: 18,
    fontWeight: '700',
    color: palette.text,
  },
  subtitle: {
    color: palette.textSecondary,
    fontSize: 12,
  },
  close: {
    fontSize: 22,
    color: palette.textSecondary,
  },
  statsRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    marginBottom: spacing.md,
  },
  statCard: {
    flex: 1,
    backgroundColor: palette.surfaceAlt,
    borderRadius: radius.md,
    padding: spacing.md,
    marginHorizontal: spacing.xs,
  },
  statLabel: {
    color: palette.textSecondary,
    fontSize: 12,
    marginBottom: spacing.xs,
  },
  statValue: {
    color: palette.text,
    fontSize: 16,
    fontWeight: '600',
  },
  progress: {
    marginBottom: spacing.lg,
  },
  progressTrack: {
    height: 10,
    backgroundColor: palette.surfaceAlt,
    borderRadius: radius.md,
    overflow: 'hidden',
  },
  progressFill: {
    height: '100%',
  },
  progressText: {
    textAlign: 'right',
    marginTop: spacing.xs,
    color: palette.textSecondary,
    fontSize: 12,
  },
  metaRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    marginBottom: spacing.lg,
  },
  metaItem: {
    flex: 1,
    marginHorizontal: spacing.xs,
  },
  metaLabel: {
    color: palette.textSecondary,
    fontSize: 12,
    marginBottom: spacing.xs,
  },
  metaValue: {
    color: palette.text,
    fontWeight: '600',
  },
  metaValueSecondary: {
    color: palette.textSecondary,
    fontSize: 12,
  },
  sectionTitle: {
    fontSize: 15,
    fontWeight: '600',
    color: palette.text,
    marginBottom: spacing.sm,
  },
  transactionList: {
    maxHeight: 240,
  },
  transactionContent: {
    paddingBottom: spacing.sm,
  },
  transactionItem: {
    borderWidth: 1,
    borderColor: palette.border,
    borderRadius: radius.md,
    padding: spacing.md,
    marginBottom: spacing.sm,
  },
  transactionHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    marginBottom: spacing.xs,
  },
  transactionAmount: {
    color: palette.text,
    fontWeight: '600',
  },
  transactionDate: {
    color: palette.textSecondary,
    fontSize: 12,
  },
  transactionDescription: {
    color: palette.textSecondary,
    fontSize: 12,
  },
  emptyState: {
    paddingVertical: spacing.lg,
    alignItems: 'center',
  },
  emptyText: {
    color: palette.textSecondary,
    fontSize: 13,
  },
});

export default CategoryDetailsModal;
