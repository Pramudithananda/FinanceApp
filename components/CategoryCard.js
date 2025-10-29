import React from 'react';
import { View, Text, TouchableOpacity } from 'react-native';
import { styles } from '../styles';
import { formatCurrency } from '../utils/formatters';

const CategoryCard = ({ category, onPress, onEdit, onDelete }) => {
  const progress = category.target > 0 ? (category.spent / category.target) * 100 : 0;
  
  return (
    <TouchableOpacity style={styles.categoryCard} onPress={onPress}>
      <View style={styles.categoryHeader}>
        <Text style={styles.categoryName}>{category.name}</Text>
        <View style={styles.categoryActions}>
          <TouchableOpacity onPress={onEdit} style={styles.actionIcon}>
            <Text>✏️</Text>
          </TouchableOpacity>
          <TouchableOpacity onPress={onDelete} style={styles.actionIcon}>
            <Text>🗑️</Text>
          </TouchableOpacity>
        </View>
      </View>
      
      <View style={styles.categoryStats}>
        <View style={styles.statItem}>
          <Text style={styles.statLabel}>වියදම් කළ</Text>
          <Text style={styles.statValue}>{formatCurrency(category.spent)}</Text>
        </View>
        <View style={styles.statItem}>
          <Text style={styles.statLabel}>ඉලක්කය</Text>
          <Text style={styles.statValue}>{formatCurrency(category.target)}</Text>
        </View>
        <View style={styles.statItem}>
          <Text style={styles.statLabel}>ඒකක මිල</Text>
          <Text style={styles.statValue}>{formatCurrency(category.unitPrice)}</Text>
        </View>
      </View>
      
      <View style={styles.progressContainer}>
        <View style={styles.progressBar}>
          <View style={[styles.progressFill, { width: `${Math.min(progress, 100)}%` }]} />
        </View>
        <Text style={styles.progressText}>{progress.toFixed(1)}%</Text>
      </View>
    </TouchableOpacity>
  );
};

export default CategoryCard;