const currencyFormatter = new Intl.NumberFormat('si-LK', {
  style: 'currency',
  currency: 'LKR',
  maximumFractionDigits: 2,
});

export const formatCurrency = (value) => {
  if (Number.isNaN(value) || value === undefined || value === null) {
    return 'රු 0.00';
  }
  return currencyFormatter.format(Number(value));
};

export const formatPercent = (value) => {
  if (!Number.isFinite(value)) {
    return '0%';
  }
  return `${value.toFixed(1)}%`;
};

export const formatDateTime = (timestamp) => {
  try {
    const date = typeof timestamp === 'string' ? new Date(timestamp) : timestamp;
    return new Intl.DateTimeFormat('si-LK', {
      dateStyle: 'medium',
      timeStyle: 'short',
    }).format(date);
  } catch (error) {
    return '';
  }
};
