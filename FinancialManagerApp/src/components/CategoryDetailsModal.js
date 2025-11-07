import React from 'react';
import {
  View,
  Text,
  TouchableOpacity,
  ScrollView,
  Modal,
} from 'react-native';
import { styles, colors } from '../styles';
import { formatCurrency, calculatePercentage } from '../utils/formatters';

const CategoryDetailsModal = ({ visible, category, transactions, onClose }) => {
  if (!category) return null;

  const percentage = calculatePercentage(category.spent, category.target);
  const remaining = Math.max(0, category.target - category.spent);
  const isOverBudget = category.spent > category.target;
  const avgTransaction = transactions.length > 0 ? category.spent / transactions.length : 0;

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

          <View style={[styles.infoBox, { backgroundColor: isOverBudget ? colors.danger : colors.light }]}>
            <Text style={{ fontWeight: 'bold', marginBottom: 8 }}>
              {isOverBudget ? '⚠️ අයවැය ඉක්මවා ඇත!' : '✅ අයවැය තුළ'}
            </Text>
            <Text>මුළු වියදම: {formatCurrency(category.spent)}</Text>
            <Text>ඉලක්කය: {formatCurrency(category.target)}</Text>
            <Text>ඉතිරි: {formatCurrency(remaining)}</Text>
            <Text>ප්‍රතිශතය: {percentage}%</Text>
          </View>

          <View style={{ marginVertical: 16 }}>
            <Text style={styles.sectionTitle}>සංඛ්‍යාලේඛන</Text>
            <View style={{ marginTop: 8 }}>
              <Text style={styles.categoryInfoText}>
                ගනුදෙනු සංඛ්‍යාව: {transactions.length}
              </Text>
              <Text style={styles.categoryInfoText}>
                සාමාන්‍ය ගනුදෙනුව: {formatCurrency(avgTransaction)}
              </Text>
              <Text style={styles.categoryInfoText}>
                එකක මිල: {formatCurrency(category.unitPrice)}
              </Text>
            </View>
          </View>

          <Text style={styles.sectionTitle}>මෑත ගනුදෙනු</Text>
          
          {transactions.length === 0 ? (
            <View style={styles.emptyState}>
              <Text style={styles.emptyStateText}>
                මෙම කාණ්ඩය සඳහා ගනුදෙනු නොමැත
              </Text>
            </View>
          ) : (
            <ScrollView style={{ maxHeight: 300, marginTop: 12 }}>
              {transactions.slice(0, 20).map(transaction => (
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
              ))}
            </ScrollView>
          )}

          <TouchableOpacity 
            style={[styles.submitButton, { marginTop: 16 }]}
            onPress={onClose}
          >
            <Text style={styles.submitButtonText}>වසන්න</Text>
          </TouchableOpacity>
        </View>
      </View>
    </Modal>
  );
};

export default CategoryDetailsModal;
