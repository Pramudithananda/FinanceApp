import React from 'react';
import { View, Text, TouchableOpacity } from 'react-native';
import { styles } from '../styles';
import { formatCurrency } from '../utils/formatters';

const BalanceCard = ({ label, amount, type, onActionPress }) => {
  const actionLabel =
    type === 'bank' ? '⬆️ තැන්පත් කරන්න' : type === 'cash' ? '⬇️ මුදල් ලබාගන්න' : null;

  return (
    <View
      style={[
        styles.balanceCard,
        type === 'bank' ? styles.balanceCardBank : styles.balanceCardCash,
      ]}
    >
      <Text style={styles.balanceLabel}>{label}</Text>
      <Text style={styles.balanceAmount}>{formatCurrency(amount)}</Text>
      {actionLabel && onActionPress ? (
        <TouchableOpacity style={styles.balanceBadge} onPress={onActionPress}>
          <Text style={styles.balanceBadgeText}>{actionLabel}</Text>
        </TouchableOpacity>
      ) : null}
    </View>
  );
};

export default BalanceCard;
