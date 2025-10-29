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

interface Category {
  id: number;
  name: string;
  balance: number;
  target: number;
  spent: number;
  unitPrice: number;
}

interface Transaction {
  id: number;
  type: string;
  amount: number;
  category?: {
    id: number;
    name: string;
  };
  description?: string;
  date: string;
  timestamp: number;
}

interface CategoryDetailsModalProps {
  visible: boolean;
  category?: Category;
  transactions: Transaction[];
  onClose: () => void;
}

const CategoryDetailsModal: React.FC<CategoryDetailsModalProps> = ({ 
  visible, 
  category, 
  transactions, 
  onClose 
}) => {
  if (!category) return null;

  const progressPercentage = category.target > 0 ? (category.spent / category.target) * 100 : 0;
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
          
          <View style={styles.categoryCard}>
            <View style={styles.categoryBalanceRow}>
              <Text style={styles.categoryBalance}>{formatCurrency(category.balance)}</Text>
              <Text style={styles.categoryTarget}>ගෝලය: {formatCurrency(category.target)}</Text>
            </View>
            
            <Text style={styles.categorySpent}>
              වියදම්: {formatCurrency(category.spent)} / {formatCurrency(category.target)}
            </Text>
            
            <View style={styles.progressBar}>
              <View style={[
                styles.progressFill, 
                progressPercentage > 100 && styles.progressOverflow,
                { width: `${Math.min(progressPercentage, 100)}%` }
              ]} />
            </View>
            
            <View style={styles.categoryFooter}>
              <Text style={styles.progressText}>{progressPercentage.toFixed(1)}%</Text>
              <Text style={styles.unitPrice}>ඒකක මිල: {formatCurrency(category.unitPrice)}</Text>
            </View>
            
            <Text style={styles.remainingText}>
              ඉතිරි: {formatCurrency(remaining)}
            </Text>
          </View>
          
          <Text style={styles.sectionTitle}>ගනුදෙනු ඉතිහාසය</Text>
          
          <ScrollView style={{ maxHeight: 300 }}>
            {transactions.length === 0 ? (
              <View style={styles.emptyState}>
                <Text style={styles.emptyStateText}>මෙම කාණ්ඩයට ගනුදෙනු නොමැත</Text>
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