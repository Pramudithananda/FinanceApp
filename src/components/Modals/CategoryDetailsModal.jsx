import React from 'react';
import {
  View,
  Text,
  TouchableOpacity,
  Modal,
  ScrollView,
} from 'react-native';
import { styles } from '../../styles';
import { formatCurrency } from '../../utils/formatters';
import TransactionItem from '../TransactionItem';

const CategoryDetailsModal = ({ visible, category, transactions = [], onClose }) => {
  const safeCategory = category || {
    name: '',
    target: 0,
    spent: 0,
    balance: 0,
    unitPrice: 0,
  };

  const remaining = Math.max(0, safeCategory.target - safeCategory.spent);

  return (
    <Modal animationType="slide" transparent visible={visible} onRequestClose={onClose}>
      <View style={styles.modalOverlay}>
        <View style={styles.modalContent}>
          <View style={styles.modalHeader}>
            <Text style={styles.modalTitle}>{safeCategory.name || '????? ??????'}</Text>
            <TouchableOpacity onPress={onClose}>
              <Text style={styles.closeBtn}>&times;</Text>
            </TouchableOpacity>
          </View>

          <View style={styles.detailsSection}>
            <View style={styles.detailsRow}>
              <Text style={styles.detailsLabel}>????? ????</Text>
              <Text style={styles.detailsValue}>{formatCurrency(safeCategory.target)}</Text>
            </View>
            <View style={styles.detailsRow}>
              <Text style={styles.detailsLabel}>??????</Text>
              <Text style={styles.detailsValue}>{formatCurrency(safeCategory.spent)}</Text>
            </View>
            <View style={styles.detailsRow}>
              <Text style={styles.detailsLabel}>?????</Text>
              <Text style={styles.detailsValue}>{formatCurrency(remaining)}</Text>
            </View>
            <View style={styles.detailsRow}>
              <Text style={styles.detailsLabel}>??? ???</Text>
              <Text style={styles.detailsValue}>{formatCurrency(safeCategory.unitPrice)}</Text>
            </View>
          </View>

          <Text style={[styles.sectionTitle, { marginBottom: 12 }]}>?? ??????? ???????</Text>

          <ScrollView style={styles.detailsTransactions}>
            {transactions.length === 0 ? (
              <View style={styles.detailsEmptyState}>
                <Text style={styles.detailsEmptyText}>??? ??????? ???? ??????? ?????</Text>
              </View>
            ) : (
              transactions.map((transaction) => (
                <TransactionItem key={transaction.id} transaction={transaction} />
              ))
            )}
          </ScrollView>
        </View>
      </View>
    </Modal>
  );
};

export default CategoryDetailsModal;
