import React, { useMemo, useState } from 'react';
import { View, ScrollView, ActivityIndicator, Text, TouchableOpacity } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import Header from '../components/Header';
import BalanceCard from '../components/BalanceCard';
import ActionButton from '../components/ActionButton';
import CategoryCard from '../components/CategoryCard';
import TransactionItem from '../components/TransactionItem';
import EmptyState from '../components/EmptyState';
import TransactionModal from '../components/modals/TransactionModal';
import CategoryModal from '../components/modals/CategoryModal';
import CategoryDetailsModal from '../components/modals/CategoryDetailsModal';
import { useFinanceData, TRANSACTION_TYPES } from '../hooks/useFinanceData';
import { styles } from '../theme/styles';
import { palette } from '../theme/colors';

const DashboardScreen = () => {
  const {
    bankBalance,
    cashBalance,
    categories,
    transactions,
    loading,
    error,
    summary,
    addTransaction,
    saveCategory,
    deleteCategory,
    resetData,
  } = useFinanceData();

  const [transactionType, setTransactionType] = useState(null);
  const [categoryModalVisible, setCategoryModalVisible] = useState(false);
  const [editingCategory, setEditingCategory] = useState(null);
  const [detailsCategoryId, setDetailsCategoryId] = useState(null);

  const sortedCategories = useMemo(
    () =>
      [...categories].sort(
        (a, b) => (b.target - b.spent) / (b.target || 1) - (a.target - a.spent) / (a.target || 1),
      ),
    [categories],
  );

  const recentTransactions = useMemo(() => transactions.slice(0, 6), [transactions]);
  const activeCategory = useMemo(
    () => categories.find((category) => category.id === detailsCategoryId) ?? null,
    [categories, detailsCategoryId],
  );
  const categoryTransactions = useMemo(
    () => transactions.filter((transaction) => transaction.categoryId === detailsCategoryId),
    [transactions, detailsCategoryId],
  );

  const openCategoryModal = (category = null) => {
    setEditingCategory(category);
    setCategoryModalVisible(true);
  };

  return (
    <SafeAreaView style={styles.safeArea}>
      <View style={styles.container}>
        <Header summary={summary} onReset={resetData} />
        {error ? (
          <View style={styles.banner}>
            <Text style={styles.bannerText}>{error}</Text>
          </View>
        ) : null}

        {loading ? (
          <ActivityIndicator style={styles.loader} size="large" color={palette.navyLight} />
        ) : (
          <ScrollView contentContainerStyle={styles.scrollContainer}>
            <View style={styles.balanceRow}>
              <BalanceCard
                label="බැංකු ශේෂය"
                amount={bankBalance}
                description="ඔබගේ බැංකුවේ ඇතැම් මුදල්"
                actionLabel="තැන්පත් කරන්න"
                variant="bank"
                onActionPress={() => setTransactionType(TRANSACTION_TYPES.BANK_DEPOSIT)}
              />
              <BalanceCard
                label="Cash ශේෂය"
                amount={cashBalance}
                description="පසුදාිනික වියදම් සඳහා"
                actionLabel="Cash එකතු"
                variant="cash"
                onActionPress={() => setTransactionType(TRANSACTION_TYPES.CASH_WITHDRAWAL)}
              />
            </View>

            <View style={styles.actionGrid}>
              <ActionButton
                label="🏦 බැංකුවට තැන්පත්"
                color="#7C3AED"
                onPress={() => setTransactionType(TRANSACTION_TYPES.BANK_DEPOSIT)}
              />
              <ActionButton
                label="⬇️ Cash ලබාගැනීම"
                color="#10B981"
                onPress={() => setTransactionType(TRANSACTION_TYPES.CASH_WITHDRAWAL)}
              />
              <ActionButton
                label="⬆️ වියදම්"
                color="#EF4444"
                onPress={() => setTransactionType(TRANSACTION_TYPES.CASH_EXPENSE)}
              />
              <ActionButton
                label="➕ නව කාණ්ඩයක්"
                color="#475569"
                onPress={() => openCategoryModal()}
              />
            </View>

            <View style={styles.section}>
              <View style={styles.sectionHeader}>
                <View>
                  <Text style={styles.sectionTitle}>වියදම් කාණ්ඩ</Text>
                  <Text style={styles.sectionHint}>කාණ්ඩයක් තට්ටු කර විස්තර බලන්න</Text>
                </View>
                <TouchableOpacity
                  style={styles.sectionActionButton}
                  onPress={() => openCategoryModal()}
                >
                  <Text style={styles.sectionActionText}>➕ එකතු කරන්න</Text>
                </TouchableOpacity>
              </View>

              {sortedCategories.length === 0 ? (
                <EmptyState
                  title="කාණ්ඩ නොමැත"
                  description="නව වියදම් කාණ්ඩයක් එකතු කිරීමට “➕ එකතු කරන්න” බොත්තම භාවිතා කරන්න."
                />
              ) : (
                sortedCategories.map((category) => (
                  <CategoryCard
                    key={category.id}
                    category={category}
                    onPress={() => setDetailsCategoryId(category.id)}
                    onEdit={() => openCategoryModal(category)}
                    onDelete={() => deleteCategory(category.id)}
                  />
                ))
              )}
            </View>

            <View style={styles.section}>
              <Text style={styles.sectionTitle}>මෑත ගනුදෙනු</Text>
              {recentTransactions.length === 0 ? (
                <EmptyState
                  title="ගනුදෙනු නොමැත"
                  description="තැන්පතු, cash මාරු කිරීම හෝ වියදම් එක් කිරීමෙන් තොරතුරු මෙහි පෙන්වයි."
                />
              ) : (
                recentTransactions.map((transaction) => (
                  <TransactionItem key={transaction.id} transaction={transaction} />
                ))
              )}
            </View>
          </ScrollView>
        )}
      </View>

      <TransactionModal
        visible={!!transactionType}
        type={transactionType}
        bankBalance={bankBalance}
        cashBalance={cashBalance}
        categories={categories}
        onClose={() => setTransactionType(null)}
        onSubmit={addTransaction}
      />

      <CategoryModal
        visible={categoryModalVisible}
        category={editingCategory}
        onClose={() => setCategoryModalVisible(false)}
        onSubmit={saveCategory}
      />

      <CategoryDetailsModal
        visible={!!activeCategory}
        category={activeCategory}
        transactions={categoryTransactions}
        onClose={() => setDetailsCategoryId(null)}
      />
    </SafeAreaView>
  );
};

export default DashboardScreen;
