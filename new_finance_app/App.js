import React, { useMemo, useState } from 'react';
import {
  ActivityIndicator,
  Alert,
  SafeAreaView,
  ScrollView,
  StatusBar,
  StyleSheet,
  Text,
  View,
} from 'react-native';
import { palette, radius, spacing } from './src/styles/theme';
import Header from './src/components/Header';
import BalanceCard from './src/components/BalanceCard';
import ActionButton from './src/components/ActionButton';
import CategoryCard from './src/components/CategoryCard';
import TransactionItem from './src/components/TransactionItem';
import TransactionModal from './src/components/TransactionModal';
import CategoryModal from './src/components/CategoryModal';
import CategoryDetailsModal from './src/components/CategoryDetailsModal';
import { useFinanceData } from './src/hooks/useFinanceData';
import { formatCurrency } from './src/utils/formatters';

const App = () => {
  const { data, actions, status } = useFinanceData();
  const [transactionType, setTransactionType] = useState(null);
  const [categoryModalVisible, setCategoryModalVisible] = useState(false);
  const [detailsVisible, setDetailsVisible] = useState(false);
  const [activeCategoryId, setActiveCategoryId] = useState(null);
  const [editingCategory, setEditingCategory] = useState(null);

  const activeCategory = useMemo(
    () => data.categories.find((category) => category.id === activeCategoryId) ?? null,
    [activeCategoryId, data.categories]
  );

  const categoryTransactions = useMemo(
    () => data.transactions.filter((transaction) => transaction.categoryId === activeCategoryId),
    [activeCategoryId, data.transactions]
  );

  const openTransactionModal = (type) => setTransactionType(type);
  const closeTransactionModal = () => setTransactionType(null);

  const handleAddCategory = () => {
    setEditingCategory(null);
    setCategoryModalVisible(true);
  };

  const handleEditCategory = (category) => {
    setEditingCategory(category);
    setCategoryModalVisible(true);
  };

  const handleDeleteCategory = (category) => {
    Alert.alert(
      'කාණ්ඩය මකා දමන්න',
      `"${category.name}" කාණ්ඩය මකාදැමීමට ඔබට අවශ්‍යද?`,
      [
        { text: 'අවලංගු', style: 'cancel' },
        {
          text: 'මකන්න',
          style: 'destructive',
          onPress: () => actions.removeCategory(category.id),
        },
      ]
    );
  };

  const handleOpenDetails = (category) => {
    setActiveCategoryId(category.id);
    setDetailsVisible(true);
  };

  const closeDetails = () => {
    setDetailsVisible(false);
    setActiveCategoryId(null);
  };

  if (status.loading) {
    return (
      <SafeAreaView style={styles.loadingScreen}>
        <StatusBar barStyle="light-content" />
        <ActivityIndicator size="large" color={palette.primary} />
        <Text style={styles.loadingText}>අප්ලිකේශන් සූදානම් වෙමින්...</Text>
      </SafeAreaView>
    );
  }

  return (
    <SafeAreaView style={styles.container}>
      <StatusBar barStyle="light-content" />
      <Header
        title="නිරුමා මුදල් කළමනාකරණය"
        subtitle="ඔබගේ වෙළඳපොළේ සහ දිනපතා මුදල් ගමනාගමනයට අලුත්ම පාලන පද්ධතිය"
        bankBalance={data.bankBalance}
        cashBalance={data.cashBalance}
      />

      <ScrollView contentContainerStyle={styles.scrollContent}>
        <View style={styles.balanceRow}>
          <BalanceCard
            label="බැංකු ශේෂය"
            amount={data.bankBalance}
            type="bank"
            actionLabel="තැන්පත් කරන්න"
            onAction={() => openTransactionModal('bank-deposit')}
          />
          <View style={styles.gap} />
          <BalanceCard
            label="මුදල් ශේෂය"
            amount={data.cashBalance}
            type="cash"
            actionLabel="මුදල් ලබාගන්න"
            onAction={() => openTransactionModal('cash-withdrawal')}
          />
        </View>

        <View style={styles.actionsRow}>
          <ActionButton
            title="ආදායම් එකතු කරන්න"
            icon="💹"
            backgroundColor={palette.accent}
            onPress={() => openTransactionModal('income')}
          />
          <ActionButton
            title="වියදම සටහන් කරන්න"
            icon="🧾"
            backgroundColor={palette.danger}
            onPress={() => openTransactionModal('expense')}
          />
          <ActionButton title="නව කාණ්ඩය" icon="➕" backgroundColor={palette.primaryDark} onPress={handleAddCategory} />
          <ActionButton
            title="බැලන්ස් වාර්තාව"
            icon="📊"
            backgroundColor={palette.success}
            onPress={() =>
              Alert.alert(
                'ශේෂ වාර්තාව',
                `මුළු මිනුම් එකතුව: ${formatCurrency(data.summary.totalTargets)}\n`
                  + `වියදම්: ${formatCurrency(data.summary.totalSpent)}\n`
                  + `ඉතිරි: ${formatCurrency(data.summary.remaining)}`
              )
            }
          />
        </View>

        <View style={styles.section}>
          <Text style={styles.sectionTitle}>වියදම් කාණ්ඩ</Text>
          {data.categories.map((category) => (
            <CategoryCard
              key={category.id}
              category={category}
              onPress={() => handleOpenDetails(category)}
              onEdit={() => handleEditCategory(category)}
              onDelete={() => handleDeleteCategory(category)}
            />
          ))}
          {data.categories.length === 0 ? (
            <View style={styles.emptyState}>
              <Text style={styles.emptyText}>කාණ්ඩ පෙන්වීමට නැත. "නව කාණ්ඩය" බොත්තම භාවිතා කරන්න.</Text>
            </View>
          ) : null}
        </View>

        <View style={styles.section}>
          <Text style={styles.sectionTitle}>මෑත ගනුදෙනු</Text>
          {data.transactions.length === 0 ? (
            <View style={styles.emptyState}>
              <Text style={styles.emptyText}>ගනුදෙනු සටහන් කළിട്ടില്ല.</Text>
            </View>
          ) : (
            data.transactions.slice(0, 15).map((transaction) => <TransactionItem key={transaction.id} transaction={transaction} />)
          )}
        </View>
      </ScrollView>

      <TransactionModal
        visible={Boolean(transactionType)}
        type={transactionType}
        bankBalance={data.bankBalance}
        cashBalance={data.cashBalance}
        categories={data.categories}
        onClose={closeTransactionModal}
        onSubmit={actions.addTransaction}
      />

      <CategoryModal
        visible={categoryModalVisible}
        category={editingCategory}
        onClose={() => setCategoryModalVisible(false)}
        onSubmit={actions.upsertCategory}
      />

      <CategoryDetailsModal
        visible={detailsVisible}
        category={activeCategory}
        transactions={categoryTransactions}
        onClose={closeDetails}
      />
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: palette.surfaceAlt,
  },
  loadingScreen: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    backgroundColor: palette.surfaceAlt,
  },
  loadingText: {
    marginTop: spacing.md,
    color: palette.textSecondary,
  },
  scrollContent: {
    paddingHorizontal: spacing.lg,
    paddingVertical: spacing.lg,
  },
  balanceRow: {
    flexDirection: 'row',
    marginBottom: spacing.lg,
  },
  gap: {
    width: spacing.md,
  },
  actionsRow: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    justifyContent: 'space-between',
    marginBottom: spacing.lg,
  },
  section: {
    marginBottom: spacing.xl,
  },
  sectionTitle: {
    fontSize: 18,
    fontWeight: '700',
    color: palette.text,
    marginBottom: spacing.md,
  },
  emptyState: {
    backgroundColor: palette.surface,
    borderRadius: radius.lg,
    padding: spacing.lg,
    alignItems: 'center',
  },
  emptyText: {
    color: palette.textSecondary,
    textAlign: 'center',
  },
});

export default App;
