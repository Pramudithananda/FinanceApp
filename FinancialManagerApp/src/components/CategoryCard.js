import React from 'react';
import { View, Text, TouchableOpacity } from 'react-native';
import { styles, colors } from '../styles';
import { formatCurrency, calculatePercentage } from '../utils/formatters';

const CategoryCard = ({ category, onPress, onEdit, onDelete }) => {
  const percentage = calculatePercentage(category.spent, category.target);
  const remaining = Math.max(0, category.target - category.spent);
  const isOverBudget = category.spent > category.target;
  
  const borderColor = isOverBudget ? colors.danger : 
                      percentage > 80 ? colors.warning : colors.success;

  return (
    <TouchableOpacity
      style={[styles.categoryCard, { borderLeftColor: borderColor }]}
      onPress={onPress}
      activeOpacity={0.7}
    >
      <View style={styles.categoryHeader}>
        <Text style={styles.categoryName}>{category.name}</Text>
        <View style={styles.categoryActions}>
          <TouchableOpacity
            style={styles.categoryActionButton}
            onPress={(e) => {
              e.stopPropagation();
              onEdit();
            }}
          >
            <Text style={styles.categoryActionText}>✏️</Text>
          </TouchableOpacity>
          <TouchableOpacity
            style={styles.categoryActionButton}
            onPress={(e) => {
              e.stopPropagation();
              onDelete();
            }}
          >
            <Text style={styles.categoryActionText}>🗑️</Text>
          </TouchableOpacity>
        </View>
      </View>
      
      <View style={styles.progressBar}>
        <View
          style={[
            styles.progressFill,
            { 
              width: `${Math.min(percentage, 100)}%`,
              backgroundColor: borderColor
            }
          ]}
        />
      </View>
      
      <View style={styles.categoryInfo}>
        <Text style={styles.categoryInfoText}>
          වියදම්: {formatCurrency(category.spent)}
        </Text>
        <Text style={styles.categoryInfoText}>
          ඉතිරි: {formatCurrency(remaining)}
        </Text>
        <Text style={styles.categoryInfoText}>
          ඉලක්කය: {formatCurrency(category.target)}
        </Text>
      </View>
    </TouchableOpacity>
  );
};

export default CategoryCard;
