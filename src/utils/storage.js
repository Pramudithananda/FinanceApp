import AsyncStorage from '@react-native-async-storage/async-storage';

const STORAGE_KEY = 'financeAppV1State';

export const loadData = async () => {
  try {
    const stored = await AsyncStorage.getItem(STORAGE_KEY);
    return stored ? JSON.parse(stored) : null;
  } catch (error) {
    console.error('Error loading saved data', error);
    throw error;
  }
};

export const saveData = async (data) => {
  try {
    await AsyncStorage.setItem(STORAGE_KEY, JSON.stringify(data));
  } catch (error) {
    console.error('Error persisting data', error);
    throw error;
  }
};

export const clearData = async () => {
  try {
    await AsyncStorage.removeItem(STORAGE_KEY);
  } catch (error) {
    console.error('Error clearing saved data', error);
    throw error;
  }
};
