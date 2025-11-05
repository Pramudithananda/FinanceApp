import React from 'react';
import { View, Text } from 'react-native';
import { styles } from '../styles';

const Header = ({ title, version }) => {
  return (
    <View style={styles.header}>
      <View>
        <Text style={styles.headerTitle}>{title}</Text>
        <Text style={styles.version}>{version}</Text>
      </View>
      <Text>💰</Text>
    </View>
  );
};

export default Header;