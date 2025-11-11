import AsyncStorage from '@react-native-async-storage/async-storage';

const STORAGE_KEY = 'finance_app_v1';

export const loadData = async () => {
  try {
    const raw = await AsyncStorage.getItem(STORAGE_KEY);
    if (!raw) {
      return null;
    }
    return JSON.parse(raw);
  } catch (error) {
    console.warn('Load data failed', error);
    return null;
  }
};

export const saveData = async (data) => {
  try {
    await AsyncStorage.setItem(STORAGE_KEY, JSON.stringify(data));
  } catch (error) {
    console.warn('Save data failed', error);
  }
};
