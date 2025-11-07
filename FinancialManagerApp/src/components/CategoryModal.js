import React, { useState, useEffect } from 'react';
import {
  View,
  Text,
  TextInput,
  TouchableOpacity,
  Modal,
  Alert,
} from 'react-native';
import { styles } from '../styles';

const CategoryModal = ({ visible, category, categories, onClose, onSubmit }) => {
  const [name, setName] = useState('');
  const [target, setTarget] = useState('');
  const [unitPrice, setUnitPrice] = useState('');

  useEffect(() => {
    if (category) {
      setName(category.name);
      setTarget(category.target.toString());
      setUnitPrice(category.unitPrice.toString());
    } else {
      setName('');
      setTarget('');
      setUnitPrice('');
    }
  }, [category, visible]);

  const handleSubmit = () => {
    if (!name.trim()) {
      Alert.alert('දෝෂය', 'කාණ්ඩයේ නම ඇතුළත් කරන්න');
      return;
    }

    const targetNum = parseFloat(target);
    const unitPriceNum = parseFloat(unitPrice);

    if (isNaN(targetNum) || targetNum <= 0) {
      Alert.alert('දෝෂය', 'වලංගු ඉලක්කයක් ඇතුළත් කරන්න');
      return;
    }

    if (isNaN(unitPriceNum) || unitPriceNum < 0) {
      Alert.alert('දෝෂය', 'වලංගු එකක මිලක් ඇතුළත් කරන්න');
      return;
    }

    // Check for duplicate name (excluding current category when editing)
    const isDuplicate = categories.some(cat => 
      cat.name.toLowerCase() === name.trim().toLowerCase() && 
      cat.id !== category?.id
    );

    if (isDuplicate) {
      Alert.alert('දෝෂය', 'මෙම නම සහිත කාණ්ඩයක් දැනටමත් පවතී');
      return;
    }

    onSubmit({
      id: category?.id,
      name: name.trim(),
      target: targetNum,
      unitPrice: unitPriceNum,
    });

    // Reset form
    setName('');
    setTarget('');
    setUnitPrice('');
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
              {category ? 'කාණ්ඩය සංස්කරණය කරන්න' : 'නව කාණ්ඩයක් එකතු කරන්න'}
            </Text>
            <TouchableOpacity onPress={onClose}>
              <Text style={styles.closeBtn}>&times;</Text>
            </TouchableOpacity>
          </View>

          <Text style={styles.infoBox}>
            වියදම් කාණ්ඩයක් නිර්මාණය කරන්න. උදා: කෑම, ප්‍රවාහන, විනෝදාංශ
          </Text>

          <Text style={styles.inputLabel}>කාණ්ඩයේ නම</Text>
          <TextInput
            style={styles.input}
            placeholder="උදා: කෑම"
            value={name}
            onChangeText={setName}
          />

          <Text style={styles.inputLabel}>මාසික ඉලක්කය (රු)</Text>
          <TextInput
            style={styles.input}
            placeholder="උදා: 15000"
            keyboardType="numeric"
            value={target}
            onChangeText={setTarget}
          />

          <Text style={styles.inputLabel}>එකක මිල (රු) - අමතර</Text>
          <TextInput
            style={styles.input}
            placeholder="උදා: 200"
            keyboardType="numeric"
            value={unitPrice}
            onChangeText={setUnitPrice}
          />

          <TouchableOpacity style={styles.submitButton} onPress={handleSubmit}>
            <Text style={styles.submitButtonText}>
              {category ? 'යාවත්කාලීන කරන්න' : 'එකතු කරන්න'}
            </Text>
          </TouchableOpacity>
        </View>
      </View>
    </Modal>
  );
};

export default CategoryModal;
