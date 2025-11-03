import AsyncStorage from '@react-native-async-storage/async-storage';

const STORAGE_KEY = 'mudalKalmanakaran@v1';

export const loadData = async () => {
  try {
    const value = await AsyncStorage.getItem(STORAGE_KEY);
    return value ? JSON.parse(value) : null;
  } catch (error) {
    console.warn('Failed to load data', error);
    return null;
  }
};

export const saveData = async (data) => {
  try {
    const payload = JSON.stringify(data);
    await AsyncStorage.setItem(STORAGE_KEY, payload);
  } catch (error) {
    console.warn('Failed to save data', error);
  }
};
