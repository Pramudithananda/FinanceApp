import React, { useState, useEffect } from 'react';
import {
  View,
  Text,
  TextInput,
  TouchableOpacity,
  Modal,
} from 'react-native';
import { styles } from '../../styles';

const CategoryModal = ({ 
  visible, 
  category, 
  categories, 
  onClose, 
  onSubmit 
}) => {
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
    const targetNum = parseFloat(target);
    const unitPriceNum = parseFloat(unitPrice);
    
    if (!name.trim()) {
      alert('කාණ්ඩයේ නම ඇතුළත් කරන්න');
      return;
    }
    
    if (isNaN(targetNum) || targetNum <= 0) {
      alert('වලංගු ගෝලයක් ඇතුළත් කරන්න');
      return;
    }
    
    if (isNaN(unitPriceNum) || unitPriceNum <= 0) {
      alert('වලංගු ඒකක මිලක් ඇතුළත් කරන්න');
      return;
    }

    // Check for duplicate names (excluding current category if editing)
    const existingCategory = categories.find(cat => 
      cat.name.toLowerCase() === name.toLowerCase() && 
      (!category || cat.id !== category.id)
    );
    
    if (existingCategory) {
      alert('මෙම නම සහිත කාණ්ඩයක් දැනටමත් පවතී');
      return;
    }
    
    onSubmit({
      id: category ? category.id : null,
      name: name.trim(),
      target: targetNum,
      unitPrice: unitPriceNum
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
              {category ? 'කාණ්ඩය සංස්කරණය කරන්න' : 'නව කාණ්ඩය එකතු කරන්න'}
            </Text>
            <TouchableOpacity onPress={onClose}>
              <Text style={styles.closeBtn}>&times;</Text>
            </TouchableOpacity>
          </View>
          
          <Text style={styles.inputLabel}>කාණ්ඩයේ නම</Text>
          <TextInput
            style={styles.input}
            placeholder="කාණ්ඩයේ නම ඇතුළත් කරන්න"
            value={name}
            onChangeText={setName}
          />
          
          <Text style={styles.inputLabel}>ගෝලය (රු)</Text>
          <TextInput
            style={styles.input}
            placeholder="මාසික ගෝලය ඇතුළත් කරන්න"
            keyboardType="numeric"
            value={target}
            onChangeText={setTarget}
          />
          
          <Text style={styles.inputLabel}>ඒකක මිල (රු)</Text>
          <TextInput
            style={styles.input}
            placeholder="ඒකක මිල ඇතුළත් කරන්න"
            keyboardType="numeric"
            value={unitPrice}
            onChangeText={setUnitPrice}
          />
          
          <TouchableOpacity 
            style={styles.submitButton}
            onPress={handleSubmit}
          >
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