import React from 'react';
import {
  View,
  Text,
  ScrollView,
  TouchableOpacity,
  Modal,
} from 'react-native';
import { styles } from '../../styles';
import { formatCurrency } from '../../utils/formatters';
import TransactionItem from '../TransactionItem';

const CategoryDetailsModal = ({ visible, category, transactions, onClose }) => {
  if (!category) return null;

  const progressPercentage = category.target > 0 ? (category.spent / category.target) * 100 : 0;
  const remaining = Math.max(0, category.target - category.spent);
  const totalSpent = category.spent;
  const transactionCount = transactions.length;

  return (
    <Modal
      animationType="slide"
      transparent={true}
      visible={visible}
      onRequestClose={onClose}
    >
      <View style={styles.modalOverlay}>
        <View style={[styles.modalContent, { maxHeight: '90%' }]}>
          <View style={styles.modalHeader}>
            <Text style={styles.modalTitle}>{category.name}</Text>
            <TouchableOpacity onPress={onClose}>
              <Text style={styles.closeBtn}>&times;</Text>
            </TouchableOpacity>
          </View>

          <ScrollView>
            <View style={styles.infoBox}>
              <Text style={{ fontSize: 16, fontWeight: 'bold', marginBottom: 8 }}>
                ????? ??????
              </Text>
              <Text>????: {formatCurrency(category.target)}</Text>
              <Text>??????: {formatCurrency(totalSpent)}</Text>
              <Text>?????: {formatCurrency(remaining)}</Text>
              <Text>????????: {progressPercentage.toFixed(1)}%</Text>
              <Text>???????: {transactionCount}</Text>
              <Text>??? ???: {formatCurrency(category.unitPrice)}</Text>
            </View>

            <View style={styles.progressBar}>
              <View style={[
                styles.progressFill,
                progressPercentage > 100 && styles.progressOverflow,
                { width: `${Math.min(progressPercentage, 100)}%` }
              ]} />
            </View>

            <Text style={[styles.sectionTitle, { marginTop: 20, marginBottom: 10 }]}>
              ??????? ({transactionCount})
            </Text>

            {transactions.length === 0 ? (
              <View style={styles.emptyState}>
                <Text style={styles.emptyStateText}>
                  ??? ??????? ??????? ?????
                </Text>
              </View>
            ) : (
              transactions.map(transaction => (
                <TransactionItem
                  key={transaction.id}
                  transaction={transaction}
                />
              ))
            )}
          </ScrollView>
        </View>
      </View>
    </Modal>
  );
};

export default CategoryDetailsModal;
