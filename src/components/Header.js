import React from 'react';
import { View, Text } from 'react-native';
import { styles } from '../styles';

const Header = ({ title, version }) => {
  return (
    <View style={styles.header}>
      <View>
        <Text style={styles.headerTitle}>{title}</Text>
        {version ? <Text style={styles.version}>{version}</Text> : null}
      </View>
      <Text style={{ fontSize: 28 }}>💰</Text>
    </View>
  );
};

export default Header;
