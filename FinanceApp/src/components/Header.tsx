import React from 'react';
import { View, Text } from 'react-native';
import { styles } from '../styles';

interface HeaderProps {
  title: string;
  version: string;
}

const Header: React.FC<HeaderProps> = ({ title, version }) => {
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