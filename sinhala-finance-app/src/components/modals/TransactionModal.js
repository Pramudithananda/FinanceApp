import React, { useEffect, useState } from 'react';
import {
  Modal,
  View,
  Text,
  TouchableOpacity,
  TextInput,
  ScrollView,
  KeyboardAvoidingView,
  Platform,
} from 'react-native';
import { styles } from '../../theme/styles';
import { formatCurrency } from '../../utils/formatters';
import { TRANSACTION_TYPES } from '../../hooks/useFinanceData';

const copy = {
  [TRANSACTION_TYPES.BANK_DEPOSIT]: {
    title: '🏦 බැංකුවට තැන්පත් කිරීම',
    hint: 'බැංකු ශේෂය ඉහළ දැමීමට මාසික ආදායම් හෝ වෙනත් තැන්පතු ඇතුළත් කරන්න.',
    actionLabel: 'තැන්පතු කරන්න',
  },
  [TRANSACTION_TYPES.CASH_WITHDRAWAL]: {
    title: '⬇️ Cash ලබාගැනීම',
    hint: 'බැංකුවෙන් cash වෙත මුදල් මාරු කිරීම. බැංකු ශේෂය ප්‍රමාණවත් වීම පිළිබඳව විශ්වාසවන්ත වන්න.',
    actionLabel: 'Cash එකතු කරන්න',
  },
  [TRANSACTION_TYPES.CASH_EXPENSE]: {
    title: '⬆️ වියදම් සටහන් කරන්න',
    hint: 'දෛනික වියදම් සටහන් කරන්න. ඕනෑම කාණ්ඩයක් තෝරා ගන්න.',
    actionLabel: 'වියදම සටහන් කරන්න',
  },
};

const TransactionModal = ({
  visible,
  type,
  bankBalance,
  cashBalance,
  categories,
  onClose,
  onSubmit,
}) => {
  const [amount, setAmount] = useState('');
  const [description, setDescription] = useState('');
  const [selectedCategory, setSelectedCategory] = useState(null);

  useEffect(() => {
    if (!visible) {
      setAmount('');
      setDescription('');
      setSelectedCategory(null);
    }
  }, [visible, type]);

  if (!type) {
    return null;
  }

  const metadata = copy[type];
  const helperText =
    type === TRANSACTION_TYPES.BANK_DEPOSIT
      ? `දැනට බැංකු ශේෂය ${formatCurrency(bankBalance)}`
      : type === TRANSACTION_TYPES.CASH_WITHDRAWAL
      ? `දැනට බැංකු ශේෂය ${formatCurrency(bankBalance)}`
      : `දැනට cash ශේෂය ${formatCurrency(cashBalance)}`;

  const handleSubmit = () => {
    const success = onSubmit({
      type,
      amount,
      description,
      categoryId: selectedCategory?.id ?? null,
    });

    if (success) {
      setAmount('');
      setDescription('');
      setSelectedCategory(null);
      onClose();
    }
  };

  return (
    <Modal visible={visible} transparent animationType="fade" onRequestClose={onClose}>
      <KeyboardAvoidingView
        style={styles.modalOverlay}
        behavior={Platform.OS === 'ios' ? 'padding' : undefined}
      >
        <View style={styles.modalCard}>
          <View style={styles.modalHeader}>
            <Text style={styles.modalTitle}>{metadata.title}</Text>
            <TouchableOpacity style={styles.modalClose} onPress={onClose}>
              <Text style={styles.modalCloseText}>✖️</Text>
            </TouchableOpacity>
          </View>
          <Text style={styles.modalSubtitle}>{metadata.hint}</Text>
          <Text style={styles.helper}>{helperText}</Text>

          <Text style={styles.label}>මුදල (රු)</Text>
          <TextInput
            style={styles.input}
            keyboardType="decimal-pad"
            placeholder="0.00"
            value={amount}
            onChangeText={setAmount}
          />

          <Text style={styles.label}>විස්තරය (අත්‍යාවශ්‍ය නම්)</Text>
          <TextInput
            style={styles.input}
            placeholder="සටහනක් ඇතුළත් කරන්න"
            value={description}
            onChangeText={setDescription}
          />

          {type === TRANSACTION_TYPES.CASH_EXPENSE ? (
            <>
              <Text style={styles.label}>කාණ්ඩය තෝරන්න</Text>
              <ScrollView style={styles.categoryPicker}>
                {categories.map((category) => (
                  <TouchableOpacity
                    key={category.id}
                    style={[
                      styles.categoryOption,
                      selectedCategory?.id === category.id && styles.categoryOptionActive,
                    ]}
                    onPress={() => setSelectedCategory(category)}
                  >
                    <Text style={styles.categoryOptionLabel}>{category.name}</Text>
                    <Text style={styles.categoryOptionMeta}>
                      ඉතිරි: {formatCurrency(Math.max(category.target - category.spent, 0))}
                    </Text>
                  </TouchableOpacity>
                ))}
              </ScrollView>
            </>
          ) : null}

          <View style={styles.modalFooter}>
            <TouchableOpacity style={styles.secondaryButton} onPress={onClose}>
              <Text style={styles.secondaryButtonText}>අවලංගු කරන්න</Text>
            </TouchableOpacity>
            <TouchableOpacity style={[styles.primaryButton, styles.primaryButtonAccent]} onPress={handleSubmit}>
              <Text style={styles.primaryButtonText}>{metadata.actionLabel}</Text>
            </TouchableOpacity>
          </View>
        </View>
      </KeyboardAvoidingView>
    </Modal>
  );
};

export default TransactionModal;
