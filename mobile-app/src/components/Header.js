import React from 'react';
import { View, Text } from 'react-native';
import { styles } from '../styles';

const Header = ({ title, subtitle }) => (
  <View style={styles.header}>
    <View>
      <Text style={styles.headerTitle}>{title}</Text>
      {subtitle ? <Text style={styles.headerSubtitle}>{subtitle}</Text> : null}
    </View>
    <Text style={styles.headerTitle}>💸</Text>
  </View>
);

export default Header;
