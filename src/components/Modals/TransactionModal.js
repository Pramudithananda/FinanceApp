import React, { useState, useEffect } from 'react';
import {
  View,
  Text,
  TextInput,
  TouchableOpacity,
  ScrollView,
  Modal,
  Alert,
} from 'react-native';
import { styles } from '../../styles';
import { formatCurrency } from '../../utils/formatters';

const TITLES = {
  'bank-deposit': 'බැංකුවට තැන්පත් කරන්න',
  income: 'මුදල් ලබාගැනීම',
  expense: 'වියදම් කරන්න',
};

const INFO_TEXT = (type, bankBalance, cashBalance) => {
  switch (type) {
    case 'bank-deposit':
      return 'බැංකු ශේෂය වැඩි කිරීම සඳහා මුදල් තැන්පත් කරන්න. Salary, bonus, හෝ වෙනත් ආදායම් සඳහා භාවිතා කරන්න.';
    case 'income':
      return `බැංකු ශේෂයෙන් Cash වලට මුදල් ගෙන යන්න. දැනට බැංකු ශේෂය: ${formatCurrency(
        bankBalance,
      )}`;
    case 'expense':
      return `Cash ශේෂයෙන් වියදම් කරන්න. දැනට Cash ශේෂය: ${formatCurrency(cashBalance)}`;
    default:
      return '';
  }
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

  const handleSubmit = () => {
    const value = parseFloat(amount);

    if (Number.isNaN(value) || value <= 0) {
      Alert.alert('අවවාදයයි', 'වලංගු මුදලක් ඇතුළත් කරන්න.');
      return;
    }

    if (type === 'income' && value > bankBalance) {
      Alert.alert(
        'අවවාදයයි',
        `බැංකු ශේෂය ප්‍රමාණවත් නොවේ. දැනට ඇති ශේෂය: ${formatCurrency(bankBalance)}`,
      );
      return;
    }

    if (type === 'expense' && value > cashBalance) {
      Alert.alert(
        'අවවාදයයි',
        `Cash ශේෂය ප්‍රමාණවත් නොවේ. දැනට ඇති ශේෂය: ${formatCurrency(cashBalance)}`,
      );
      return;
    }

    if (type === 'expense' && !selectedCategory) {
      Alert.alert('අවවාදයයි', 'වියදම් කිරීම සඳහා කාණ්ඩයක් තෝරන්න.');
      return;
    }

    onSubmit({
      type,
      amount: value,
      description,
      category: selectedCategory,
    });
  };

  return (
    <Modal
      animationType="slide"
      transparent
      visible={visible}
      onRequestClose={onClose}
    >
      <View style={styles.modalOverlay}>
        <View style={styles.modalContent}>
          <View style={styles.modalHeader}>
            <Text style={styles.modalTitle}>{TITLES[type] || 'ගනුදෙනුව'}</Text>
            <TouchableOpacity onPress={onClose}>
              <Text style={styles.closeBtn}>×</Text>
            </TouchableOpacity>
          </View>

          <Text style={styles.infoBox}>{INFO_TEXT(type, bankBalance, cashBalance)}</Text>

          <Text style={styles.inputLabel}>මුදල (රු)</Text>
          <TextInput
            style={styles.input}
            placeholder="මුදල ඇතුළත් කරන්න"
            keyboardType="numeric"
            placeholderTextColor="#9ca3af"
            value={amount}
            onChangeText={setAmount}
          />

          <Text style={styles.inputLabel}>විස්තරය (අමතර)</Text>
          <TextInput
            style={styles.input}
            placeholder="විස්තරය ඇතුළත් කරන්න"
            placeholderTextColor="#9ca3af"
            value={description}
            onChangeText={setDescription}
          />

          {type === 'expense' && (
            <>
              <Text style={styles.inputLabel}>කාණ්ඩය තෝරන්න</Text>
              <ScrollView style={styles.categorySelector}>
                {categories.map((category) => {
                  const remaining = Math.max(0, (category.target || 0) - (category.spent || 0));
                  const selected = selectedCategory?.id === category.id;
                  return (
                    <TouchableOpacity
                      key={category.id}
                      style={[
                        styles.categoryOption,
                        selected && styles.categoryOptionSelected,
                      ]}
                      onPress={() => setSelectedCategory(category)}
                    >
                      <Text style={{ fontWeight: '600', color: '#111827' }}>{category.name}</Text>
                      <Text style={styles.categoryOptionDetails}>
                        ගෝලය: {formatCurrency(category.target || 0)} | ඉතිරි: {formatCurrency(remaining)}
                      </Text>
                      <Text style={styles.categoryOptionDetails}>
                        වියදම්: {formatCurrency(category.spent || 0)}
                      </Text>
                    </TouchableOpacity>
                  );
                })}
              </ScrollView>
            </>
          )}

          <TouchableOpacity
            style={[
              styles.submitButton,
              type === 'bank-deposit' && styles.depositButton,
            ]}
            onPress={handleSubmit}
          >
            <Text style={styles.submitButtonText}>සේව් කරන්න</Text>
          </TouchableOpacity>
        </View>
      </View>
    </Modal>
  );
};

export default TransactionModal;
