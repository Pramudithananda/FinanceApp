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

const CategoryDetailsModal = ({ 
  visible, 
  category, 
  transactions, 
  onClose 
}) => {
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
          
          <ScrollView style={{ maxHeight: 400 }}>
            <View style={styles.categoryDetailsSection}>
              <Text style={styles.sectionTitle}>කාණ්ඩ විස්තර</Text>
              
              <View style={styles.detailRow}>
                <Text style={styles.detailLabel}>ගෝලය:</Text>
                <Text style={styles.detailValue}>{formatCurrency(category.target)}</Text>
              </View>
              
              <View style={styles.detailRow}>
                <Text style={styles.detailLabel}>වියදම් කළ:</Text>
                <Text style={styles.detailValue}>{formatCurrency(category.spent)}</Text>
              </View>
              
              <View style={styles.detailRow}>
                <Text style={styles.detailLabel}>ඉතිරි:</Text>
                <Text style={[styles.detailValue, { color: remaining > 0 ? '#10b981' : '#ef4444' }]}>
                  {formatCurrency(remaining)}
                </Text>
              </View>
              
              <View style={styles.detailRow}>
                <Text style={styles.detailLabel}>ප්‍රගතිය:</Text>
                <Text style={styles.detailValue}>{progressPercentage.toFixed(1)}%</Text>
              </View>
              
              <View style={styles.detailRow}>
                <Text style={styles.detailLabel}>ඒකක මිල:</Text>
                <Text style={styles.detailValue}>{formatCurrency(category.unitPrice)}</Text>
              </View>
            </View>
            
            <View style={styles.progressBar}>
              <View style={[
                styles.progressFill, 
                progressPercentage > 100 && styles.progressOverflow,
                { width: `${Math.min(progressPercentage, 100)}%` }
              ]} />
            </View>
            
            <View style={styles.categoryDetailsSection}>
              <Text style={styles.sectionTitle}>
                ගනුදෙනු ({categoryTransactions.length})
              </Text>
              
              {categoryTransactions.length === 0 ? (
                <Text style={styles.emptyStateText}>මෙම කාණ්ඩයට ගනුදෙනු නොමැත</Text>
              ) : (
                categoryTransactions.map(transaction => (
                  <View key={transaction.id} style={styles.transactionItem}>
                    <View style={styles.transactionDetails}>
                      <Text style={styles.transactionDescription}>
                        {transaction.description || 'වියදම'}
                      </Text>
                      <Text style={styles.transactionDate}>{transaction.date}</Text>
                    </View>
                    <Text style={[styles.transactionAmount, styles.expenseAmount]}>
                      -{formatCurrency(transaction.amount)}
                    </Text>
                  </View>
                ))
              )}
            </View>
          </ScrollView>
        </View>
      </View>
    </Modal>
  );
};

export default CategoryDetailsModal;