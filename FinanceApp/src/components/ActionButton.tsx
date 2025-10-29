import React from 'react';
import { TouchableOpacity, Text } from 'react-native';
import { styles } from '../styles';

interface ActionButtonProps {
  text: string;
  color: string;
  onPress: () => void;
}

const ActionButton: React.FC<ActionButtonProps> = ({ text, color, onPress }) => {
  return (
    <TouchableOpacity 
      style={[styles.actionButton, { backgroundColor: color }]}
      onPress={onPress}
    >
      <Text style={styles.actionButtonText}>{text}</Text>
    </TouchableOpacity>
  );
};

export default ActionButton;