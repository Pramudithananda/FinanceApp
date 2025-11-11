import React from 'react';
import { View, Text, TouchableOpacity, Modal, ScrollView } from 'react-native';
import { styles } from '../../styles';
import { formatCurrency } from '../../utils/formatters';
import TransactionItem from '../TransactionItem';

const CategoryDetailsModal = ({ visible, category, transactions, onClose }) => {
  if (!category) {
    return (
      <Modal animationType="fade" transparent visible={visible} onRequestClose={onClose}>
        <View style={styles.modalOverlay}>
          <View style={styles.modalContent}>
            <View style={styles.modalHeader}>
              <Text style={styles.modalTitle}>කාණ්ඩ විස්තර</Text>
              <TouchableOpacity onPress={onClose} accessibilityRole="button">
                <Text style={styles.closeBtn}>×</Text>
              </TouchableOpacity>
            </View>
            <View style={styles.detailsEmpty}>
              <Text style={styles.detailsEmptyText}>විස්තර ලබා ගැනීමට කාණ්ඩයක් තෝරන්න</Text>
            </View>
          </View>
        </View>
      </Modal>
    );
  }

  const remaining = Math.max(0, category.target - category.spent);
  const progressPercentage = category.target > 0 ? (category.spent / category.target) * 100 : 0;

  return (
    <Modal animationType="slide" transparent visible={visible} onRequestClose={onClose}>
      <View style={styles.modalOverlay}>
        <View style={styles.modalContent}>
          <View style={styles.modalHeader}>
            <Text style={styles.modalTitle}>කාණ්ඩ විස්තර</Text>
            <TouchableOpacity onPress={onClose} accessibilityRole="button">
              <Text style={styles.closeBtn}>×</Text>
            </TouchableOpacity>
          </View>

          <View style={styles.detailsHeader}>
            <Text style={styles.detailsTitle}>{category.name}</Text>
            <Text style={styles.detailsSubtitle}>
              {transactions.length} ගනුදෙනු | {progressPercentage.toFixed(1)}%
            </Text>
          </View>

          <View style={styles.detailsStats}>
            <View style={styles.detailsStatItem}>
              <Text style={styles.detailsStatLabel}>වියදම් එකතුව</Text>
              <Text style={styles.detailsStatValue}>{formatCurrency(category.spent)}</Text>
            </View>
            <View style={styles.detailsStatItem}>
              <Text style={styles.detailsStatLabel}>ගෝලය</Text>
              <Text style={styles.detailsStatValue}>{formatCurrency(category.target)}</Text>
            </View>
            <View style={styles.detailsStatItem}>
              <Text style={styles.detailsStatLabel}>ඉතිරි මුදල</Text>
              <Text style={styles.detailsStatValue}>{formatCurrency(remaining)}</Text>
            </View>
            <View style={styles.detailsStatItem}>
              <Text style={styles.detailsStatLabel}>ඒකක මිල</Text>
              <Text style={styles.detailsStatValue}>{formatCurrency(category.unitPrice)}</Text>
            </View>
          </View>

          <Text style={styles.detailsTransactionsTitle}>ට්‍රාන්සැක්ෂන්</Text>
          {transactions.length === 0 ? (
            <View style={styles.detailsEmpty}>
              <Text style={styles.detailsEmptyText}>මෙම කාණ්ඩයට ගනුදෙනු නොමැත</Text>
            </View>
          ) : (
            <ScrollView>
              {transactions.map((transaction) => (
                <TransactionItem key={transaction.id} transaction={transaction} />
              ))}
            </ScrollView>
          )}
        </View>
      </View>
    </Modal>
  );
};

export default CategoryDetailsModal;
