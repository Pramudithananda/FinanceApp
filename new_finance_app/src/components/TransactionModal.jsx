import React, { useEffect, useState } from 'react';
import {
  Alert,
  KeyboardAvoidingView,
  Modal,
  Platform,
  Pressable,
  ScrollView,
  StyleSheet,
  Text,
  TextInput,
  View,
} from 'react-native';
import { palette, radius, spacing } from '../styles/theme';
import { formatCurrency } from '../utils/formatters';

const titles = {
  'bank-deposit': 'බැංකුවට තැන්පත් කරන්න',
  'cash-withdrawal': 'බැංකුවෙන් මුදල් ලබාගන්න',
  income: 'ආදායම් එකතු කරන්න',
  expense: 'වියදම් සටහන් කරන්න',
};

const hints = {
  'bank-deposit': (bankBalance) => `දැනට බැංකු ශේෂය: ${formatCurrency(bankBalance)}`,
  'cash-withdrawal': (bankBalance) => `දැනට බැංකු ශේෂය: ${formatCurrency(bankBalance)}`,
  income: (cashBalance) => `දැනට මුදල් ශේෂය: ${formatCurrency(cashBalance)}`,
  expense: (cashBalance) => `දැනට මුදල් ශේෂය: ${formatCurrency(cashBalance)}.`,
};

const TransactionModal = ({ visible, type, bankBalance, cashBalance, categories, onClose, onSubmit }) => {
  const [amount, setAmount] = useState('');
  const [description, setDescription] = useState('');
  const [categoryId, setCategoryId] = useState(null);

  useEffect(() => {
    if (!visible) {
      setAmount('');
      setDescription('');
      setCategoryId(null);
    }
  }, [visible]);

  const handleSubmit = () => {
    try {
      onSubmit({
        type,
        amount: parseFloat(amount),
        description,
        categoryId,
      });
      onClose();
    } catch (error) {
      Alert.alert('දෝෂයක්', error.message || 'ගනුදෙනුව සුරැකීම අසාර්ථක විය');
    }
  };

  const showsCategories = type === 'expense';

  return (
    <Modal visible={visible} animationType="slide" transparent onRequestClose={onClose}>
      <KeyboardAvoidingView
        style={styles.overlay}
        behavior={Platform.OS === 'ios' ? 'padding' : undefined}
        keyboardVerticalOffset={Platform.OS === 'ios' ? 80 : 0}
      >
        <Pressable style={styles.backdrop} onPress={onClose} />
        <View style={styles.card}>
          <View style={styles.header}>
            <Text style={styles.title}>{titles[type]}</Text>
            <Pressable onPress={onClose} hitSlop={12}>
              <Text style={styles.close}>✕</Text>
            </Pressable>
          </View>

          <Text style={styles.hint}>{(hints[type] || (() => ''))(type === 'expense' ? cashBalance : bankBalance)}</Text>

          <Text style={styles.label}>මුදල (රු)</Text>
          <TextInput
            style={styles.input}
            value={amount}
            keyboardType="numeric"
            onChangeText={setAmount}
            placeholder="0.00"
          />

          <Text style={styles.label}>විස්තරය (අමතර)</Text>
          <TextInput
            style={[styles.input, styles.multiline]}
            value={description}
            onChangeText={setDescription}
            placeholder="අමතර විස්තර"
            multiline
            numberOfLines={3}
          />

          {showsCategories ? (
            <>
              <Text style={[styles.label, styles.sectionLabel]}>කාණ්ඩයක් තෝරන්න</Text>
              <ScrollView style={styles.categoryList} contentContainerStyle={styles.categoryContent}>
                {categories.map((category) => {
                  const selected = category.id === categoryId;
                  return (
                    <Pressable
                      key={category.id}
                      onPress={() => setCategoryId(category.id)}
                      style={[
                        styles.categoryItem,
                        selected && { borderColor: category.color ?? palette.primary, backgroundColor: `${category.color ?? palette.primary}15` },
                      ]}
                    >
                      <View style={[styles.dot, { backgroundColor: category.color ?? palette.primary }]} />
                      <View style={styles.categoryMeta}>
                        <Text style={styles.categoryName}>{category.name}</Text>
                        <Text style={styles.categoryHint}>
                          {formatCurrency(category.spent)} / {formatCurrency(category.target)}
                        </Text>
                      </View>
                    </Pressable>
                  );
                })}
              </ScrollView>
            </>
          ) : null}

          <Pressable style={styles.submitButton} onPress={handleSubmit}>
            <Text style={styles.submitLabel}>සුරකින්න</Text>
          </Pressable>
        </View>
      </KeyboardAvoidingView>
    </Modal>
  );
};

const styles = StyleSheet.create({
  overlay: {
    flex: 1,
    justifyContent: 'flex-end',
    backgroundColor: palette.overlay,
  },
  backdrop: {
    flex: 1,
  },
  card: {
    backgroundColor: palette.surface,
    borderTopLeftRadius: radius.xl,
    borderTopRightRadius: radius.xl,
    paddingHorizontal: spacing.lg,
    paddingTop: spacing.lg,
    paddingBottom: spacing.xl,
  },
  header: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    marginBottom: spacing.md,
  },
  title: {
    fontSize: 18,
    fontWeight: '700',
    color: palette.text,
  },
  close: {
    fontSize: 22,
    color: palette.textSecondary,
  },
  hint: {
    backgroundColor: palette.surfaceAlt,
    borderRadius: radius.md,
    padding: spacing.md,
    color: palette.textSecondary,
    marginBottom: spacing.lg,
  },
  label: {
    color: palette.textSecondary,
    fontSize: 13,
    marginBottom: spacing.xs,
  },
  input: {
    borderWidth: 1,
    borderColor: palette.border,
    borderRadius: radius.md,
    padding: spacing.md,
    fontSize: 16,
    marginBottom: spacing.md,
  },
  multiline: {
    height: 90,
    textAlignVertical: 'top',
  },
  sectionLabel: {
    marginTop: spacing.md,
  },
  categoryList: {
    maxHeight: 200,
    marginBottom: spacing.lg,
  },
  categoryContent: {
    paddingBottom: spacing.sm,
  },
  categoryItem: {
    flexDirection: 'row',
    alignItems: 'center',
    borderWidth: 1,
    borderColor: palette.border,
    borderRadius: radius.md,
    padding: spacing.md,
    marginBottom: spacing.sm,
  },
  dot: {
    width: 10,
    height: 10,
    borderRadius: 5,
    marginRight: spacing.md,
  },
  categoryMeta: {
    flex: 1,
  },
  categoryName: {
    fontWeight: '600',
    color: palette.text,
  },
  categoryHint: {
    color: palette.textSecondary,
    fontSize: 12,
  },
  submitButton: {
    backgroundColor: palette.primary,
    borderRadius: radius.md,
    paddingVertical: spacing.md,
    alignItems: 'center',
  },
  submitLabel: {
    color: palette.surface,
    fontSize: 16,
    fontWeight: '600',
  },
});

export default TransactionModal;
