import React from 'react';
import { Pressable, StyleSheet, Text } from 'react-native';
import { palette, radius, spacing } from '../styles/theme';

const ActionButton = ({ title, backgroundColor = palette.primary, onPress, icon }) => (
  <Pressable onPress={onPress} style={({ pressed }) => [styles.button, { backgroundColor }, pressed && styles.pressed]}>
    <Text style={styles.label}>
      {icon ? `${icon} ` : ''}
      {title}
    </Text>
  </Pressable>
);

const styles = StyleSheet.create({
  button: {
    flexBasis: '48%',
    borderRadius: radius.md,
    paddingVertical: spacing.md,
    paddingHorizontal: spacing.md,
    alignItems: 'center',
    marginBottom: spacing.md,
  },
  label: {
    color: '#FFFFFF',
    fontSize: 15,
    fontWeight: '600',
  },
  pressed: {
    opacity: 0.85,
  },
});

export default ActionButton;
