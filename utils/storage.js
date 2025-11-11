import AsyncStorage from '@react-native-async-storage/async-storage';

const STORAGE_KEYS = {
  ACCOUNTS: '@finance_app:accounts',
  CASH_BALANCE: '@finance_app:cash_balance',
  TRANSACTIONS: '@finance_app:transactions',
  SETTINGS: '@finance_app:settings',
};

/**
 * Save accounts data
 * @param {Array} accounts - Array of account objects
 */
export const saveAccounts = async (accounts) => {
  try {
    await AsyncStorage.setItem(STORAGE_KEYS.ACCOUNTS, JSON.stringify(accounts));
    return true;
  } catch (error) {
    console.error('Error saving accounts:', error);
    return false;
  }
};

/**
 * Load accounts data
 * @returns {Array} Array of account objects
 */
export const loadAccounts = async () => {
  try {
    const data = await AsyncStorage.getItem(STORAGE_KEYS.ACCOUNTS);
    return data ? JSON.parse(data) : null;
  } catch (error) {
    console.error('Error loading accounts:', error);
    return null;
  }
};

/**
 * Save cash balance
 * @param {number} balance - Cash balance amount
 */
export const saveCashBalance = async (balance) => {
  try {
    await AsyncStorage.setItem(STORAGE_KEYS.CASH_BALANCE, balance.toString());
    return true;
  } catch (error) {
    console.error('Error saving cash balance:', error);
    return false;
  }
};

/**
 * Load cash balance
 * @returns {number} Cash balance amount
 */
export const loadCashBalance = async () => {
  try {
    const data = await AsyncStorage.getItem(STORAGE_KEYS.CASH_BALANCE);
    return data ? parseFloat(data) : null;
  } catch (error) {
    console.error('Error loading cash balance:', error);
    return null;
  }
};

/**
 * Save transactions
 * @param {Array} transactions - Array of transaction objects
 */
export const saveTransactions = async (transactions) => {
  try {
    await AsyncStorage.setItem(STORAGE_KEYS.TRANSACTIONS, JSON.stringify(transactions));
    return true;
  } catch (error) {
    console.error('Error saving transactions:', error);
    return false;
  }
};

/**
 * Load transactions
 * @returns {Array} Array of transaction objects
 */
export const loadTransactions = async () => {
  try {
    const data = await AsyncStorage.getItem(STORAGE_KEYS.TRANSACTIONS);
    return data ? JSON.parse(data) : null;
  } catch (error) {
    console.error('Error loading transactions:', error);
    return null;
  }
};

/**
 * Clear all app data
 */
export const clearAllData = async () => {
  try {
    await AsyncStorage.multiRemove([
      STORAGE_KEYS.ACCOUNTS,
      STORAGE_KEYS.CASH_BALANCE,
      STORAGE_KEYS.TRANSACTIONS,
      STORAGE_KEYS.SETTINGS,
    ]);
    return true;
  } catch (error) {
    console.error('Error clearing data:', error);
    return false;
  }
};
