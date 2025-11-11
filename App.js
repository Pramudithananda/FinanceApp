import React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import { SafeAreaProvider } from 'react-native-safe-area-context';
import DashboardScreen from './src/screens/DashboardScreen';
import BankScreen from './src/screens/BankScreen';
import CashScreen from './src/screens/CashScreen';
import CategoriesScreen from './src/screens/CategoriesScreen';
import SettingsScreen from './src/screens/SettingsScreen';
import Icon from 'react-native-vector-icons/MaterialCommunityIcons';

const Tab = createBottomTabNavigator();

export default function App() {
  return (
    <SafeAreaProvider>
      <NavigationContainer>
        <Tab.Navigator
          screenOptions={{
            headerShown: false,
            tabBarActiveTintColor: '#4f46e5',
            tabBarInactiveTintColor: '#9ca3af',
            tabBarStyle: {
              backgroundColor: '#4f46e5',
              borderTopWidth: 0,
              elevation: 8,
              height: 60,
              paddingBottom: 8,
              paddingTop: 8,
            },
            tabBarLabelStyle: {
              fontSize: 11,
              fontWeight: '600',
            },
          }}
        >
          <Tab.Screen
            name="Dashboard"
            component={DashboardScreen}
            options={{
              tabBarLabel: 'Dashboard',
              tabBarIcon: ({ color, size }) => (
                <Icon name="view-dashboard" size={size} color={color} />
              ),
            }}
          />
          <Tab.Screen
            name="Bank"
            component={BankScreen}
            options={{
              tabBarLabel: 'Bank',
              tabBarIcon: ({ color, size }) => (
                <Icon name="bank" size={size} color={color} />
              ),
            }}
          />
          <Tab.Screen
            name="Cash"
            component={CashScreen}
            options={{
              tabBarLabel: 'Cash',
              tabBarIcon: ({ color, size }) => (
                <Icon name="wallet" size={size} color={color} />
              ),
            }}
          />
          <Tab.Screen
            name="Categories"
            component={CategoriesScreen}
            options={{
              tabBarLabel: 'Categories',
              tabBarIcon: ({ color, size }) => (
                <Icon name="folder" size={size} color={color} />
              ),
            }}
          />
          <Tab.Screen
            name="Settings"
            component={SettingsScreen}
            options={{
              tabBarLabel: 'Settings',
              tabBarIcon: ({ color, size }) => (
                <Icon name="cog" size={size} color={color} />
              ),
            }}
          />
        </Tab.Navigator>
      </NavigationContainer>
    </SafeAreaProvider>
  );
}
