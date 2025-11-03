import React, { useEffect, useState } from 'react';
import {
  View,
  Text,
  TextInput,
  TouchableOpacity,
  Modal,
  Alert,
} from 'react-native';
import { styles } from '../../styles';
import { formatCurrency } from '../../utils/formatters';

const CategoryModal = ({ visible, category, categories, onClose, onSubmit }) => {
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
      Alert.alert('????????', '??????? ?? ?????? ?????');
      return;
    }

    const targetValue = parseFloat(target);
    const unitPriceValue = unitPrice ? parseFloat(unitPrice) : 0;

    if (Number.isNaN(targetValue) || targetValue <= 0) {
      Alert.alert('????????', '????? monthly ?????? (target) ?????? ?????');
      return;
    }

    if (unitPrice && (Number.isNaN(unitPriceValue) || unitPriceValue < 0)) {
      Alert.alert('????????', '????? ??? ????? ?????? ?????');
      return;
    }

    const duplicate = categories.find(
      (cat) => cat.name.trim().toLowerCase() === name.trim().toLowerCase() && cat.id !== category?.id,
    );

    if (duplicate) {
      Alert.alert('????????', '??? ????? ????? ???????? ????. ????? ???? ?????? ?????.');
      return;
    }

    onSubmit({
      id: category?.id,
      name: name.trim(),
      target: targetValue,
      unitPrice: unitPriceValue,
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
            <Text style={styles.modalTitle}>
              {category ? '?????? ????????' : '?? ???????? ???? ?????'}
            </Text>
            <TouchableOpacity onPress={onClose}>
              <Text style={styles.closeBtn}>&times;</Text>
            </TouchableOpacity>
          </View>

          <Text style={styles.infoBox}>
            ????? ???? ??? ?????? ???????. ??? ??? ????????? ??? ?tem ??? track ?????.
          </Text>

          <Text style={styles.inputLabel}>??????? ??</Text>
          <TextInput
            style={styles.input}
            placeholder="???????: ???, ????????"
            value={name}
            onChangeText={setName}
          />

          <Text style={styles.inputLabel}>????? ???? (??)</Text>
          <TextInput
            style={styles.input}
            placeholder="???????: 15000"
            keyboardType="numeric"
            value={target}
            onChangeText={setTarget}
          />

          <Text style={styles.inputLabel}>??? ??? (????)</Text>
          <TextInput
            style={styles.input}
            placeholder="???????: 250"
            keyboardType="numeric"
            value={unitPrice}
            onChangeText={setUnitPrice}
          />

          {target && (
            <View style={styles.detailsSection}>
              <View style={styles.detailsRow}>
                <Text style={styles.detailsLabel}>????? ????</Text>
                <Text style={styles.detailsValue}>{formatCurrency(parseFloat(target || '0'))}</Text>
              </View>
              {unitPrice && (
                <View style={styles.detailsRow}>
                  <Text style={styles.detailsLabel}>??? ???</Text>
                  <Text style={styles.detailsValue}>{formatCurrency(parseFloat(unitPrice || '0'))}</Text>
                </View>
              )}
            </View>
          )}

          <TouchableOpacity style={styles.submitButton} onPress={handleSubmit} activeOpacity={0.85}>
            <Text style={styles.submitButtonText}>{category ? '?????????? ?????' : '???? ?????'}</Text>
          </TouchableOpacity>
        </View>
      </View>
    </Modal>
  );
};

export default CategoryModal;
