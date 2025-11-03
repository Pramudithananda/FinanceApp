import React from 'react';
import { View, Text, TouchableOpacity } from 'react-native';
import { styles } from '../styles';
import { formatCurrency } from '../utils/formatters';

const CategoryCard = ({ category, onPress, onEdit, onDelete }) => {
  const progressPercentage = category.target
    ? Math.min((category.spent / category.target) * 100, 200)
    : 0;
  const remaining = Math.max(0, (category.target || 0) - (category.spent || 0));

  return (
    <TouchableOpacity style={styles.categoryCard} onPress={onPress} activeOpacity={0.8}>
      <View style={styles.categoryTapBadge}>
        <Text style={styles.categoryTapBadgeText}>TAP</Text>
      </View>

      <View style={styles.categoryHeader}>
        <Text style={styles.categoryName}>{category.name}</Text>
        <View style={styles.categoryActions}>
          <TouchableOpacity onPress={onEdit} style={styles.categoryActionButton}>
            <Text>✏️</Text>
          </TouchableOpacity>
          <TouchableOpacity onPress={onDelete} style={styles.categoryActionButton}>
            <Text>🗑️</Text>
          </TouchableOpacity>
        </View>
      </View>

      <View style={styles.categoryBalanceRow}>
        <Text style={styles.categoryBalance}>{formatCurrency(category.balance)}</Text>
        <Text style={styles.categoryTarget}>
          🎯 {formatCurrency(category.target || 0)}
        </Text>
      </View>

      <Text style={styles.categorySpent}>
        වියදම්: {formatCurrency(category.spent || 0)} / {formatCurrency(category.target || 0)}
      </Text>

      <View style={styles.progressBar}>
        <View
          style={[
            styles.progressFill,
            progressPercentage > 100 && styles.progressOverflow,
            { width: `${Math.min(progressPercentage, 100)}%` },
          ]}
        />
      </View>

      <View style={styles.categoryFooter}>
        <Text style={styles.progressText}>{progressPercentage.toFixed(1)}%</Text>
        <Text style={styles.unitPrice}>
          ඒකක මිල: {formatCurrency(category.unitPrice || 0)}
        </Text>
      </View>

      <Text style={styles.remainingText}>ඉතිරි: {formatCurrency(remaining)}</Text>
      <Text style={styles.categoryHint}>📊 විස්තර බැලීමට tap කරන්න</Text>
    </TouchableOpacity>
  );
};

export default CategoryCard;
