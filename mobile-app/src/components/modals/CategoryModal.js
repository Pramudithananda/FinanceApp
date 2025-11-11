import React, { useEffect, useState } from 'react';
import { View, Text, TextInput, TouchableOpacity, Modal, Alert } from 'react-native';
import { styles } from '../../styles';

const emptyForm = {
  name: '',
  target: '',
  unitPrice: '',
};

const CategoryModal = ({ visible, category, onClose, onSubmit }) => {
  const [form, setForm] = useState(emptyForm);

  useEffect(() => {
    if (visible && category) {
      setForm({
        name: category.name,
        target: String(category.target),
        unitPrice: String(category.unitPrice || 0),
      });
    } else if (visible) {
      setForm(emptyForm);
    }
  }, [visible, category]);

  const handleChange = (key, value) => {
    setForm((prev) => ({ ...prev, [key]: value }));
  };

  const handleSubmit = () => {
    if (!form.name.trim()) {
      Alert.alert('අවවාදයයි', 'කාණ්ඩ නාමය ඇතුළත් කරන්න.');
      return;
    }

    const parsedTarget = parseFloat(form.target);
    if (!Number.isFinite(parsedTarget) || parsedTarget <= 0) {
      Alert.alert('අවවාදයයි', 'වලංගු ගෝලයක් ඇතුළත් කරන්න.');
      return;
    }

    const parsedUnitPrice = parseFloat(form.unitPrice || '0');

    onSubmit({
      id: category?.id,
      name: form.name.trim(),
      target: parsedTarget,
      unitPrice: Number.isFinite(parsedUnitPrice) ? parsedUnitPrice : 0,
    });
  };

  return (
    <Modal visible={visible} transparent animationType="slide" onRequestClose={onClose}>
      <View style={styles.modalOverlay}>
        <View style={styles.modalContent}>
          <View style={styles.modalHeader}>
            <Text style={styles.modalTitle}>
              {category ? 'කාණ්ඩය යාවත්කාලීන කරන්න' : 'නව කාණ්ඩයක් එකතු කරන්න'}
            </Text>
            <TouchableOpacity onPress={onClose}>
              <Text style={styles.closeBtn}>×</Text>
            </TouchableOpacity>
          </View>

          <View style={styles.badge}>
            <Text style={styles.badgeText}>
              වියදම් පාලනයට ගෝල සහ ඒකක මිල සකස් කරන්න
            </Text>
          </View>

          <Text style={styles.inputLabel}>කාණ්ඩ නාමය</Text>
          <TextInput
            style={styles.input}
            placeholder="උදා: ආහාර, ගමන්, බිල්..."
            value={form.name}
            onChangeText={(value) => handleChange('name', value)}
          />

          <Text style={styles.inputLabel}>ගෝලය (රු)</Text>
          <TextInput
            style={styles.input}
            keyboardType="numeric"
            placeholder="උදා: 15000"
            value={form.target}
            onChangeText={(value) => handleChange('target', value)}
          />

          <Text style={styles.inputLabel}>ඒකක මිල (විකල්ප)</Text>
          <TextInput
            style={styles.input}
            keyboardType="numeric"
            placeholder="උදා: 120"
            value={form.unitPrice}
            onChangeText={(value) => handleChange('unitPrice', value)}
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
