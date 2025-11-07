export const formatCurrency = (amount) => {
  return `රු ${amount.toLocaleString('si-LK', {
    minimumFractionDigits: 2,
    maximumFractionDigits: 2
  })}`;
};

export const formatDate = (date) => {
  return new Date(date).toLocaleDateString('si-LK', {
    year: 'numeric',
    month: 'long',
    day: 'numeric',
    hour: '2-digit',
    minute: '2-digit'
  });
};

export const formatNumber = (num) => {
  return num.toLocaleString('si-LK');
};

export const calculatePercentage = (value, total) => {
  if (total === 0) return 0;
  return Math.round((value / total) * 100);
};
