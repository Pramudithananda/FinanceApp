export const formatCurrency = (amount) => {
  if (Number.isNaN(amount) || amount === undefined || amount === null) {
    return 'රු 0';
  }

  try {
    const formatter = new Intl.NumberFormat('si-LK', {
      style: 'currency',
      currency: 'LKR',
      maximumFractionDigits: 0,
      minimumFractionDigits: 0,
    });
    return formatter.format(amount).replace('LKR', 'රු');
  } catch (error) {
    return `රු ${parseFloat(amount).toLocaleString('si-LK')}`;
  }
};

export const formatPercentage = (value) => {
  if (!Number.isFinite(value)) {
    return '0%';
  }
  return `${value.toFixed(1)}%`;
};
