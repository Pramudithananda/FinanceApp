import React, { useEffect, useState } from 'react';
import { Alert, Modal, Pressable, StyleSheet, Text, TextInput, View } from 'react-native';
import { palette, radius, spacing } from '../styles/theme';
import { formatCurrency } from '../utils/formatters';

const CategoryModal = ({ visible, category, onClose, onSubmit }) => {
  const [name, setName] = useState('');
  const [target, setTarget] = useState('');
  const [unitPrice, setUnitPrice] = useState('');

  useEffect(() => {
    if (category && visible) {
      setName(category.name || '');
      setTarget(String(category.target ?? ''));
      setUnitPrice(String(category.unitPrice ?? ''));
    } else if (!visible) {
      setName('');
      setTarget('');
      setUnitPrice('');
    }
  }, [category, visible]);

  const handleSubmit = () => {
    try {
      onSubmit({
        id: category?.id,
        name,
        target: parseFloat(target),
        unitPrice: parseFloat(unitPrice),
      });
      onClose();
    } catch (error) {
      Alert.alert('දෝෂයක්', error.message || 'කාණ්ඩය සුරැකීම අසාර්ථක විය');
    }
  };

  const editing = Boolean(category);

  return (
    <Modal visible={visible} animationType="slide" transparent onRequestClose={onClose}>
      <View style={styles.overlay}>
        <Pressable onPress={onClose} style={styles.backdrop} />
        <View style={styles.card}>
          <View style={styles.header}>
            <Text style={styles.title}>{editing ? 'කාණ්ඩය සංස්කරණය' : 'නව කාණ්ඩයක්'}</Text>
            <Pressable onPress={onClose} hitSlop={12}>
              <Text style={styles.close}>✕</Text>
            </Pressable>
          </View>

          <Text style={styles.label}>කාණ්ඩ නාමය</Text>
          <TextInput style={styles.input} value={name} onChangeText={setName} placeholder="උදා: කුලී ගෙවීම" />

          <Text style={styles.label}>මාසික ඉලක්කය (රු)</Text>
          <TextInput
            style={styles.input}
            value={target}
            onChangeText={setTarget}
            placeholder={formatCurrency(0)}
            keyboardType="numeric"
          />

          <Text style={styles.label}>ඒකක මිල (අමතර)</Text>
          <TextInput
            style={styles.input}
            value={unitPrice}
            onChangeText={setUnitPrice}
            placeholder={formatCurrency(0)}
            keyboardType="numeric"
          />

          <Pressable style={styles.submit} onPress={handleSubmit}>
            <Text style={styles.submitLabel}>{editing ? 'අප්ඩේට් කරන්න' : 'ඇතුලත් කරන්න'}</Text>
          </Pressable>
        </View>
      </View>
    </Modal>
  );
};

const styles = StyleSheet.create({
  overlay: {
    flex: 1,
    backgroundColor: palette.overlay,
    justifyContent: 'center',
    paddingHorizontal: spacing.lg,
  },
  backdrop: {
    ...StyleSheet.absoluteFillObject,
  },
  card: {
    backgroundColor: palette.surface,
    borderRadius: radius.xl,
    padding: spacing.lg,
    elevation: 6,
  },
  header: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: spacing.md,
  },
  title: {
    fontSize: 18,
    fontWeight: '700',
    color: palette.text,
  },
  close: {
    fontSize: 22,
    color: palette.textSecondary,
  },
  label: {
    fontSize: 13,
    color: palette.textSecondary,
    marginBottom: spacing.xs,
  },
  input: {
    borderWidth: 1,
    borderColor: palette.border,
    borderRadius: radius.md,
    padding: spacing.md,
    fontSize: 16,
    marginBottom: spacing.md,
  },
  submit: {
    backgroundColor: palette.primary,
    borderRadius: radius.md,
    paddingVertical: spacing.md,
    alignItems: 'center',
  },
  submitLabel: {
    color: palette.surface,
    fontSize: 16,
    fontWeight: '600',
  },
});

export default CategoryModal;
