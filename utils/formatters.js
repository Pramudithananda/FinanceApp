/**
 * Format currency with Sinhala Rupee symbol
 * @param {number} amount - The amount to format
 * @returns {string} Formatted currency string
 */
export const formatCurrency = (amount) => {
  return `රු ${amount.toLocaleString('en-US', {
    minimumFractionDigits: 0,
    maximumFractionDigits: 2,
  })}`;
};

/**
 * Format date to Sinhala locale
 * @param {Date} date - The date to format
 * @returns {string} Formatted date string
 */
export const formatDate = (date) => {
  return new Date(date).toLocaleString('si-LK', {
    year: 'numeric',
    month: 'long',
    day: 'numeric',
    hour: '2-digit',
    minute: '2-digit',
  });
};

/**
 * Format short date
 * @param {Date} date - The date to format
 * @returns {string} Formatted date string
 */
export const formatShortDate = (date) => {
  return new Date(date).toLocaleDateString('si-LK', {
    year: 'numeric',
    month: 'short',
    day: 'numeric',
  });
};

/**
 * Parse currency string to number
 * @param {string} currencyString - The currency string to parse
 * @returns {number} Parsed number
 */
export const parseCurrency = (currencyString) => {
  return parseFloat(currencyString.replace(/[^0-9.-]+/g, '')) || 0;
};
