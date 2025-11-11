import React from 'react';
import { TouchableOpacity, Text } from 'react-native';
import { styles } from '../styles';

const ActionButton = ({ text, color, onPress }) => (
  <TouchableOpacity
    style={[styles.actionButton, { backgroundColor: color }]}
    activeOpacity={0.85}
    onPress={onPress}
  >
    <Text style={styles.actionButtonText}>{text}</Text>
  </TouchableOpacity>
);

export default ActionButton;
