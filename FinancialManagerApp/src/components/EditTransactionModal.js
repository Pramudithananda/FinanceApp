import React, { useState, useEffect } from 'react';
import {
  View,
  Text,
  TextInput,
  TouchableOpacity,
  ScrollView,
  Modal,
  Alert,
} from 'react-native';
import { styles } from '../styles';
import { formatCurrency } from '../utils/formatters';

const EditTransactionModal = ({ 
  visible, 
  transaction,
  categories, 
  onClose, 
  onSubmit 
}) => {
  const [amount, setAmount] = useState('');
  const [description, setDescription] = useState('');
  const [selectedCategory, setSelectedCategory] = useState(null);
  const [date, setDate] = useState('');

  useEffect(() => {
    if (transaction) {
      setAmount(transaction.amount.toString());
      setDescription(transaction.description || '');
      setSelectedCategory(transaction.category || null);
      setDate(transaction.date || '');
    }
  }, [transaction, visible]);

  const handleSubmit = () => {
    const amountNum = parseFloat(amount);
    
    if (isNaN(amountNum) || amountNum <= 0) {
      Alert.alert('දෝෂය', 'වලංගු මුදලක් ඇතුළත් කරන්න');
      return;
    }
    
    if (transaction.type === 'expense' && !selectedCategory) {
      Alert.alert('දෝෂය', 'කාණ්ඩයක් තෝරන්න');
      return;
    }
    
    onSubmit({
      ...transaction,
      amount: amountNum,
      description,
      category: selectedCategory,
      date: date || transaction.date,
    });
  };

  if (!transaction) return null;

  const getModalTitle = () => {
    switch (transaction.type) {
      case 'bank-deposit': return 'බැංකු තැන්පත සංස්කරණය';
      case 'income': return 'මුදල් ලබාගැනීම සංස්කරණය';
      case 'expense': return 'වියදම සංස්කරණය';
      default: return 'ගනුදෙනුව සංස්කරණය';
    }
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
            <Text style={styles.modalTitle}>{getModalTitle()}</Text>
            <TouchableOpacity onPress={onClose}>
              <Text style={styles.closeBtn}>&times;</Text>
            </TouchableOpacity>
          </View>
          
          <Text style={styles.infoBox}>
            මෙම ගනුදෙනුව සංස්කරණය කරන්න. Balance ස්වයංක්‍රීයව යාවත්කාලීන වේ.
          </Text>
          
          <Text style={styles.inputLabel}>මුදල (රු)</Text>
          <TextInput
            style={styles.input}
            placeholder="මුදල ඇතුළත් කරන්න"
            keyboardType="numeric"
            value={amount}
            onChangeText={setAmount}
          />
          
          <Text style={styles.inputLabel}>විස්තරය</Text>
          <TextInput
            style={styles.input}
            placeholder="විස්තරය ඇතුළත් කරන්න"
            value={description}
            onChangeText={setDescription}
          />
          
          {transaction.type === 'expense' && (
            <>
              <Text style={styles.inputLabel}>කාණ්ඩය තෝරන්න:</Text>
              <ScrollView style={styles.categorySelector}>
                {categories.length === 0 ? (
                  <Text style={styles.emptyStateText}>
                    කාණ්ඩ නොමැත.
                  </Text>
                ) : (
                  categories.map(category => (
                    <TouchableOpacity
                      key={category.id}
                      style={[
                        styles.categoryOption,
                        selectedCategory?.id === category.id && styles.categoryOptionSelected
                      ]}
                      onPress={() => setSelectedCategory(category)}
                    >
                      <View>
                        <Text>{category.name}</Text>
                        <Text style={styles.categoryOptionSubtext}>
                          ඉලක්කය: {formatCurrency(category.target)}
                        </Text>
                      </View>
                    </TouchableOpacity>
                  ))
                )}
              </ScrollView>
            </>
          )}
          
          <View style={styles.modalButtonRow}>
            <TouchableOpacity 
              style={[styles.submitButton, styles.cancelButton]}
              onPress={onClose}
            >
              <Text style={styles.submitButtonText}>අවලංගු කරන්න</Text>
            </TouchableOpacity>
            
            <TouchableOpacity 
              style={styles.submitButton}
              onPress={handleSubmit}
            >
              <Text style={styles.submitButtonText}>යාවත්කාලීන කරන්න</Text>
            </TouchableOpacity>
          </View>
        </View>
      </View>
    </Modal>
  );
};

export default EditTransactionModal;
