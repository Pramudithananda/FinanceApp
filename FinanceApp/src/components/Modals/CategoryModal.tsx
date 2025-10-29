import React, { useState, useEffect } from 'react';
import {
  View,
  Text,
  TextInput,
  TouchableOpacity,
  Modal,
  Alert,
} from 'react-native';
import { styles } from '../../styles';

interface Category {
  id: number;
  name: string;
  balance: number;
  target: number;
  spent: number;
  unitPrice: number;
}

interface CategoryModalProps {
  visible: boolean;
  category?: Category | null;
  categories: Category[];
  onClose: () => void;
  onSubmit: (data: any) => void;
}

const CategoryModal: React.FC<CategoryModalProps> = ({ 
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
  }, [category]);

  const handleSubmit = () => {
    if (!name.trim()) {
      Alert.alert('දෝෂය', 'කාණ්ඩයේ නම ඇතුළත් කරන්න');
      return;
    }
    
    const targetNum = parseFloat(target);
    const unitPriceNum = parseFloat(unitPrice);
    
    if (isNaN(targetNum) || targetNum <= 0) {
      Alert.alert('දෝෂය', 'වලංගු ගෝලයක් ඇතුළත් කරන්න');
      return;
    }
    
    if (isNaN(unitPriceNum) || unitPriceNum <= 0) {
      Alert.alert('දෝෂය', 'වලංගු ඒකක මිලක් ඇතුළත් කරන්න');
      return;
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
              {category ? 'කාණ්ඩය සංස්කරණය කරන්න' : 'නව කාණ්ඩයක් එකතු කරන්න'}
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
            placeholder="ගෝලය ඇතුළත් කරන්න"
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