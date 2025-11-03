export const formatCurrency = (amount) => {
  if (amount === undefined || amount === null || Number.isNaN(amount)) {
    return '?? 0';
  }

  return `?? ${Number(amount).toLocaleString('si-LK')}`;
};
