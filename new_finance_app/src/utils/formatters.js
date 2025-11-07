export const formatCurrency = (value, locale = 'si-LK', currency = 'LKR') => {
  if (typeof value !== 'number' || Number.isNaN(value)) {
    return 'රු 0.00';
  }

  try {
    return new Intl.NumberFormat(locale, {
      style: 'currency',
      currency,
      maximumFractionDigits: 2,
    }).format(value);
  } catch (error) {
    const amount = Math.round(value * 100) / 100;
    return `රු ${amount.toLocaleString('si-LK', {
      minimumFractionDigits: 2,
      maximumFractionDigits: 2,
    })}`;
  }
};

export const formatDateTime = (date) => {
  const value = typeof date === 'string' || typeof date === 'number' ? new Date(date) : date;
  if (!(value instanceof Date) || Number.isNaN(value.getTime())) {
    return '';
  }

  return new Intl.DateTimeFormat('si-LK', {
    year: 'numeric',
    month: 'short',
    day: 'numeric',
    hour: '2-digit',
    minute: '2-digit',
  }).format(value);
};

export const formatPercentage = (input) => {
  if (typeof input !== 'number') {
    return '0%';
  }

  const value = Math.max(0, Math.min(100, input));
  return `${value.toFixed(1)}%`;
};
