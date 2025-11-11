import React from 'react';
import { View, Text, TouchableOpacity, Modal, ScrollView } from 'react-native';
import { styles } from '../../styles';
import { formatCurrency, formatPercentage } from '../../utils/formatters';

const CategoryDetailsModal = ({ visible, category, transactions, onClose }) => {
  if (!category) {
    return null;
  }

  const progress = category.target > 0 ? (category.spent / category.target) * 100 : 0;
  const remaining = Math.max(0, category.target - category.spent);

  return (
    <Modal visible={visible} transparent animationType="slide" onRequestClose={onClose}>
      <View style={styles.modalOverlay}>
        <View style={styles.modalContent}>
          <View style={styles.modalHeader}>
            <Text style={styles.modalTitle}>{category.name}</Text>
            <TouchableOpacity onPress={onClose}>
              <Text style={styles.closeBtn}>×</Text>
            </TouchableOpacity>
          </View>

          <View style={styles.detailsRow}>
            <Text style={styles.detailsLabel}>ගෝලය</Text>
            <Text style={styles.detailsValue}>{formatCurrency(category.target)}</Text>
          </View>
          <View style={styles.detailsRow}>
            <Text style={styles.detailsLabel}>වියදම්</Text>
            <Text style={[styles.detailsValue, styles.detailsHighlight]}>
              {formatCurrency(category.spent)}
            </Text>
          </View>
          <View style={styles.detailsRow}>
            <Text style={styles.detailsLabel}>ඉතිරි</Text>
            <Text style={styles.detailsValue}>{formatCurrency(remaining)}</Text>
          </View>
          <View style={styles.detailsRow}>
            <Text style={styles.detailsLabel}>පරිශීලනය</Text>
            <Text style={styles.detailsValue}>{formatPercentage(progress)}</Text>
          </View>

          <View style={styles.divider} />

          <Text style={styles.detailsListHeader}>ගනුදෙනු</Text>

          {transactions.length === 0 ? (
            <View style={styles.emptyState}>
              <Text style={styles.emptyStateText}>මෙම කාණ්ඩයට ගනුදෙනු නොමැත.</Text>
            </View>
          ) : (
            <ScrollView style={{ maxHeight: 280 }}>
              {transactions.map((tx) => (
                <View key={tx.id} style={styles.listItem}>
                  <View>
                    <Text style={styles.listItemText}>
                      {tx.description || 'වියදම'}
                    </Text>
                    <Text style={styles.listItemMeta}>{tx.date}</Text>
                  </View>
                  <Text style={[styles.listItemText, styles.detailsHighlight]}>
                    -{formatCurrency(tx.amount)}
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
