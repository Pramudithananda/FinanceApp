import React from 'react';
import { View, Text } from 'react-native';
import { styles } from '../theme/styles';

const EmptyState = ({ title, description }) => (
  <View style={styles.emptyState}>
    <Text style={styles.emptyTitle}>{title}</Text>
    <Text style={styles.emptyDescription}>{description}</Text>
  </View>
);

export default EmptyState;
