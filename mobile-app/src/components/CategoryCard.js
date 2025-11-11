import React from 'react';
import { View, Text, TouchableOpacity } from 'react-native';
import { styles } from '../styles';
import { formatCurrency, formatPercentage } from '../utils/formatters';

const CategoryCard = ({ category, onPress, onEdit, onDelete }) => {
  const spentPercentage = category.target > 0 ? (category.spent / category.target) * 100 : 0;
  const remaining = Math.max(0, category.target - category.spent);

  return (
    <TouchableOpacity style={styles.categoryCard} onPress={onPress} activeOpacity={0.9}>
      <View style={styles.categoryHeader}>
        <Text style={styles.categoryName}>{category.name}</Text>
        <View style={styles.categoryActions}>
          {onEdit ? (
            <TouchableOpacity style={styles.iconButton} onPress={onEdit}>
              <Text>✏️</Text>
            </TouchableOpacity>
          ) : null}
          {onDelete ? (
            <TouchableOpacity style={styles.iconButton} onPress={onDelete}>
              <Text>🗑️</Text>
            </TouchableOpacity>
          ) : null}
        </View>
      </View>

      <View style={styles.categoryBalanceRow}>
        <Text style={styles.categoryBalance}>{formatCurrency(category.spent)}</Text>
        <Text style={styles.categoryTarget}>ගෝලය {formatCurrency(category.target)}</Text>
      </View>

      <Text style={styles.categorySpent}>
        වියදම් {formatCurrency(category.spent)} / {formatCurrency(category.target)}
      </Text>

      <View style={styles.progressBar}>
        <View
          style={[
            styles.progressFill,
            spentPercentage > 100 ? styles.progressOverflow : null,
            { width: `${Math.min(spentPercentage, 100)}%` },
          ]}
        />
      </View>

      <View style={styles.categoryFooter}>
        <Text style={styles.progressText}>{formatPercentage(spentPercentage)}</Text>
        <Text style={styles.unitPrice}>ඒකක මිල {formatCurrency(category.unitPrice)}</Text>
      </View>

      <View style={styles.infoPill}>
        <Text style={styles.infoPillText}>ඉතිරි {formatCurrency(remaining)}</Text>
      </View>
    </TouchableOpacity>
  );
};

export default CategoryCard;
