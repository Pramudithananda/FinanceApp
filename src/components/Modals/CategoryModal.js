import React, { useEffect, useState } from 'react';
import { View, Text, TextInput, TouchableOpacity, Modal, Alert } from 'react-native';
import { styles } from '../../styles';
import { formatCurrency } from '../../utils/formatters';

const CategoryModal = ({ visible, category, categories, onClose, onSubmit }) => {
  const [name, setName] = useState('');
  const [target, setTarget] = useState('');
  const [unitPrice, setUnitPrice] = useState('');

  useEffect(() => {
    if (category && visible) {
      setName(category.name || '');
      setTarget(category.target ? String(category.target) : '');
      setUnitPrice(category.unitPrice ? String(category.unitPrice) : '');
    } else if (!visible) {
      setName('');
      setTarget('');
      setUnitPrice('');
    }
  }, [category, visible]);

  const handleSubmit = () => {
    const trimmedName = name.trim();
    const targetValue = target ? parseFloat(target) : 0;
    const unitValue = unitPrice ? parseFloat(unitPrice) : 0;

    if (!trimmedName) {
      Alert.alert('අවවාදයයි', 'කාණ්ඩයේ නම ඇතුළත් කරන්න.');
      return;
    }

    if (target && (Number.isNaN(targetValue) || targetValue < 0)) {
      Alert.alert('අවවාදයයි', 'වලංගු ඉලක්ක මුදලක් ඇතුළත් කරන්න.');
      return;
    }

    if (unitPrice && (Number.isNaN(unitValue) || unitValue < 0)) {
      Alert.alert('අවවාදයයි', 'වලංගු ඒකක මිලක් ඇතුළත් කරන්න.');
      return;
    }

    const duplicate = categories.some(
      (item) => item.name.trim() === trimmedName && item.id !== category?.id,
    );

    if (duplicate) {
      Alert.alert('අවවාදයයි', 'එම නමින් කාණ්ඩයක් දැනටමත් ඇත.');
      return;
    }

    onSubmit({
      id: category?.id,
      name: trimmedName,
      target: Number.isNaN(targetValue) ? 0 : targetValue,
      unitPrice: Number.isNaN(unitValue) ? 0 : unitValue,
    });
  };

  return (
    <Modal transparent animationType="slide" visible={visible} onRequestClose={onClose}>
      <View style={styles.modalOverlay}>
        <View style={styles.modalContent}>
          <View style={styles.modalHeader}>
            <Text style={styles.modalTitle}>
              {category ? 'කාණ්ඩය සංස්කරණය' : 'නව කාණ්ඩයක් එකතු කරන්න'}
            </Text>
            <TouchableOpacity onPress={onClose}>
              <Text style={styles.closeBtn}>×</Text>
            </TouchableOpacity>
          </View>

          <Text style={styles.inputLabel}>කාණ්ඩයේ නම</Text>
          <TextInput
            style={styles.input}
            placeholder="උදා: කෑම, ප්‍රවාහන"
            placeholderTextColor="#9ca3af"
            value={name}
            onChangeText={setName}
          />

          <Text style={styles.inputLabel}>මාසික ඉලක්ක මුදල (අමතර)</Text>
          <TextInput
            style={styles.input}
            placeholder="රු 0.00"
            placeholderTextColor="#9ca3af"
            keyboardType="numeric"
            value={target}
            onChangeText={setTarget}
          />
          {target?.length > 0 && (
            <Text style={styles.categoryOptionDetails}>
              දැනට ඇතුළත් කළ ඉලක්කය: {formatCurrency(target)}
            </Text>
          )}

          <Text style={[styles.inputLabel, { marginTop: 12 }]}>ඒකක මිල (අමතර)</Text>
          <TextInput
            style={styles.input}
            placeholder="උදා: රු 150.00"
            placeholderTextColor="#9ca3af"
            keyboardType="numeric"
            value={unitPrice}
            onChangeText={setUnitPrice}
          />

          <TouchableOpacity style={styles.submitButton} onPress={handleSubmit}>
            <Text style={styles.submitButtonText}>{category ? 'යාවත්කාලීන කරන්න' : 'එකතු කරන්න'}</Text>
          </TouchableOpacity>
        </View>
      </View>
    </Modal>
  );
};

export default CategoryModal;
