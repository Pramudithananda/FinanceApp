import React from 'react';
import { SafeAreaView, StatusBar } from 'react-native';
import AccountManagerApp from './src/AccountManagerApp';

const App = () => {
  return (
    <SafeAreaView style={{ flex: 1 }}>
      <StatusBar barStyle="light-content" backgroundColor="#667eea" />
      <AccountManagerApp />
    </SafeAreaView>
  );
};

export default App;