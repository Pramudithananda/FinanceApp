import React, { useState } from 'react';
import {
  View,
  Text,
  TextInput,
  TouchableOpacity,
  ScrollView,
  Modal,
} from 'react-native';
import { styles } from '../../styles';
import { formatCurrency } from '../../utils/formatters';

const TransactionModal = ({ 
  visible, 
  type, 
  bankBalance, 
  cashBalance, 
  categories, 
  onClose, 
  onSubmit 
}) => {
  const [amount, setAmount] = useState('');
  const [description, setDescription] = useState('');
  const [selectedCategory, setSelectedCategory] = useState(null);

  const handleSubmit = () => {
    const amountNum = parseFloat(amount);
    
    if (isNaN(amountNum) || amountNum <= 0) {
      alert('????? ?????? ?????? ?????');
      return;
    }
    
    if (type === 'income' && amountNum > bankBalance) {
      alert('????? ???? ?????????? ????. ???? ??? ????: ' + formatCurrency(bankBalance));
      return;
    }
    
    if (type === 'expense' && amountNum > cashBalance) {
      alert('????? ???? ?????????? ????. ???? ??? ????: ' + formatCurrency(cashBalance));
      return;
    }
    
    if (type === 'expense' && !selectedCategory) {
      alert('???????? ??????');
      return;
    }
    
    onSubmit({
      type,
      amount: amountNum,
      description,
      category: selectedCategory
    });
    
    // Reset form
    setAmount('');
    setDescription('');
    setSelectedCategory(null);
  };

  const getModalTitle = () => {
    switch (type) {
      case 'bank-deposit': return '??????? ??????? ?????';
      case 'income': return '????? ????????';
      case 'expense': return '?????? ?????';
      default: return '????????';
    }
  };

  const getInfoText = () => {
    switch (type) {
      case 'bank-deposit': 
        return '????? ???? ???? ????? ???? ????? ??????? ?????. Salary, bonus, ?? ????? ?????? ??? ?????? ?????.';
      case 'income': 
        return `????? ??????? cash ??? ????? transfer ?????. ???? ????? ????: ${formatCurrency(bankBalance)}`;
      case 'expense': 
        return `Cash ??????? ?????? ?????. ???? cash ????: ${formatCurrency(cashBalance)}`;
      default: return '';
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
          
          <Text style={styles.infoBox}>{getInfoText()}</Text>
          
          <Text style={styles.inputLabel}>???? (??)</Text>
          <TextInput
            style={styles.input}
            placeholder="???? ?????? ?????"
            keyboardType="numeric"
            value={amount}
            onChangeText={setAmount}
          />
          
          <Text style={styles.inputLabel}>??????? (????)</Text>
          <TextInput
            style={styles.input}
            placeholder="??????? ?????? ?????"
            value={description}
            onChangeText={setDescription}
          />
          
          {type === 'expense' && (
            <>
              <Text style={styles.inputLabel}>?????? ??????:</Text>
              <ScrollView style={styles.categorySelector}>
                {categories.map(category => (
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
                        ????: {formatCurrency(category.target)} | ?????: {formatCurrency(Math.max(0, category.target - category.spent))}
                      </Text>
                    </View>
                    <Text style={styles.categoryOptionSubtext}>
                      {formatCurrency(category.spent)} / {formatCurrency(category.target)}
                    </Text>
                  </TouchableOpacity>
                ))}
              </ScrollView>
            </>
          )}
          
          <TouchableOpacity 
            style={[
              styles.submitButton,
              type === 'bank-deposit' && styles.depositButton
            ]}
            onPress={handleSubmit}
          >
            <Text style={styles.submitButtonText}>???? ?????</Text>
          </TouchableOpacity>
        </View>
      </View>
    </Modal>
  );
};

export default TransactionModal;
