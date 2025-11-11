import React, { useState } from 'react';
import {
  View,
  Text,
  ScrollView,
  StyleSheet,
  TouchableOpacity,
  Modal,
  TextInput,
  Alert,
} from 'react-native';
import { useApp } from '../context/AppContext';
import { formatCurrency } from '../utils/formatters';
import Icon from 'react-native-vector-icons/MaterialCommunityIcons';

export default function CashScreen() {
  const { accounts, addAccount, updateAccount, deleteAccount } = useApp();
  const [modalVisible, setModalVisible] = useState(false);
  const [transactionModalVisible, setTransactionModalVisible] = useState(false);
  const [selectedAccount, setSelectedAccount] = useState(null);
  const [formData, setFormData] = useState({
    name: '',
    balance: '0',
  });
  const [transactionAmount, setTransactionAmount] = useState('');
  const [transactionType, setTransactionType] = useState('add'); // 'add' or 'remove'

  const cashAccounts = accounts.filter(a => a.type === 'cash');

  const handleOpenModal = () => {
    setFormData({ name: '', balance: '0' });
    setModalVisible(true);
  };

  const handleSave = () => {
    if (!formData.name) {
      Alert.alert('දෝෂය', 'කරුණාකර නමක් ඇතුළත් කරන්න');
      return;
    }

    const balance = parseFloat(formData.balance) || 0;

    addAccount({
      name: formData.name,
      balance: balance,
      type: 'cash',
      number: `CASH-${Date.now()}`,
    });

    Alert.alert('සාර්ථකයි', 'නව මුදල් ගිණුම එකතු කරන ලදී');
    setModalVisible(false);
    setFormData({ name: '', balance: '0' });
  };

  const handleTransaction = (account, type) => {
    setSelectedAccount(account);
    setTransactionType(type);
    setTransactionAmount('');
    setTransactionModalVisible(true);
  };

  const handleTransactionSubmit = () => {
    const amount = parseFloat(transactionAmount);
    if (isNaN(amount) || amount <= 0) {
      Alert.alert('දෝෂය', 'වලංගු මුදලක් ඇතුළත් කරන්න');
      return;
    }

    const newBalance = transactionType === 'add' 
      ? selectedAccount.balance + amount
      : selectedAccount.balance - amount;

    if (newBalance < 0) {
      Alert.alert('දෝෂය', 'මුදල් ප්‍රමාණවත් නොවේ');
      return;
    }

    updateAccount(selectedAccount.id, { balance: newBalance });
    Alert.alert('සාර්ථකයි', 'ගනුදෙනුව සාර්ථකව සටහන් කරන ලදී');
    setTransactionModalVisible(false);
  };

  const handleDelete = (account) => {
    Alert.alert(
      'ගිණුම මකන්න',
      `"${account.name}" ගිණුම මකා දැමීමට අවශ්‍යද?`,
      [
        { text: 'අවලංගු කරන්න', style: 'cancel' },
        {
          text: 'මකන්න',
          style: 'destructive',
          onPress: () => {
            deleteAccount(account.id);
            Alert.alert('සාර්ථකයි', 'ගිණුම මකා දමන ලදී');
          },
        },
      ]
    );
  };

  return (
    <View style={styles.container}>
      <ScrollView style={styles.content}>
        <View style={styles.header}>
          <Text style={styles.headerTitle}>මුදල් ගිණුම්</Text>
          <TouchableOpacity
            style={styles.addButton}
            onPress={handleOpenModal}
          >
            <Icon name="plus-circle" size={32} color="#4F46E5" />
          </TouchableOpacity>
        </View>

        {cashAccounts.length === 0 ? (
          <View style={styles.emptyState}>
            <Icon name="cash-multiple" size={64} color="#9CA3AF" />
            <Text style={styles.emptyText}>මුදල් ගිණුම් නොමැත</Text>
            <Text style={styles.emptySubtext}>
              "+ " බොත්තම ඔබා නව ගිණුමක් එකතු කරන්න
            </Text>
          </View>
        ) : (
          cashAccounts.map((account) => (
            <View key={account.id} style={styles.accountCard}>
              <View style={styles.accountInfo}>
                <Text style={styles.accountName}>{account.name}</Text>
                <Text style={styles.accountBalance}>{formatCurrency(account.balance)}</Text>
              </View>
              
              <View style={styles.accountActions}>
                <TouchableOpacity
                  style={[styles.actionButton, { backgroundColor: '#10B981' }]}
                  onPress={() => handleTransaction(account, 'add')}
                >
                  <Icon name="plus" size={20} color="#FFFFFF" />
                  <Text style={styles.actionButtonText}>එකතු කරන්න</Text>
                </TouchableOpacity>
                
                <TouchableOpacity
                  style={[styles.actionButton, { backgroundColor: '#EF4444' }]}
                  onPress={() => handleTransaction(account, 'remove')}
                >
                  <Icon name="minus" size={20} color="#FFFFFF" />
                  <Text style={styles.actionButtonText}>අඩු කරන්න</Text>
                </TouchableOpacity>
                
                <TouchableOpacity
                  style={[styles.actionButton, { backgroundColor: '#6B7280' }]}
                  onPress={() => handleDelete(account)}
                >
                  <Icon name="delete" size={20} color="#FFFFFF" />
                </TouchableOpacity>
              </View>
            </View>
          ))
        )}
      </ScrollView>

      {/* Add Account Modal */}
      <Modal
        animationType="slide"
        transparent={true}
        visible={modalVisible}
        onRequestClose={() => setModalVisible(false)}
      >
        <View style={styles.modalOverlay}>
          <View style={styles.modalContent}>
            <View style={styles.modalHeader}>
              <Text style={styles.modalTitle}>නව මුදල් ගිණුමක්</Text>
              <TouchableOpacity onPress={() => setModalVisible(false)}>
                <Icon name="close" size={28} color="#6B7280" />
              </TouchableOpacity>
            </View>

            <Text style={styles.label}>ගිණුමේ නම</Text>
            <TextInput
              style={styles.input}
              placeholder="උදා: මුදල්"
              value={formData.name}
              onChangeText={(text) => setFormData({ ...formData, name: text })}
            />

            <Text style={styles.label}>ආරම්භක මුදල (රු)</Text>
            <TextInput
              style={styles.input}
              placeholder="0"
              value={formData.balance}
              onChangeText={(text) => setFormData({ ...formData, balance: text })}
              keyboardType="numeric"
            />

            <TouchableOpacity style={styles.saveButton} onPress={handleSave}>
              <Text style={styles.saveButtonText}>සුරකින්න</Text>
            </TouchableOpacity>
          </View>
        </View>
      </Modal>

      {/* Transaction Modal */}
      <Modal
        animationType="slide"
        transparent={true}
        visible={transactionModalVisible}
        onRequestClose={() => setTransactionModalVisible(false)}
      >
        <View style={styles.modalOverlay}>
          <View style={styles.modalContent}>
            <View style={styles.modalHeader}>
              <Text style={styles.modalTitle}>
                {transactionType === 'add' ? 'මුදල් එකතු කරන්න' : 'මුදල් අඩු කරන්න'}
              </Text>
              <TouchableOpacity onPress={() => setTransactionModalVisible(false)}>
                <Icon name="close" size={28} color="#6B7280" />
              </TouchableOpacity>
            </View>

            {selectedAccount && (
              <>
                <View style={styles.infoBox}>
                  <Text style={styles.infoBoxTitle}>{selectedAccount.name}</Text>
                  <Text style={styles.infoBoxBalance}>
                    දැනට ඇති මුදල: {formatCurrency(selectedAccount.balance)}
                  </Text>
                </View>

                <Text style={styles.label}>මුදල (රු)</Text>
                <TextInput
                  style={styles.input}
                  placeholder="මුදල ඇතුළත් කරන්න"
                  value={transactionAmount}
                  onChangeText={setTransactionAmount}
                  keyboardType="numeric"
                />

                <TouchableOpacity 
                  style={[
                    styles.saveButton,
                    { backgroundColor: transactionType === 'add' ? '#10B981' : '#EF4444' }
                  ]} 
                  onPress={handleTransactionSubmit}
                >
                  <Text style={styles.saveButtonText}>
                    {transactionType === 'add' ? 'එකතු කරන්න' : 'අඩු කරන්න'}
                  </Text>
                </TouchableOpacity>
              </>
            )}
          </View>
        </View>
      </Modal>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#F3F4F6',
  },
  content: {
    flex: 1,
  },
  header: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    padding: 16,
  },
  headerTitle: {
    fontSize: 24,
    fontWeight: 'bold',
    color: '#1F2937',
  },
  addButton: {
    padding: 4,
  },
  emptyState: {
    alignItems: 'center',
    justifyContent: 'center',
    paddingVertical: 60,
  },
  emptyText: {
    fontSize: 18,
    fontWeight: '600',
    color: '#6B7280',
    marginTop: 16,
  },
  emptySubtext: {
    fontSize: 14,
    color: '#9CA3AF',
    marginTop: 8,
  },
  accountCard: {
    marginHorizontal: 16,
    marginBottom: 16,
    padding: 20,
    borderRadius: 16,
    backgroundColor: '#8B5CF6',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 8,
    elevation: 5,
  },
  accountInfo: {
    marginBottom: 16,
  },
  accountName: {
    fontSize: 20,
    fontWeight: 'bold',
    color: '#FFFFFF',
    marginBottom: 8,
  },
  accountBalance: {
    fontSize: 32,
    fontWeight: 'bold',
    color: '#FFFFFF',
  },
  accountActions: {
    flexDirection: 'row',
    gap: 8,
  },
  actionButton: {
    flex: 1,
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    padding: 12,
    borderRadius: 8,
    gap: 4,
  },
  actionButtonText: {
    color: '#FFFFFF',
    fontSize: 12,
    fontWeight: '600',
  },
  modalOverlay: {
    flex: 1,
    backgroundColor: 'rgba(0, 0, 0, 0.5)',
    justifyContent: 'center',
    alignItems: 'center',
  },
  modalContent: {
    backgroundColor: '#FFFFFF',
    borderRadius: 20,
    padding: 24,
    width: '90%',
    maxWidth: 400,
  },
  modalHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: 24,
  },
  modalTitle: {
    fontSize: 22,
    fontWeight: 'bold',
    color: '#1F2937',
  },
  label: {
    fontSize: 14,
    fontWeight: '600',
    color: '#374151',
    marginBottom: 8,
  },
  input: {
    backgroundColor: '#F3F4F6',
    borderRadius: 12,
    padding: 16,
    fontSize: 16,
    marginBottom: 16,
    borderWidth: 1,
    borderColor: '#E5E7EB',
  },
  saveButton: {
    backgroundColor: '#4F46E5',
    padding: 16,
    borderRadius: 12,
    alignItems: 'center',
    marginTop: 8,
  },
  saveButtonText: {
    color: '#FFFFFF',
    fontSize: 16,
    fontWeight: 'bold',
  },
  infoBox: {
    backgroundColor: '#F3F4F6',
    padding: 16,
    borderRadius: 12,
    marginBottom: 16,
  },
  infoBoxTitle: {
    fontSize: 16,
    fontWeight: '600',
    color: '#1F2937',
    marginBottom: 4,
  },
  infoBoxBalance: {
    fontSize: 14,
    color: '#6B7280',
  },
});
