const currencyFormatter = new Intl.NumberFormat('si-LK', {
  style: 'currency',
  currency: 'LKR',
  minimumFractionDigits: 2,
  maximumFractionDigits: 2,
});

export const formatCurrency = (value) => {
  const amount = Number(value) || 0;
  return currencyFormatter.format(amount).replace('LKR', 'රු');
};
