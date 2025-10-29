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

  const progress = category.target > 0 ? (category.spent / category.target) * 100 : 0;
  const remaining = Math.max(0, category.target - category.spent);

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
          
          <ScrollView style={styles.detailsScrollView}>
            <View style={styles.categoryStatsContainer}>
              <View style={styles.statRow}>
                <Text style={styles.statLabel}>වියදම් කළ මුදල:</Text>
                <Text style={styles.statValue}>{formatCurrency(category.spent)}</Text>
              </View>
              <View style={styles.statRow}>
                <Text style={styles.statLabel}>ඉලක්කය:</Text>
                <Text style={styles.statValue}>{formatCurrency(category.target)}</Text>
              </View>
              <View style={styles.statRow}>
                <Text style={styles.statLabel}>ඉතිරි:</Text>
                <Text style={styles.statValue}>{formatCurrency(remaining)}</Text>
              </View>
              <View style={styles.statRow}>
                <Text style={styles.statLabel}>ඒකක මිල:</Text>
                <Text style={styles.statValue}>{formatCurrency(category.unitPrice)}</Text>
              </View>
            </View>
            
            <View style={styles.progressContainer}>
              <Text style={styles.progressLabel}>ප්‍රගතිය</Text>
              <View style={styles.progressBar}>
                <View style={[
                  styles.progressFill, 
                  { width: `${Math.min(progress, 100)}%` }
                ]} />
              </View>
              <Text style={styles.progressText}>{progress.toFixed(1)}%</Text>
            </View>
            
            <View style={styles.transactionsSection}>
              <Text style={styles.sectionTitle}>ගනුදෙනු</Text>
              {transactions.length === 0 ? (
                <Text style={styles.emptyStateText}>මෙම කාණ්ඩයට ගනුදෙනු නොමැත</Text>
              ) : (
                transactions.map(transaction => (
                  <View key={transaction.id} style={styles.transactionItem}>
                    <View style={styles.transactionDetails}>
                      <Text style={styles.transactionDescription}>
                        {transaction.description || 'වියදම'}
                      </Text>
                      <Text style={styles.transactionDate}>{transaction.date}</Text>
                    </View>
                    <Text style={styles.expenseAmount}>
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