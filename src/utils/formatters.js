export const formatCurrency = (amount) => {
  return `රු ${Math.abs(amount).toLocaleString('en-US', {
    minimumFractionDigits: 2,
    maximumFractionDigits: 2,
  })}`;
};

export const formatDate = (dateString) => {
  const date = new Date(dateString);
  const now = new Date();
  const diffTime = Math.abs(now - date);
  const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));

  if (diffDays === 0) {
    return 'අද';
  } else if (diffDays === 1) {
    return 'ඊයේ';
  } else if (diffDays < 7) {
    return `දින ${diffDays}කට පෙර`;
  } else {
    return date.toLocaleDateString('si-LK');
  }
};

export const formatNumber = (num) => {
  return num.toLocaleString('en-US');
};
