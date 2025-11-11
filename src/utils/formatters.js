export const formatCurrency = (amount) => {
  if (Number.isNaN(Number(amount))) {
    return 'රු 0';
  }

  try {
    return `රු ${Number(amount).toLocaleString('si-LK')}`;
  } catch (error) {
    return `රු ${Number(amount).toFixed(2)}`;
  }
};
