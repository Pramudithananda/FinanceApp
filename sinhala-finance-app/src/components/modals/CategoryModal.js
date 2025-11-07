import React, { useEffect, useState } from 'react';
import {
  Modal,
  View,
  Text,
  TouchableOpacity,
  TextInput,
  KeyboardAvoidingView,
  Platform,
} from 'react-native';
import { styles } from '../../theme/styles';
import { categoryColors } from '../../theme/colors';

const CategoryModal = ({ visible, category, onClose, onSubmit }) => {
  const [name, setName] = useState('');
  const [target, setTarget] = useState('');
  const [unitPrice, setUnitPrice] = useState('');
  const [color, setColor] = useState(categoryColors[0]);

  useEffect(() => {
    if (visible) {
      setName(category?.name ?? '');
      setTarget(category?.target ? String(category.target) : '');
      setUnitPrice(category?.unitPrice ? String(category.unitPrice) : '');
      setColor(category?.color ?? categoryColors[0]);
    } else {
      setName('');
      setTarget('');
      setUnitPrice('');
      setColor(categoryColors[0]);
    }
  }, [visible, category]);

  const handleSave = () => {
    const success = onSubmit({
      id: category?.id,
      name,
      target,
      unitPrice,
      color,
    });

    if (success) {
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
            <Text style={styles.modalTitle}>
              {category ? '✏️ කාණ්ඩය යාවත්කාලීන කරන්න' : '➕ නව කාණ්ඩයක්'}
            </Text>
            <TouchableOpacity style={styles.modalClose} onPress={onClose}>
              <Text style={styles.modalCloseText}>✖️</Text>
            </TouchableOpacity>
          </View>

          <Text style={styles.modalSubtitle}>
            නව කාණ්ඩයක් එකතු කිරීමෙන් ඔබගේ වියදම් ආරක්ෂා කිරීමට සහිතව ප්‍රවේශ වන්න.
          </Text>

          <Text style={styles.label}>කාණ්ඩ නම</Text>
          <TextInput
            style={styles.input}
            placeholder="උදාහරණය: බිල්පත්, සන්නිවේදන"
            value={name}
            onChangeText={setName}
          />

          <View style={styles.inputRow}>
            <View style={styles.inputSmall}>
              <Text style={styles.label}>මාසික ඉලක්කය (රු)</Text>
              <TextInput
                style={styles.input}
                keyboardType="decimal-pad"
                placeholder="0.00"
                value={target}
                onChangeText={setTarget}
              />
            </View>
            <View style={styles.inputSmall}>
              <Text style={styles.label}>ඒකක මිල (රු)</Text>
              <TextInput
                style={styles.input}
                keyboardType="decimal-pad"
                placeholder="0.00"
                value={unitPrice}
                onChangeText={setUnitPrice}
              />
            </View>
          </View>

          <Text style={styles.label}>වර්ණය</Text>
          <View style={styles.chipSelector}>
            {categoryColors.map((swatch) => (
              <TouchableOpacity
                key={swatch}
                style={[
                  styles.colorSwatch,
                  { backgroundColor: swatch },
                  color === swatch && styles.colorSwatchActive,
                ]}
                onPress={() => setColor(swatch)}
              />
            ))}
          </View>

          <View style={styles.modalFooter}>
            <TouchableOpacity style={styles.secondaryButton} onPress={onClose}>
              <Text style={styles.secondaryButtonText}>අවලංගු කරන්න</Text>
            </TouchableOpacity>
            <TouchableOpacity style={styles.primaryButton} onPress={handleSave}>
              <Text style={styles.primaryButtonText}>
                {category ? 'යාවත්කාලීන කරන්න' : 'කාර්යය සුරකින්න'}
              </Text>
            </TouchableOpacity>
          </View>
        </View>
      </KeyboardAvoidingView>
    </Modal>
  );
};

export default CategoryModal;
