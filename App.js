import React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import { SafeAreaProvider } from 'react-native-safe-area-context';
import Icon from 'react-native-vector-icons/MaterialCommunityIcons';

import DashboardScreen from './src/screens/DashboardScreen';
import BankScreen from './src/screens/BankScreen';
import CashScreen from './src/screens/CashScreen';
import CategoriesScreen from './src/screens/CategoriesScreen';
import SettingsScreen from './src/screens/SettingsScreen';
import { AppProvider } from './src/context/AppContext';

const Tab = createBottomTabNavigator();

export default function App() {
  return (
    <SafeAreaProvider>
      <AppProvider>
        <NavigationContainer>
          <Tab.Navigator
            screenOptions={{
              tabBarActiveTintColor: '#4F46E5',
              tabBarInactiveTintColor: '#9CA3AF',
              tabBarStyle: {
                backgroundColor: '#FFFFFF',
                borderTopWidth: 1,
                borderTopColor: '#E5E7EB',
                height: 65,
                paddingBottom: 8,
                paddingTop: 8,
              },
              tabBarLabelStyle: {
                fontSize: 11,
                fontWeight: '600',
              },
              headerStyle: {
                backgroundColor: '#4F46E5',
              },
              headerTintColor: '#FFFFFF',
              headerTitleStyle: {
                fontWeight: 'bold',
                fontSize: 20,
              },
            }}
          >
            <Tab.Screen
              name="Dashboard"
              component={DashboardScreen}
              options={{
                title: 'Dashboard',
                tabBarLabel: 'මුල් පිටුව',
                tabBarIcon: ({ color, size }) => (
                  <Icon name="view-dashboard" size={size} color={color} />
                ),
              }}
            />
            <Tab.Screen
              name="Bank"
              component={BankScreen}
              options={{
                title: 'බැංකු ගිණුම්',
                tabBarLabel: 'බැංකු',
                tabBarIcon: ({ color, size }) => (
                  <Icon name="bank" size={size} color={color} />
                ),
              }}
            />
            <Tab.Screen
              name="Cash"
              component={CashScreen}
              options={{
                title: 'මුදල් ගිණුම්',
                tabBarLabel: 'මුදල්',
                tabBarIcon: ({ color, size }) => (
                  <Icon name="cash" size={size} color={color} />
                ),
              }}
            />
            <Tab.Screen
              name="Categories"
              component={CategoriesScreen}
              options={{
                title: 'ප්‍රවර්ග',
                tabBarLabel: 'ප්‍රවර්ග',
                tabBarIcon: ({ color, size }) => (
                  <Icon name="folder-open" size={size} color={color} />
                ),
              }}
            />
            <Tab.Screen
              name="Settings"
              component={SettingsScreen}
              options={{
                title: 'සැකසුම්',
                tabBarLabel: 'සැකසුම්',
                tabBarIcon: ({ color, size }) => (
                  <Icon name="cog" size={size} color={color} />
                ),
              }}
            />
          </Tab.Navigator>
        </NavigationContainer>
      </AppProvider>
    </SafeAreaProvider>
  );
}
