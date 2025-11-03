import React, { useState, useEffect } from 'react';
import {
  View,
  Text,
  TextInput,
  TouchableOpacity,
  Modal,
} from 'react-native';
import { styles } from '../../styles';

const CategoryModal = ({ visible, category, categories, onClose, onSubmit }) => {
  const [name, setName] = useState('');
  const [target, setTarget] = useState('');
  const [unitPrice, setUnitPrice] = useState('');

  useEffect(() => {
    if (category) {
      setName(category.name || '');
      setTarget(category.target?.toString() || '');
      setUnitPrice(category.unitPrice?.toString() || '');
    } else {
      setName('');
      setTarget('');
      setUnitPrice('');
    }
  }, [category]);

  const handleSubmit = () => {
    if (!name.trim()) {
      alert('??????? ?? ?????? ?????');
      return;
    }

    const targetNum = parseFloat(target);
    const unitPriceNum = parseFloat(unitPrice);

    if (isNaN(targetNum) || targetNum <= 0) {
      alert('????? ?????? ?????? ?????');
      return;
    }

    if (isNaN(unitPriceNum) || unitPriceNum <= 0) {
      alert('????? ??? ????? ?????? ?????');
      return;
    }

    if (category) {
      const duplicateName = categories.find(
        c => c.id !== category.id && c.name.toLowerCase() === name.toLowerCase().trim()
      );
      if (duplicateName) {
        alert('??? ?? ???? ???????? ??????? ????');
        return;
      }
    } else {
      const duplicateName = categories.find(
        c => c.name.toLowerCase() === name.toLowerCase().trim()
      );
      if (duplicateName) {
        alert('??? ?? ???? ???????? ??????? ????');
        return;
      }
    }

    onSubmit({
      id: category?.id,
      name: name.trim(),
      target: targetNum,
      unitPrice: unitPriceNum
    });
  };

  return (
    <Modal
      animationType="slide"
      transparent={true}
      visible={visible}
      onRequestClose={onClose}
    >
      <View style={styles.modalOverlay}>
        <View style={styles.modalContent}>
          <View style={styles.modalHeader}>
            <Text style={styles.modalTitle}>
              {category ? '?????? ???????? ?????' : '?? ???????? ???? ?????'}
            </Text>
            <TouchableOpacity onPress={onClose}>
              <Text style={styles.closeBtn}>&times;</Text>
            </TouchableOpacity>
          </View>

          <Text style={styles.inputLabel}>??????? ??</Text>
          <TextInput
            style={styles.input}
            placeholder="??????? ?? ?????? ?????"
            value={name}
            onChangeText={setName}
          />

          <Text style={styles.inputLabel}>???? (??)</Text>
          <TextInput
            style={styles.input}
            placeholder="???? ?????? ?????"
            keyboardType="numeric"
            value={target}
            onChangeText={setTarget}
          />

          <Text style={styles.inputLabel}>??? ??? (??)</Text>
          <TextInput
            style={styles.input}
            placeholder="??? ??? ?????? ?????"
            keyboardType="numeric"
            value={unitPrice}
            onChangeText={setUnitPrice}
          />

          <TouchableOpacity 
            style={styles.submitButton}
            onPress={handleSubmit}
          >
            <Text style={styles.submitButtonText}>???? ?????</Text>
          </TouchableOpacity>
        </View>
      </View>
    </Modal>
  );
};

export default CategoryModal;
