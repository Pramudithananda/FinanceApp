import React from 'react';
import { View, Text, TouchableOpacity } from 'react-native';
import { styles } from '../styles';
import { formatCurrency } from '../utils/formatters';

const BalanceCard = ({ label, amount, type, onDeposit }) => {
  const cardStyle = type === 'bank' ? styles.bankCard : styles.cashCard;
  
  return (
    <View style={[styles.balanceCard, cardStyle]}>
      <Text style={styles.balanceLabel}>{label}</Text>
      <Text style={styles.balanceAmount}>{formatCurrency(amount)}</Text>
      {onDeposit && (
        <TouchableOpacity style={styles.depositButton} onPress={onDeposit}>
          <Text style={styles.depositButtonText}>+ Deposit කරන්න</Text>
        </TouchableOpacity>
      )}
    </View>
  );
};

export default BalanceCard;
