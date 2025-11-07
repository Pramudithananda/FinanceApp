import React from 'react';
import { TouchableOpacity, Text } from 'react-native';
import { styles } from '../theme/styles';

const ActionButton = ({ label, color, onPress }) => (
  <TouchableOpacity
    onPress={onPress}
    style={[styles.actionButton, { backgroundColor: color }]}
  >
    <Text style={styles.actionButtonLabel}>{label}</Text>
  </TouchableOpacity>
);

export default ActionButton;
