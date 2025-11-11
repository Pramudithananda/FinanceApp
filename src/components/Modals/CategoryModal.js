import React, { useEffect, useState } from 'react';
import { View, Text, TextInput, TouchableOpacity, Modal, Alert } from 'react-native';
import { styles } from '../../styles';

const CategoryModal = ({ visible, category, onClose, onSubmit }) => {
  const [name, setName] = useState('');
  const [target, setTarget] = useState('');
  const [unitPrice, setUnitPrice] = useState('');

  useEffect(() => {
    if (visible) {
      setName(category?.name ?? '');
      setTarget(category?.target ? String(category.target) : '');
      setUnitPrice(category?.unitPrice ? String(category.unitPrice) : '');
    } else {
      setName('');
      setTarget('');
      setUnitPrice('');
    }
  }, [visible, category]);

  const handleSubmit = () => {
    if (!name.trim()) {
      Alert.alert('දෝෂය', 'කාණ්ඩ නම ඇතුළත් කරන්න');
      return;
    }

    const targetNumber = parseFloat(target);
    const unitPriceNumber = parseFloat(unitPrice || '0');

    if (Number.isNaN(targetNumber) || targetNumber <= 0) {
      Alert.alert('දෝෂය', 'වලංගු ගෝලයක් (Target) ඇතුළත් කරන්න');
      return;
    }

    if (unitPrice && (Number.isNaN(unitPriceNumber) || unitPriceNumber <= 0)) {
      Alert.alert('දෝෂය', 'වලංගු ඒකක මිලක් ඇතුළත් කරන්න');
      return;
    }

    onSubmit({
      id: category?.id,
      name: name.trim(),
      target: targetNumber,
      unitPrice: unitPrice ? unitPriceNumber : 0,
    });
  };

  return (
    <Modal animationType="slide" transparent visible={visible} onRequestClose={onClose}>
      <View style={styles.modalOverlay}>
        <View style={styles.modalContent}>
          <View style={styles.modalHeader}>
            <Text style={styles.modalTitle}>
              {category ? 'කාණ්ඩය සංස්කරණය කරන්න' : 'නව කාණ්ඩය'}
            </Text>
            <TouchableOpacity onPress={onClose} accessibilityRole="button">
              <Text style={styles.closeBtn}>×</Text>
            </TouchableOpacity>
          </View>

          <Text style={styles.inputLabel}>කාණ්ඩ නම</Text>
          <TextInput
            style={styles.input}
            placeholder="උදාහරණය: කෑම, ගමන්"
            value={name}
            onChangeText={setName}
          />

          <Text style={styles.inputLabel}>මාසික ගෝලය (රු)</Text>
          <TextInput
            style={styles.input}
            placeholder="උදාහරණය: 15000"
            keyboardType="numeric"
            value={target}
            onChangeText={setTarget}
          />

          <Text style={styles.inputLabel}>ඒකක මිල (අමතර)</Text>
          <TextInput
            style={styles.input}
            placeholder="උදාහරණය: 200"
            keyboardType="numeric"
            value={unitPrice}
            onChangeText={setUnitPrice}
          />

          <TouchableOpacity style={styles.submitButton} onPress={handleSubmit} activeOpacity={0.85}>
            <Text style={styles.submitButtonText}>
              {category ? 'Update කරන්න' : 'එකතු කරන්න'}
            </Text>
          </TouchableOpacity>
        </View>
      </View>
    </Modal>
  );
};

export default CategoryModal;
