import React from 'react';
import { View, Text, Modal, TouchableOpacity, ScrollView } from 'react-native';
import { styles } from '../../styles';
import { formatCurrency } from '../../utils/formatters';

const CategoryDetailsModal = ({ visible, category, transactions, onClose }) => {
  if (!category) {
    return null;
  }

  const remaining = Math.max(0, (category.target || 0) - (category.spent || 0));

  return (
    <Modal transparent animationType="slide" visible={visible} onRequestClose={onClose}>
      <View style={styles.modalOverlay}>
        <View style={styles.modalContent}>
          <View style={styles.modalHeader}>
            <Text style={styles.modalTitle}>{category.name}</Text>
            <TouchableOpacity onPress={onClose}>
              <Text style={styles.closeBtn}>×</Text>
            </TouchableOpacity>
          </View>

          <View style={styles.detailCard}>
            <View style={styles.detailRow}>
              <Text style={styles.detailLabel}>🎯 ඉලක්කය</Text>
              <Text style={styles.detailValue}>{formatCurrency(category.target || 0)}</Text>
            </View>
            <View style={styles.detailRow}>
              <Text style={styles.detailLabel}>💸 වියදම්</Text>
              <Text style={styles.detailValue}>{formatCurrency(category.spent || 0)}</Text>
            </View>
            <View style={styles.detailRow}>
              <Text style={styles.detailLabel}>📦 ඒකක මිල</Text>
              <Text style={styles.detailValue}>{formatCurrency(category.unitPrice || 0)}</Text>
            </View>
            <View style={styles.detailRow}>
              <Text style={styles.detailLabel}>✅ ඉතිරි</Text>
              <Text style={styles.detailValue}>{formatCurrency(remaining)}</Text>
            </View>
          </View>          </View>

          <Text style={styles.transactionsTitle}>මෙම කාණ්ඩයට අදාළ ගනුදෙනු</Text>

          {transactions.length === 0 ? (
            <Text style={styles.noTransactions}>ගනුදෙනු නොමැත</Text>
          ) : (
            <ScrollView style={styles.transactionList}>
              {transactions.map((transaction) => (
                <View key={transaction.id} style={styles.transactionItem}>
                  <View style={styles.transactionDetails}>
                    <Text style={styles.transactionDescription}>
                      {transaction.description || category.name}
                    </Text>
                    <Text style={styles.transactionDate}>{transaction.date}</Text>
                  </View>
                  <Text style={[styles.transactionAmount, styles.expenseAmount]}>
                    -
                    {formatCurrency(transaction.amount)}
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
