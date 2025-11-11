import React from 'react';
import { View, Text, StyleSheet, TouchableOpacity } from 'react-native';
import Icon from 'react-native-vector-icons/MaterialCommunityIcons';

const AccountCard = ({ account, onPress, colorScheme }) => {
  const formatCurrency = (amount) => {
    return `රු ${amount.toLocaleString('en-US')}`;
  };

  const getBackgroundColor = () => {
    switch (colorScheme) {
      case 'primary':
        return '#4F46E5';
      case 'secondary':
        return '#10B981';
      case 'tertiary':
        return '#F97316';
      case 'cash':
        return '#9333EA';
      default:
        return '#6B7280';
    }
  };

  return (
    <TouchableOpacity 
      style={[styles.card, { backgroundColor: getBackgroundColor() }]}
      onPress={onPress}
      activeOpacity={0.8}
    >
      <View style={styles.header}>
        <View>
          <Text style={styles.name}>{account.name}</Text>
          {account.number && (
            <Text style={styles.number}>{account.number}</Text>
          )}
        </View>
        {colorScheme === 'primary' && (
          <View style={styles.badge}>
            <View style={styles.badgeInner} />
          </View>
        )}
      </View>
      <Text style={styles.balance}>{formatCurrency(account.balance)}</Text>
    </TouchableOpacity>
  );
};

const styles = StyleSheet.create({
  card: {
    borderRadius: 16,
    padding: 16,
    marginBottom: 12,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
    elevation: 3,
  },
  header: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'flex-start',
    marginBottom: 8,
  },
  name: {
    fontSize: 18,
    fontWeight: '600',
    color: '#fff',
    marginBottom: 4,
  },
  number: {
    fontSize: 12,
    color: 'rgba(255, 255, 255, 0.8)',
  },
  balance: {
    fontSize: 24,
    fontWeight: 'bold',
    color: '#fff',
  },
  badge: {
    backgroundColor: 'rgba(255, 255, 255, 0.3)',
    borderRadius: 12,
    padding: 4,
  },
  badgeInner: {
    width: 16,
    height: 16,
    backgroundColor: '#fff',
    borderRadius: 8,
  },
});

export default AccountCard;
