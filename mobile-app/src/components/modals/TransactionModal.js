import React, { useEffect, useState } from 'react';
import {
  View,
  Text,
  TextInput,
  TouchableOpacity,
  Modal,
  ScrollView,
  Alert,
} from 'react-native';
import { styles } from '../../styles';
import { formatCurrency } from '../../utils/formatters';

const defaultFormState = {
  amount: '',
  description: '',
  categoryId: null,
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
  const [form, setForm] = useState(defaultFormState);

  useEffect(() => {
    if (!visible) {
      setForm(defaultFormState);
    }
  }, [visible]);

  const handleChange = (key, value) => {
    setForm((prev) => ({ ...prev, [key]: value }));
  };

  const handleSubmit = () => {
    const amountValue = parseFloat(form.amount);

    if (!Number.isFinite(amountValue) || amountValue <= 0) {
      Alert.alert('අවවාදයයි', 'වලංගු මුදලක් ඇතුළත් කරන්න.');
      return;
    }

    if (type === 'income' && amountValue > bankBalance) {
      Alert.alert(
        'අවවාදයයි',
        `බැංකු ශේෂය ප්‍රමාණවත් නොවේ. දැනට ඇති ශේෂය: ${formatCurrency(bankBalance)}`
      );
      return;
    }

    if (type === 'expense' && amountValue > cashBalance) {
      Alert.alert(
        'අවවාදයයි',
        `මුදල් ශේෂය ප්‍රමාණවත් නොවේ. දැනට ඇති ශේෂය: ${formatCurrency(cashBalance)}`
      );
      return;
    }

    if (type === 'expense' && !form.categoryId) {
      Alert.alert('අවවාදයයි', 'වියදමට අදාළ කැටගරි එකක් තෝරන්න.');
      return;
    }

    const selectedCategory =
      categories.find((cat) => cat.id === form.categoryId) || null;

    onSubmit({
      type,
      amount: amountValue,
      description: form.description.trim(),
      category: selectedCategory,
    });
  };

  const modalTitleMap = {
    'bank-deposit': 'බැංකුවට තැන්පත් කරන්න',
    income: 'මුදල් ලබාගැනීම',
    expense: 'වියදම් කරන්න',
  };

  const infoTextMap = {
    'bank-deposit': 'බැංකු ශේෂය වැඩි කිරීමට මුදල් තැන්පත් කරන්න. Salary හෝ වෙනත් ආදායම් එකතු කිරීමට භාවිතා කරන්න.',
    income: `බැංකුවෙන් මුදල් හරවා Cash ශේෂයට එක් කරන්න. දැනට බැංකු ශේෂය: ${formatCurrency(
      bankBalance
    )}`,
    expense: `Cash ශේෂයෙන් වියදම් කරන්න. දැනට Cash ශේෂය: ${formatCurrency(cashBalance)}`,
  };

  return (
    <Modal transparent visible={visible} animationType="slide" onRequestClose={onClose}>
      <View style={styles.modalOverlay}>
        <View style={styles.modalContent}>
          <View style={styles.modalHeader}>
            <Text style={styles.modalTitle}>{modalTitleMap[type] || 'ගනුදෙනුව'}</Text>
            <TouchableOpacity onPress={onClose}>
              <Text style={styles.closeBtn}>×</Text>
            </TouchableOpacity>
          </View>

          {type ? <Text style={styles.infoBox}>{infoTextMap[type]}</Text> : null}

          <Text style={styles.inputLabel}>මුදල (රු)</Text>
          <TextInput
            style={styles.input}
            placeholder="මුදල ඇතුළත් කරන්න"
            keyboardType="numeric"
            value={form.amount}
            onChangeText={(value) => handleChange('amount', value)}
          />

          <Text style={styles.inputLabel}>විස්තරය (විකල්ප)</Text>
          <TextInput
            style={styles.input}
            placeholder="විස්තරය ඇතුළත් කරන්න"
            value={form.description}
            onChangeText={(value) => handleChange('description', value)}
          />

          {type === 'expense' ? (
            <>
              <Text style={styles.inputLabel}>වියදම් කාණ්ඩය තෝරන්න</Text>
              <ScrollView style={[styles.list, { maxHeight: 220 }]}>
                {categories.map((category) => {
                  const selected = form.categoryId === category.id;
                  const remaining = Math.max(0, category.target - category.spent);
                  return (
                    <TouchableOpacity
                      key={category.id}
                      style={[styles.listItem, selected && styles.listItemSelected]}
                      onPress={() => handleChange('categoryId', category.id)}
                    >
                      <View>
                        <Text style={styles.listItemText}>{category.name}</Text>
                        <Text style={styles.listItemMeta}>
                          ඉතිරි {formatCurrency(remaining)} | ගෝලය {formatCurrency(
                            category.target
                          )}
                        </Text>
                      </View>
                      <Text style={styles.listItemMeta}>
                        {formatCurrency(category.spent)} / {formatCurrency(category.target)}
                      </Text>
                    </TouchableOpacity>
                  );
                })}
              </ScrollView>
            </>
          ) : null}

          <TouchableOpacity
            style={[
              styles.submitButton,
              type === 'bank-deposit' ? styles.submitButtonAlt : null,
            ]}
            onPress={handleSubmit}
          >
            <Text style={styles.submitButtonText}>සුරකින්න</Text>
          </TouchableOpacity>
        </View>
      </View>
    </Modal>
  );
};

export default TransactionModal;
