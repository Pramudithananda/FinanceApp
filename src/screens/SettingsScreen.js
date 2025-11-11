import React from 'react';
import {
  View,
  Text,
  ScrollView,
  StyleSheet,
  TouchableOpacity,
  Alert,
  Linking,
} from 'react-native';
import Icon from 'react-native-vector-icons/MaterialCommunityIcons';
import AsyncStorage from '@react-native-async-storage/async-storage';

export default function SettingsScreen() {
  const handleClearData = () => {
    Alert.alert(
      'දත්ත මකන්න',
      'ඔබට සියලුම දත්ත මකා දැමීමට අවශ්‍යද? මෙම ක්‍රියාව ආපසු හැරවිය නොහැක.',
      [
        { text: 'අවලංගු කරන්න', style: 'cancel' },
        {
          text: 'මකන්න',
          style: 'destructive',
          onPress: async () => {
            try {
              await AsyncStorage.removeItem('@finance_app_data');
              Alert.alert('සාර්ථකයි', 'සියලුම දත්ත මකා දමන ලදී. යෙදුම නැවත ආරම්භ කරන්න.');
            } catch (error) {
              Alert.alert('දෝෂය', 'දත්ත මකා දැමීම අසාර්ථක විය');
            }
          },
        },
      ]
    );
  };

  const handleExportData = async () => {
    try {
      const data = await AsyncStorage.getItem('@finance_app_data');
      if (data) {
        Alert.alert('දත්ත නිර්යාත', 'දත්ත නිර්යාත කිරීමේ විශේෂාංගය ඉදිරියේදී එකතු කෙරේ');
      } else {
        Alert.alert('දෝෂය', 'නිර්යාත කිරීමට දත්ත නොමැත');
      }
    } catch (error) {
      Alert.alert('දෝෂය', 'දත්ත නිර්යාත කිරීම අසාර්ථක විය');
    }
  };

  const handleBackup = () => {
    Alert.alert('උපස්ථය', 'උපස්ථ විශේෂාංගය ඉදිරියේදී එකතු කෙරේ');
  };

  const openWebsite = () => {
    Linking.openURL('https://github.com');
  };

  return (
    <ScrollView style={styles.container}>
      <View style={styles.header}>
        <Icon name="cog" size={64} color="#4F46E5" />
        <Text style={styles.headerTitle}>සැකසුම්</Text>
        <Text style={styles.version}>අනුවාදය 2.0.0</Text>
      </View>

      {/* App Settings */}
      <View style={styles.section}>
        <Text style={styles.sectionTitle}>යෙදුම් සැකසුම්</Text>
        
        <TouchableOpacity style={styles.settingItem}>
          <View style={styles.settingLeft}>
            <Icon name="palette" size={24} color="#4F46E5" />
            <Text style={styles.settingText}>තේමාව</Text>
          </View>
          <Icon name="chevron-right" size={24} color="#9CA3AF" />
        </TouchableOpacity>

        <TouchableOpacity style={styles.settingItem}>
          <View style={styles.settingLeft}>
            <Icon name="translate" size={24} color="#4F46E5" />
            <Text style={styles.settingText}>භාෂාව</Text>
          </View>
          <View style={styles.settingRight}>
            <Text style={styles.settingValue}>සිංහල</Text>
            <Icon name="chevron-right" size={24} color="#9CA3AF" />
          </View>
        </TouchableOpacity>

        <TouchableOpacity style={styles.settingItem}>
          <View style={styles.settingLeft}>
            <Icon name="currency-usd" size={24} color="#4F46E5" />
            <Text style={styles.settingText}>මුදල් ඒකකය</Text>
          </View>
          <View style={styles.settingRight}>
            <Text style={styles.settingValue}>රු (LKR)</Text>
            <Icon name="chevron-right" size={24} color="#9CA3AF" />
          </View>
        </TouchableOpacity>
      </View>

      {/* Data Management */}
      <View style={styles.section}>
        <Text style={styles.sectionTitle}>දත්ත කළමනාකරණය</Text>
        
        <TouchableOpacity style={styles.settingItem} onPress={handleBackup}>
          <View style={styles.settingLeft}>
            <Icon name="cloud-upload" size={24} color="#10B981" />
            <Text style={styles.settingText}>උපස්ථය</Text>
          </View>
          <Icon name="chevron-right" size={24} color="#9CA3AF" />
        </TouchableOpacity>

        <TouchableOpacity style={styles.settingItem} onPress={handleExportData}>
          <View style={styles.settingLeft}>
            <Icon name="export" size={24} color="#3B82F6" />
            <Text style={styles.settingText}>දත්ත නිර්යාත</Text>
          </View>
          <Icon name="chevron-right" size={24} color="#9CA3AF" />
        </TouchableOpacity>

        <TouchableOpacity 
          style={styles.settingItem} 
          onPress={handleClearData}
        >
          <View style={styles.settingLeft}>
            <Icon name="delete-forever" size={24} color="#EF4444" />
            <Text style={[styles.settingText, { color: '#EF4444' }]}>
              සියලුම දත්ත මකන්න
            </Text>
          </View>
          <Icon name="chevron-right" size={24} color="#9CA3AF" />
        </TouchableOpacity>
      </View>

      {/* About */}
      <View style={styles.section}>
        <Text style={styles.sectionTitle}>පිළිබඳව</Text>
        
        <TouchableOpacity style={styles.settingItem}>
          <View style={styles.settingLeft}>
            <Icon name="information" size={24} color="#4F46E5" />
            <Text style={styles.settingText}>යෙදුම පිළිබඳව</Text>
          </View>
          <Icon name="chevron-right" size={24} color="#9CA3AF" />
        </TouchableOpacity>

        <TouchableOpacity style={styles.settingItem}>
          <View style={styles.settingLeft}>
            <Icon name="file-document" size={24} color="#4F46E5" />
            <Text style={styles.settingText}>පරිශීලක මාර්ගෝපදේශය</Text>
          </View>
          <Icon name="chevron-right" size={24} color="#9CA3AF" />
        </TouchableOpacity>

        <TouchableOpacity style={styles.settingItem}>
          <View style={styles.settingLeft}>
            <Icon name="shield-check" size={24} color="#4F46E5" />
            <Text style={styles.settingText}>රහස්‍යතා ප්‍රතිපත්තිය</Text>
          </View>
          <Icon name="chevron-right" size={24} color="#9CA3AF" />
        </TouchableOpacity>

        <TouchableOpacity style={styles.settingItem} onPress={openWebsite}>
          <View style={styles.settingLeft}>
            <Icon name="github" size={24} color="#4F46E5" />
            <Text style={styles.settingText}>GitHub</Text>
          </View>
          <Icon name="open-in-new" size={24} color="#9CA3AF" />
        </TouchableOpacity>
      </View>

      {/* App Info */}
      <View style={styles.infoCard}>
        <Text style={styles.infoTitle}>💰 මුදල් කළමනාකරණ</Text>
        <Text style={styles.infoDescription}>
          ඔබගේ පෞද්ගලික මුදල් කළමනාකරණය සඳහා සම්පූර්ණ සිංහල මොබයිල් යෙදුම
        </Text>
        <Text style={styles.infoCopyright}>
          © 2025 All Rights Reserved
        </Text>
      </View>

      <View style={styles.bottomPadding} />
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#F3F4F6',
  },
  header: {
    alignItems: 'center',
    paddingVertical: 32,
    backgroundColor: '#FFFFFF',
  },
  headerTitle: {
    fontSize: 28,
    fontWeight: 'bold',
    color: '#1F2937',
    marginTop: 16,
  },
  version: {
    fontSize: 14,
    color: '#6B7280',
    marginTop: 4,
  },
  section: {
    marginTop: 24,
    backgroundColor: '#FFFFFF',
    paddingVertical: 8,
  },
  sectionTitle: {
    fontSize: 13,
    fontWeight: '600',
    color: '#6B7280',
    textTransform: 'uppercase',
    paddingHorizontal: 16,
    paddingVertical: 8,
    letterSpacing: 0.5,
  },
  settingItem: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    paddingVertical: 16,
    paddingHorizontal: 16,
    borderBottomWidth: 1,
    borderBottomColor: '#F3F4F6',
  },
  settingLeft: {
    flexDirection: 'row',
    alignItems: 'center',
    flex: 1,
  },
  settingText: {
    fontSize: 16,
    color: '#1F2937',
    marginLeft: 16,
  },
  settingRight: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 8,
  },
  settingValue: {
    fontSize: 14,
    color: '#6B7280',
  },
  infoCard: {
    backgroundColor: '#FFFFFF',
    margin: 16,
    marginTop: 24,
    padding: 24,
    borderRadius: 16,
    alignItems: 'center',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 8,
    elevation: 5,
  },
  infoTitle: {
    fontSize: 24,
    fontWeight: 'bold',
    color: '#1F2937',
    marginBottom: 12,
  },
  infoDescription: {
    fontSize: 14,
    color: '#6B7280',
    textAlign: 'center',
    lineHeight: 20,
    marginBottom: 16,
  },
  infoCopyright: {
    fontSize: 12,
    color: '#9CA3AF',
  },
  bottomPadding: {
    height: 24,
  },
});
