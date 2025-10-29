import AsyncStorage from '@react-native-async-storage/async-storage';

const STORAGE_KEY = 'budget_tracker_data';

export const saveData = async (data) => {
  try {
    const jsonData = JSON.stringify(data);
    await AsyncStorage.setItem(STORAGE_KEY, jsonData);
  } catch (error) {
    console.error('Error saving data:', error);
    throw error;
  }
};

export const loadData = async () => {
  try {
    const jsonData = await AsyncStorage.getItem(STORAGE_KEY);
    return jsonData ? JSON.parse(jsonData) : null;
  } catch (error) {
    console.error('Error loading data:', error);
    throw error;
  }
};

export const clearData = async () => {
  try {
    await AsyncStorage.removeItem(STORAGE_KEY);
  } catch (error) {
    console.error('Error clearing data:', error);
    throw error;
  }
};