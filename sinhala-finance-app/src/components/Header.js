import React from 'react';
import { View, Text, TouchableOpacity } from 'react-native';
import { styles } from '../theme/styles';
import { formatCurrency } from '../utils/formatters';

const Header = ({ summary, onReset }) => (
  <View style={styles.header}>
    <View style={styles.headerRow}>
      <View style={styles.headerInfo}>
        <Text style={styles.headerTitle}>මුදල් කළමනාකරණය</Text>
        <Text style={styles.headerSubtitle}>
          ඔබගේ දෛනික ගනුදෙනු, කාණ්ඩ කාර්යය සහ ඉතිරිය පහසුවෙන් පාලනය කරන්න.
        </Text>
      </View>
      <TouchableOpacity onPress={onReset} style={styles.headerBadge}>
        <Text style={styles.headerBadgeText}>Reset</Text>
      </TouchableOpacity>
    </View>

    <View style={styles.chipRow}>
      <View style={[styles.chip, styles.chipActive]}>
        <Text style={[styles.chipText, styles.chipTextActive]}>
          🎯 {formatCurrency(summary.totalTarget)} - කාර්යය
        </Text>
      </View>
      <View style={styles.chip}>
        <Text style={styles.chipText}>💸 {formatCurrency(summary.totalSpent)} - වියදම්</Text>
      </View>
      <View style={styles.chip}>
        <Text style={styles.chipText}>♻️ {formatCurrency(summary.remaining)} - ඉතිරි</Text>
      </View>
    </View>
  </View>
);

export default Header;
