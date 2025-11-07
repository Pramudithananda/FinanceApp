import React from 'react';
import { Modal, View, Text, TouchableOpacity, ScrollView } from 'react-native';
import { styles } from '../../theme/styles';
import { formatCurrency, formatPercent, formatDateTime } from '../../utils/formatters';

const CategoryDetailsModal = ({ visible, category, transactions, onClose }) => {
  if (!category) {
    return null;
  }

  const progress = category.target > 0 ? (Number(category.spent || 0) / category.target) * 100 : 0;
  const remaining = Math.max(category.target - Number(category.spent || 0), 0);

  return (
    <Modal visible={visible} transparent animationType="fade" onRequestClose={onClose}>
      <View style={styles.modalOverlay}>
        <View style={[styles.modalCard, { maxHeight: '85%' }]}>
          <View style={styles.modalHeader}>
            <Text style={styles.modalTitle}>📊 {category.name}</Text>
            <TouchableOpacity style={styles.modalClose} onPress={onClose}>
              <Text style={styles.modalCloseText}>✖️</Text>
            </TouchableOpacity>
          </View>
          <Text style={styles.modalSubtitle}>
            කාණ්ඩයේ මාසික ඉලක්කය සහ වියදම් ප්‍රගතිය පහසුවෙන් නිරීක්ෂණය කරන්න.
          </Text>

          <View style={styles.detailsBadgeRow}>
            <View style={styles.pill}>
              <Text style={styles.pillText}>🎯 ඉලක්කය: {formatCurrency(category.target)}</Text>
            </View>
            <View style={styles.pill}>
              <Text style={styles.pillText}>💸 වියදම්: {formatCurrency(category.spent || 0)}</Text>
            </View>
            <View style={styles.pill}>
              <Text style={styles.pillText}>♻️ ඉතිරි: {formatCurrency(remaining)}</Text>
            </View>
          </View>

          <View style={styles.progressBar}>
            <View
              style={[
                styles.progressFill,
                progress > 100 && styles.progressOverflow,
                { width: `${Math.min(progress, 100)}%`, backgroundColor: category.color },
              ]}
            />
          </View>
          <View style={styles.progressFooter}>
            <Text style={styles.progressText}>{formatPercent(progress)}</Text>
            <Text style={styles.progressText}>
              🕒 {category.lastUpdated ? formatDateTime(category.lastUpdated) : 'අලුත් කාණ්ඩයක්'}
            </Text>
          </View>

          <View style={styles.divider} />

          <Text style={[styles.detailBlockTitle, { marginBottom: 12 }]}>මෑත ගනුදෙනු</Text>
          {transactions.length === 0 ? (
            <View style={styles.emptyState}>
              <Text style={styles.emptyTitle}>ගනුදෙනු නොමැත</Text>
              <Text style={styles.emptyDescription}>
                මෙම කාණ්ඩයෙන් වියදම් සටහන් වුයේ නැත. Transaction modal එකෙන් එකතු කරන්න.
              </Text>
            </View>
          ) : (
            <ScrollView style={{ maxHeight: 280 }}>
              {transactions.map((transaction) => (
                <View key={transaction.id} style={styles.detailBlock}>
                  <Text style={styles.detailBlockTitle}>
                    {transaction.description || 'වියදම්'}
                  </Text>
                  <Text style={styles.transactionMeta}>{formatDateTime(transaction.createdAt)}</Text>
                  <Text style={[styles.transactionAmount, styles.amountExpense, { marginTop: 8 }]}>
                    -{formatCurrency(transaction.amount)}
                  </Text>
                </View>
              ))}
            </ScrollView>
          )}
        </View>
      </View>
    </Modal>
  );
};

export default CategoryDetailsModal;
