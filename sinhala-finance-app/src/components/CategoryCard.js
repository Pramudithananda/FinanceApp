import React from 'react';
import { View, Text, TouchableOpacity } from 'react-native';
import { styles } from '../theme/styles';
import { formatCurrency, formatPercent } from '../utils/formatters';

const CategoryCard = ({ category, onPress, onEdit, onDelete }) => {
  const progress = category.target > 0 ? (Number(category.spent || 0) / category.target) * 100 : 0;
  const remaining = Math.max(category.target - Number(category.spent || 0), 0);

  return (
    <TouchableOpacity style={styles.categoryCard} onPress={onPress} activeOpacity={0.9}>
      <View style={styles.categoryHeader}>
        <View>
          <Text style={styles.categoryName}>{category.name}</Text>
          <Text style={styles.categoryStatLabel}>
            බලාපොරොත්තු: {formatCurrency(category.target)} • ඒකක මිල {formatCurrency(category.unitPrice || 0)}
          </Text>
        </View>
        <View style={styles.categoryActions}>
          <TouchableOpacity style={styles.iconButton} onPress={onEdit}>
            <Text style={styles.iconButtonText}>✏️</Text>
          </TouchableOpacity>
          <TouchableOpacity style={styles.iconButton} onPress={onDelete}>
            <Text style={styles.iconButtonText}>🗑️</Text>
          </TouchableOpacity>
        </View>
      </View>

      <View style={styles.categoryStats}>
        <View>
          <Text style={styles.categoryStatLabel}>දැනට වියදම්</Text>
          <Text style={styles.categoryStatValue}>{formatCurrency(category.spent || 0)}</Text>
        </View>
        <View>
          <Text style={styles.categoryStatLabel}>ඉතිරි</Text>
          <Text style={[styles.categoryStatValue, styles.remainingText]}>{formatCurrency(remaining)}</Text>
        </View>
      </View>

      <View style={styles.progressBar}>
        <View
          style={[
            styles.progressFill,
            progress > 100 && styles.progressOverflow,
            { width: `${Math.min(progress, 100)}%`, backgroundColor: category.color },
          ]}
        />
      </View>
      <View style={styles.progressFooter}>
        <Text style={styles.progressText}>{formatPercent(progress)}</Text>
        <Text style={styles.progressText}>🕒 {category.lastUpdated ? 'අවසන් යාවත්කාලය' : 'නව කාණ්ඩය'}</Text>
      </View>
      <Text style={styles.clickHint}>📊 විස්තර බැලීමට තට්ටු කරන්න</Text>
    </TouchableOpacity>
  );
};

export default CategoryCard;
