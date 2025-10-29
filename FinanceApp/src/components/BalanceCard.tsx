import React from 'react';
import { View, Text, TouchableOpacity } from 'react-native';
import { styles } from '../styles';
import { formatCurrency } from '../utils/formatters';

interface BalanceCardProps {
  label: string;
  amount: number;
  type: 'bank' | 'cash';
  onDeposit?: () => void;
}

const BalanceCard: React.FC<BalanceCardProps> = ({ label, amount, type, onDeposit }) => {
  const cardStyle = amount < 0 ? styles.negativeCard : 
                   type === 'bank' ? styles.bankCard : styles.cashCard;

  return (
    <View style={[styles.balanceCard, cardStyle]}>
      {onDeposit && (
        <TouchableOpacity style={styles.depositBtn} onPress={onDeposit}>
          <Text style={styles.depositBtnText}>+</Text>
        </TouchableOpacity>
      )}
      <Text style={styles.balanceLabel}>{label}</Text>
      <Text style={styles.balanceAmount}>{formatCurrency(amount)}</Text>
    </View>
  );
};

export default BalanceCard;