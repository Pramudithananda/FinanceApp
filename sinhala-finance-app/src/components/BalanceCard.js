import React from 'react';
import { View, Text, TouchableOpacity } from 'react-native';
import { LinearGradient } from 'expo-linear-gradient';
import { styles } from '../theme/styles';
import { gradients } from '../theme/colors';
import { formatCurrency } from '../utils/formatters';

const BalanceCard = ({
  label,
  amount,
  variant = 'bank',
  description,
  actionLabel,
  onActionPress,
}) => {
  const gradient = variant === 'cash' ? gradients.cash : gradients.bank;
  const isNegative = Number(amount) < 0;

  return (
    <LinearGradient colors={gradient} style={styles.balanceCard}>
      <View style={styles.balanceCardContent}>
        <View>
          <Text style={styles.balanceLabel}>{label}</Text>
          <Text style={styles.balanceAmount}>{formatCurrency(amount)}</Text>
          {description ? <Text style={styles.balanceSubtext}>{description}</Text> : null}
          {isNegative ? (
            <Text style={[styles.balanceSubtext, { color: '#FEE2E2', marginTop: 8 }]}>
              ⚠️ ශේෂය ඍණයි - නැවත සකස් කිරීමට කාර්යයක් සැලසුම් කරන්න
            </Text>
          ) : null}
        </View>
        {actionLabel && onActionPress ? (
          <TouchableOpacity style={styles.balanceAction} onPress={onActionPress}>
            <Text style={styles.balanceActionText}>{actionLabel}</Text>
          </TouchableOpacity>
        ) : null}
      </View>
    </LinearGradient>
  );
};

export default BalanceCard;
