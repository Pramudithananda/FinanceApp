import React, { useEffect, useState } from 'react';
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
    const amountNumber = parseFloat(amount);

    if (Number.isNaN(amountNumber) || amountNumber <= 0) {
      Alert.alert('දෝෂය', 'වලංගු මුදලක් ඇතුළත් කරන්න');
      return;
    }

    if (type === 'income' && amountNumber > bankBalance) {
      Alert.alert(
        'මුදල ඉක්මවි ඇත',
        `බැංකු ශේෂය ප්‍රමාණවත් නොවේ. දැනට ඇති ශේෂය: ${formatCurrency(bankBalance)}`,
      );
      return;
    }

    if (type === 'expense' && amountNumber > cashBalance) {
      Alert.alert(
        'මුදල ඉක්මවි ඇත',
        `මුදල් ශේෂය ප්‍රමාණවත් නොවේ. දැනට ඇති ශේෂය: ${formatCurrency(cashBalance)}`,
      );
      return;
    }

    if (type === 'expense' && !selectedCategory) {
      Alert.alert('දෝෂය', 'කරුණාකර කාණ්ඩයක් තෝරන්න');
      return;
    }

    onSubmit({
      type,
      amount: amountNumber,
      description: description.trim(),
      category: selectedCategory,
    });

    setAmount('');
    setDescription('');
    setSelectedCategory(null);
  };

  const getModalTitle = () => {
    switch (type) {
      case 'bank-deposit':
        return 'බැංකුවට තැන්පත් කරන්න';
      case 'income':
        return 'මුදල් ලබාගැනීම';
      case 'expense':
        return 'වියදම් කරන්න';
      default:
        return 'ගනුදෙනුව';
    }
  };

  const getInfoText = () => {
    switch (type) {
      case 'bank-deposit':
        return 'බැංකු ශේෂය වැඩි කිරීම සඳහා තැන්පත් කරන්න. Salary, bonus වැනි ආදායම් වලට භාවිතා කරන්න.';
      case 'income':
        return `බැංකුවෙන් මුදල් ලබා cash ශේෂයට එකතු කරන්න. දැනට බැංකු ශේෂය: ${formatCurrency(bankBalance)}`;
      case 'expense':
        return `Cash ශේෂයෙන් වියදම් එකතු කරන්න. දැනට cash ශේෂය: ${formatCurrency(cashBalance)}`;
      default:
        return '';
    }
  };

  return (
    <Modal animationType="slide" transparent visible={visible} onRequestClose={onClose}>
      <View style={styles.modalOverlay}>
        <View style={styles.modalContent}>
          <View style={styles.modalHeader}>
            <Text style={styles.modalTitle}>{getModalTitle()}</Text>
            <TouchableOpacity onPress={onClose} accessibilityRole="button">
              <Text style={styles.closeBtn}>×</Text>
            </TouchableOpacity>
          </View>

          {type ? <Text style={styles.infoBox}>{getInfoText()}</Text> : null}

          <Text style={styles.inputLabel}>මුදල (රු)</Text>
          <TextInput
            style={styles.input}
            placeholder="මුදල ඇතුළත් කරන්න"
            keyboardType="numeric"
            value={amount}
            onChangeText={setAmount}
          />

          <Text style={styles.inputLabel}>විස්තරය (අමතර)</Text>
          <TextInput
            style={styles.input}
            placeholder="විස්තරය ඇතුළත් කරන්න"
            value={description}
            onChangeText={setDescription}
          />

          {type === 'expense' ? (
            <>
              <Text style={styles.inputLabel}>කාණ්ඩය තෝරන්න</Text>
              <ScrollView style={styles.categorySelector}>
                {categories.map((category) => {
                  const isSelected = selectedCategory?.id === category.id;
                  return (
                    <TouchableOpacity
                      key={category.id}
                      style={[
                        styles.categoryOption,
                        isSelected ? styles.categoryOptionSelected : null,
                      ]}
                      onPress={() => setSelectedCategory(category)}
                      activeOpacity={0.8}
                    >
                      <View>
                        <Text>{category.name}</Text>
                        <Text style={styles.categoryOptionSubtext}>
                          ගෝලය: {formatCurrency(category.target)} | ඉතිරි: {formatCurrency(
                            Math.max(0, category.target - category.spent),
                          )}
                        </Text>
                      </View>
                      <Text style={styles.categoryOptionSubtext}>
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
              type === 'bank-deposit' ? styles.depositButton : null,
            ]}
            onPress={handleSubmit}
            activeOpacity={0.85}
          >
            <Text style={styles.submitButtonText}>සේව් කරන්න</Text>
          </TouchableOpacity>
        </View>
      </View>
    </Modal>
  );
};

export default TransactionModal;
