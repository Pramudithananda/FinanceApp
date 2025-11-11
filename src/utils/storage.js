import AsyncStorage from '@react-native-async-storage/async-storage';

const STORAGE_KEY = '@finance_app_data';

export const loadData = async () => {
  try {
    const jsonValue = await AsyncStorage.getItem(STORAGE_KEY);
    return jsonValue != null ? JSON.parse(jsonValue) : null;
  } catch (e) {
    console.error('Error loading data:', e);
    return null;
  }
};

export const saveData = async (data) => {
  try {
    const jsonValue = JSON.stringify(data);
    await AsyncStorage.setItem(STORAGE_KEY, jsonValue);
  } catch (e) {
    console.error('Error saving data:', e);
  }
};
