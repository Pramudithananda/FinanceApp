import React from 'react';
import { View, Text, TouchableOpacity } from 'react-native';
import { styles } from '../styles';
import { formatCurrency } from '../utils/formatters';

const CategoryCard = ({ category, onPress, onEdit, onDelete }) => {
  const progressPercentage = category.target > 0 ? (category.spent / category.target) * 100 : 0;
  const remaining = Math.max(0, category.target - category.spent);

  return (
    <TouchableOpacity style={styles.categoryCard} onPress={onPress}>
      <View style={styles.clickHint}>
        <Text style={styles.clickHintText}>CLICK</Text>
      </View>
      
      <View style={styles.categoryHeader}>
        <Text style={styles.categoryName}>{category.name}</Text>
        <View style={styles.categoryActions}>
          <TouchableOpacity onPress={onEdit} style={styles.editBtn}>
            <Text>✏️</Text>
          </TouchableOpacity>
          <TouchableOpacity onPress={onDelete} style={styles.deleteBtn}>
            <Text>🗑️</Text>
          </TouchableOpacity>
        </View>
      </View>
      
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
      
      <Text style={styles.clickHintBottom}>
        📊 විස්තර බැලීමට click කරන්න
      </Text>
    </TouchableOpacity>
  );
};

export default CategoryCard;
