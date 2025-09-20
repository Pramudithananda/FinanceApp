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
      alert('වලංගු මුදලක් ඇතුළත් කරන්න');
      return;
    }
    
    if (type === 'income' && amountNum > bankBalance) {
      alert('බැංකු ශේෂය ප්‍රමාණවත් නොවේ. දැනට ඇති ශේෂය: ' + formatCurrency(bankBalance));
      return;
    }
    
    if (type === 'expense' && amountNum > cashBalance) {
      alert('මුදල් ශේෂය ප්‍රමාණවත් නොවේ. දැනට ඇති ශේෂය: ' + formatCurrency(cashBalance));
      return;
    }
    
    if (type === 'expense' && !selectedCategory) {
      alert('කාණ්ඩයක් තෝරන්න');
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
      case 'bank-deposit': return 'බැංකුවට තැන්පත් කරන්න';
      case 'income': return 'මුදල් ලබාගැනීම';
      case 'expense': return 'වියදම් කරන්න';
      default: return 'ගනුදෙනුව';
    }
  };

  const getInfoText = () => {
    switch (type) {
      case 'bank-deposit': 
        return 'බැංකු ශේෂය වැඩි කරන්න සඳහා මුදල් තැන්පත් කරන්න. Salary, bonus, හෝ වෙනත් ආදායම් වලට භාවිතා කරන්න.';
      case 'income': 
        return `බැංකු ශේෂයෙන් cash වලට මුදල් transfer කරන්න. දැනට බැංකු ශේෂය: ${formatCurrency(bankBalance)}`;
      case 'expense': 
        return `Cash ශේෂයෙන් වියදම් කරන්න. දැනට cash ශේෂය: ${formatCurrency(cashBalance)}`;
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
          
          <Text style={styles.inputLabel}>මුදල (රු)</Text>
          <TextInput
            style={styles.input}
            placeholder="මුදල ඇතුළත් කරන්න"
            keyboardType="numeric"
            value={amount}
            onChangeText={setAmount}
          />
          
          <Text style={styles.inputLabel}>විස්තරය (අමතර)</Text>
          <TextInput
            style={styles.input}
            placeholder="විස්තරය ඇතුළත් කරන්න"
            value={description}
            onChangeText={setDescription}
          />
          
          {type === 'expense' && (
            <>
              <Text style={styles.inputLabel}>කාණ්ඩය තෝරන්න:</Text>
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
                        ගෝලය: {formatCurrency(category.target)} | ඉතිරි: {formatCurrency(Math.max(0, category.target - category.spent))}
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
            <Text style={styles.submitButtonText}>සේව් කරන්න</Text>
          </TouchableOpacity>
        </View>
      </View>
    </Modal>
  );
};

export default TransactionModal;