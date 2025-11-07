import React from 'react';
import {
  View,
  Text,
  TouchableOpacity,
  ScrollView,
  Modal,
} from 'react-native';
import { styles } from '../../styles';
import { formatCurrency } from '../../utils/formatters';
import TransactionItem from '../TransactionItem';

const CategoryDetailsModal = ({ visible, category, transactions, onClose }) => {
  if (!category) return null;

  const progressPercentage = category.target > 0 ? (category.spent / category.target) * 100 : 0;
  const remaining = Math.max(0, category.target - category.spent);
  const categoryTransactions = transactions.filter(t => 
    t.category && t.category.id === category.id
  );

  return (
    <Modal
      animationType="slide"
      transparent={true}
      visible={visible}
      onRequestClose={onClose}
    >
      <View style={styles.modalOverlay}>
        <View style={styles.modalContent}>
          <View style={styles.modalHeader}>
            <Text style={styles.modalTitle}>{category.name}</Text>
            <TouchableOpacity onPress={onClose}>
              <Text style={styles.closeBtn}>&times;</Text>
            </TouchableOpacity>
          </View>
          
          <ScrollView>
            <View style={styles.infoBox}>
              <Text style={{ fontWeight: 'bold', marginBottom: 8 }}>කාණ්ඩ විස්තර:</Text>
              <Text>ගෝලය: {formatCurrency(category.target)}</Text>
              <Text>වියදම්: {formatCurrency(category.spent)}</Text>
              <Text>ඉතිරි: {formatCurrency(remaining)}</Text>
              <Text>ඒකක මිල: {formatCurrency(category.unitPrice)}</Text>
              <Text style={{ marginTop: 8 }}>ප්‍රගතිය: {progressPercentage.toFixed(1)}%</Text>
            </View>
            
            <View style={styles.progressBar}>
              <View style={[
                styles.progressFill, 
                progressPercentage > 100 && styles.progressOverflow,
                { width: `${Math.min(progressPercentage, 100)}%` }
              ]} />
            </View>
            
            <Text style={[styles.sectionTitle, { marginTop: 20, marginBottom: 12 }]}>
              ගනුදෙනු ({categoryTransactions.length})
            </Text>
            
            {categoryTransactions.length === 0 ? (
              <View style={styles.emptyState}>
                <Text style={styles.emptyStateText}>මෙම කාණ්ඩය සඳහා ගනුදෙනු නොමැත</Text>
              </View>
            ) : (
              categoryTransactions.map(transaction => (
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
