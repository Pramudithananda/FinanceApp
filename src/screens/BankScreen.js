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

export default function BankScreen() {
  const { accounts, addAccount, updateAccount, deleteAccount } = useApp();
  const [modalVisible, setModalVisible] = useState(false);
  const [editingAccount, setEditingAccount] = useState(null);
  const [formData, setFormData] = useState({
    name: '',
    number: '',
    balance: '0',
  });

  const bankAccounts = accounts.filter(a => a.type === 'bank');

  const handleOpenModal = (account = null) => {
    if (account) {
      setEditingAccount(account);
      setFormData({
        name: account.name,
        number: account.number,
        balance: account.balance.toString(),
      });
    } else {
      setEditingAccount(null);
      setFormData({ name: '', number: '', balance: '0' });
    }
    setModalVisible(true);
  };

  const handleSave = () => {
    if (!formData.name || !formData.number) {
      Alert.alert('දෝෂය', 'කරුණාකර සියලු තොරතුරු පුරවන්න');
      return;
    }

    const balance = parseFloat(formData.balance) || 0;

    if (editingAccount) {
      updateAccount(editingAccount.id, {
        name: formData.name,
        number: formData.number,
        balance: balance,
      });
      Alert.alert('සාර්ථකයි', 'ගිණුම update කරන ලදී');
    } else {
      addAccount({
        name: formData.name,
        number: formData.number,
        balance: balance,
        type: 'bank',
      });
      Alert.alert('සාර්ථකයි', 'නව ගිණුම එකතු කරන ලදී');
    }

    setModalVisible(false);
    setFormData({ name: '', number: '', balance: '0' });
    setEditingAccount(null);
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

  const getAccountColor = (index) => {
    const colors = ['#4F46E5', '#10B981', '#F59E0B', '#8B5CF6', '#EF4444'];
    return colors[index % colors.length];
  };

  return (
    <View style={styles.container}>
      <ScrollView style={styles.content}>
        <View style={styles.header}>
          <Text style={styles.headerTitle}>බැංකු ගිණුම්</Text>
          <TouchableOpacity
            style={styles.addButton}
            onPress={() => handleOpenModal()}
          >
            <Icon name="plus-circle" size={32} color="#4F46E5" />
          </TouchableOpacity>
        </View>

        {bankAccounts.length === 0 ? (
          <View style={styles.emptyState}>
            <Icon name="bank-outline" size={64} color="#9CA3AF" />
            <Text style={styles.emptyText}>බැංකු ගිණුම් නොමැත</Text>
            <Text style={styles.emptySubtext}>
              "+ " බොත්තම ඔබා නව ගිණුමක් එකතු කරන්න
            </Text>
          </View>
        ) : (
          bankAccounts.map((account, index) => (
            <View
              key={account.id}
              style={[styles.accountCard, { backgroundColor: getAccountColor(index) }]}
            >
              <View style={styles.accountInfo}>
                <Text style={styles.accountName}>{account.name}</Text>
                <Text style={styles.accountNumber}>ගිණුම් අංකය: {account.number}</Text>
                <Text style={styles.accountBalance}>{formatCurrency(account.balance)}</Text>
              </View>
              <View style={styles.accountActions}>
                <TouchableOpacity
                  style={styles.actionButton}
                  onPress={() => handleOpenModal(account)}
                >
                  <Icon name="pencil" size={24} color="#FFFFFF" />
                </TouchableOpacity>
                <TouchableOpacity
                  style={styles.actionButton}
                  onPress={() => handleDelete(account)}
                >
                  <Icon name="delete" size={24} color="#FFFFFF" />
                </TouchableOpacity>
              </View>
            </View>
          ))
        )}
      </ScrollView>

      {/* Add/Edit Modal */}
      <Modal
        animationType="slide"
        transparent={true}
        visible={modalVisible}
        onRequestClose={() => setModalVisible(false)}
      >
        <View style={styles.modalOverlay}>
          <View style={styles.modalContent}>
            <View style={styles.modalHeader}>
              <Text style={styles.modalTitle}>
                {editingAccount ? 'ගිණුම සංස්කරණය' : 'නව බැංකු ගිණුමක්'}
              </Text>
              <TouchableOpacity onPress={() => setModalVisible(false)}>
                <Icon name="close" size={28} color="#6B7280" />
              </TouchableOpacity>
            </View>

            <Text style={styles.label}>බැංකුවේ නම</Text>
            <TextInput
              style={styles.input}
              placeholder="උදා: People's Bank"
              value={formData.name}
              onChangeText={(text) => setFormData({ ...formData, name: text })}
            />

            <Text style={styles.label}>ගිණුම් අංකය</Text>
            <TextInput
              style={styles.input}
              placeholder="උදා: 1234567890"
              value={formData.number}
              onChangeText={(text) => setFormData({ ...formData, number: text })}
              keyboardType="numeric"
            />

            <Text style={styles.label}>ආරම්භක ශේෂය (රු)</Text>
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
    marginBottom: 12,
    padding: 20,
    borderRadius: 16,
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 8,
    elevation: 5,
  },
  accountInfo: {
    flex: 1,
  },
  accountName: {
    fontSize: 20,
    fontWeight: 'bold',
    color: '#FFFFFF',
    marginBottom: 4,
  },
  accountNumber: {
    fontSize: 13,
    color: '#FFFFFF',
    opacity: 0.8,
    marginBottom: 12,
  },
  accountBalance: {
    fontSize: 28,
    fontWeight: 'bold',
    color: '#FFFFFF',
  },
  accountActions: {
    flexDirection: 'row',
    gap: 12,
  },
  actionButton: {
    backgroundColor: 'rgba(255, 255, 255, 0.2)',
    padding: 10,
    borderRadius: 8,
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
});
