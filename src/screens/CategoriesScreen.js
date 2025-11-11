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
import Icon from 'react-native-vector-icons/MaterialCommunityIcons';

const AVAILABLE_ICONS = [
  'food', 'car', 'home', 'shopping-cart', 'gamepad-variant', 
  'lightning-bolt', 'school', 'medical-bag', 'phone', 'wifi',
  'gift', 'wallet', 'credit-card', 'bus', 'airplane',
];

const AVAILABLE_COLORS = [
  '#4F46E5', '#10B981', '#F59E0B', '#EF4444', '#8B5CF6',
  '#06B6D4', '#EC4899', '#14B8A6', '#F97316', '#6B7280',
];

export default function CategoriesScreen() {
  const { categories, setCategories } = useApp();
  const [modalVisible, setModalVisible] = useState(false);
  const [editingCategory, setEditingCategory] = useState(null);
  const [formData, setFormData] = useState({
    name: '',
    icon: 'dots-horizontal',
    color: '#6B7280',
  });

  const handleOpenModal = (category = null) => {
    if (category) {
      setEditingCategory(category);
      setFormData({
        name: category.name,
        icon: category.icon,
        color: category.color,
      });
    } else {
      setEditingCategory(null);
      setFormData({
        name: '',
        icon: 'dots-horizontal',
        color: '#6B7280',
      });
    }
    setModalVisible(true);
  };

  const handleSave = () => {
    if (!formData.name) {
      Alert.alert('දෝෂය', 'කරුණාකර නමක් ඇතුළත් කරන්න');
      return;
    }

    if (editingCategory) {
      setCategories(
        categories.map(cat =>
          cat.id === editingCategory.id
            ? { ...cat, ...formData }
            : cat
        )
      );
      Alert.alert('සාර්ථකයි', 'ප්‍රවර්ගය update කරන ලදී');
    } else {
      const newCategory = {
        id: Date.now(),
        ...formData,
      };
      setCategories([...categories, newCategory]);
      Alert.alert('සාර්ථකයි', 'නව ප්‍රවර්ගය එකතු කරන ලදී');
    }

    setModalVisible(false);
    setFormData({ name: '', icon: 'dots-horizontal', color: '#6B7280' });
    setEditingCategory(null);
  };

  const handleDelete = (category) => {
    Alert.alert(
      'ප්‍රවර්ගය මකන්න',
      `"${category.name}" ප්‍රවර්ගය මකා දැමීමට අවශ්‍යද?`,
      [
        { text: 'අවලංගු කරන්න', style: 'cancel' },
        {
          text: 'මකන්න',
          style: 'destructive',
          onPress: () => {
            setCategories(categories.filter(cat => cat.id !== category.id));
            Alert.alert('සාර්ථකයි', 'ප්‍රවර්ගය මකා දමන ලදී');
          },
        },
      ]
    );
  };

  return (
    <View style={styles.container}>
      <ScrollView style={styles.content}>
        <View style={styles.header}>
          <Text style={styles.headerTitle}>වියදම් ප්‍රවර්ග</Text>
          <TouchableOpacity
            style={styles.addButton}
            onPress={() => handleOpenModal()}
          >
            <Icon name="plus-circle" size={32} color="#4F46E5" />
          </TouchableOpacity>
        </View>

        <View style={styles.infoBox}>
          <Icon name="information" size={20} color="#4F46E5" />
          <Text style={styles.infoText}>
            ඔබගේ වියදම් සංවිධානය කිරීමට ප්‍රවර්ග භාවිතා කරන්න
          </Text>
        </View>

        {categories.length === 0 ? (
          <View style={styles.emptyState}>
            <Icon name="folder-open-outline" size={64} color="#9CA3AF" />
            <Text style={styles.emptyText}>ප්‍රවර්ග නොමැත</Text>
            <Text style={styles.emptySubtext}>
              "+ " බොත්තම ඔබා නව ප්‍රවර්ගයක් එකතු කරන්න
            </Text>
          </View>
        ) : (
          <View style={styles.categoriesGrid}>
            {categories.map((category) => (
              <TouchableOpacity
                key={category.id}
                style={[styles.categoryCard, { backgroundColor: category.color }]}
                onLongPress={() => handleOpenModal(category)}
              >
                <Icon name={category.icon} size={40} color="#FFFFFF" />
                <Text style={styles.categoryName}>{category.name}</Text>
                <View style={styles.categoryActions}>
                  <TouchableOpacity
                    style={styles.editButton}
                    onPress={() => handleOpenModal(category)}
                  >
                    <Icon name="pencil" size={18} color="#FFFFFF" />
                  </TouchableOpacity>
                  <TouchableOpacity
                    style={styles.deleteButton}
                    onPress={() => handleDelete(category)}
                  >
                    <Icon name="delete" size={18} color="#FFFFFF" />
                  </TouchableOpacity>
                </View>
              </TouchableOpacity>
            ))}
          </View>
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
          <ScrollView contentContainerStyle={styles.modalScrollView}>
            <View style={styles.modalContent}>
              <View style={styles.modalHeader}>
                <Text style={styles.modalTitle}>
                  {editingCategory ? 'ප්‍රවර්ගය සංස්කරණය' : 'නව ප්‍රවර්ගයක්'}
                </Text>
                <TouchableOpacity onPress={() => setModalVisible(false)}>
                  <Icon name="close" size={28} color="#6B7280" />
                </TouchableOpacity>
              </View>

              <Text style={styles.label}>ප්‍රවර්ගයේ නම</Text>
              <TextInput
                style={styles.input}
                placeholder="උදා: ආහාර"
                value={formData.name}
                onChangeText={(text) => setFormData({ ...formData, name: text })}
              />

              <Text style={styles.label}>අයිකෝනය තෝරන්න</Text>
              <View style={styles.iconGrid}>
                {AVAILABLE_ICONS.map((icon) => (
                  <TouchableOpacity
                    key={icon}
                    style={[
                      styles.iconOption,
                      formData.icon === icon && styles.iconOptionSelected,
                    ]}
                    onPress={() => setFormData({ ...formData, icon })}
                  >
                    <Icon name={icon} size={28} color="#1F2937" />
                  </TouchableOpacity>
                ))}
              </View>

              <Text style={styles.label}>වර්ණය තෝරන්න</Text>
              <View style={styles.colorGrid}>
                {AVAILABLE_COLORS.map((color) => (
                  <TouchableOpacity
                    key={color}
                    style={[
                      styles.colorOption,
                      { backgroundColor: color },
                      formData.color === color && styles.colorOptionSelected,
                    ]}
                    onPress={() => setFormData({ ...formData, color })}
                  />
                ))}
              </View>

              <View style={styles.preview}>
                <Text style={styles.previewLabel}>පෙරදසුන:</Text>
                <View style={[styles.previewCard, { backgroundColor: formData.color }]}>
                  <Icon name={formData.icon} size={40} color="#FFFFFF" />
                  <Text style={styles.previewText}>{formData.name || 'නම'}</Text>
                </View>
              </View>

              <TouchableOpacity style={styles.saveButton} onPress={handleSave}>
                <Text style={styles.saveButtonText}>සුරකින්න</Text>
              </TouchableOpacity>
            </View>
          </ScrollView>
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
  infoBox: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: '#EEF2FF',
    margin: 16,
    marginTop: 0,
    padding: 16,
    borderRadius: 12,
    gap: 12,
  },
  infoText: {
    flex: 1,
    fontSize: 14,
    color: '#4F46E5',
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
  categoriesGrid: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    padding: 8,
  },
  categoryCard: {
    width: '47%',
    margin: '1.5%',
    padding: 20,
    borderRadius: 16,
    alignItems: 'center',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 8,
    elevation: 5,
  },
  categoryName: {
    fontSize: 16,
    fontWeight: '600',
    color: '#FFFFFF',
    marginTop: 12,
    textAlign: 'center',
  },
  categoryActions: {
    flexDirection: 'row',
    marginTop: 12,
    gap: 8,
  },
  editButton: {
    backgroundColor: 'rgba(255, 255, 255, 0.2)',
    padding: 8,
    borderRadius: 8,
  },
  deleteButton: {
    backgroundColor: 'rgba(255, 255, 255, 0.2)',
    padding: 8,
    borderRadius: 8,
  },
  modalOverlay: {
    flex: 1,
    backgroundColor: 'rgba(0, 0, 0, 0.5)',
  },
  modalScrollView: {
    flexGrow: 1,
    justifyContent: 'center',
    padding: 20,
  },
  modalContent: {
    backgroundColor: '#FFFFFF',
    borderRadius: 20,
    padding: 24,
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
    marginBottom: 12,
    marginTop: 8,
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
  iconGrid: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: 8,
    marginBottom: 16,
  },
  iconOption: {
    width: 56,
    height: 56,
    backgroundColor: '#F3F4F6',
    borderRadius: 12,
    alignItems: 'center',
    justifyContent: 'center',
    borderWidth: 2,
    borderColor: '#E5E7EB',
  },
  iconOptionSelected: {
    borderColor: '#4F46E5',
    backgroundColor: '#EEF2FF',
  },
  colorGrid: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: 8,
    marginBottom: 16,
  },
  colorOption: {
    width: 48,
    height: 48,
    borderRadius: 24,
    borderWidth: 3,
    borderColor: 'transparent',
  },
  colorOptionSelected: {
    borderColor: '#1F2937',
  },
  preview: {
    marginTop: 8,
    marginBottom: 16,
  },
  previewLabel: {
    fontSize: 14,
    fontWeight: '600',
    color: '#374151',
    marginBottom: 12,
  },
  previewCard: {
    padding: 24,
    borderRadius: 16,
    alignItems: 'center',
  },
  previewText: {
    fontSize: 16,
    fontWeight: '600',
    color: '#FFFFFF',
    marginTop: 12,
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
