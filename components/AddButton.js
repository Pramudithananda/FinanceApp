import React from 'react';
import { TouchableOpacity, StyleSheet } from 'react-native';
import Icon from 'react-native-vector-icons/MaterialCommunityIcons';

const AddButton = ({ onPress, size = 40, iconSize = 20 }) => {
  return (
    <TouchableOpacity 
      style={[styles.button, { width: size, height: size }]} 
      onPress={onPress}
      activeOpacity={0.7}
    >
      <Icon name="plus" size={iconSize} color="#fff" />
    </TouchableOpacity>
  );
};

const styles = StyleSheet.create({
  button: {
    backgroundColor: '#4F46E5',
    borderRadius: 20,
    justifyContent: 'center',
    alignItems: 'center',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.2,
    shadowRadius: 4,
    elevation: 4,
  },
});

export default AddButton;
