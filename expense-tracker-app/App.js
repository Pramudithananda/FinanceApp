import React, { useState } from 'react';
import {
  View,
  Text,
  StyleSheet,
  ScrollView,
  TouchableOpacity,
  TextInput,
  Modal,
  SafeAreaView,
  StatusBar,
} from 'react-native';

// Main App Component
export default function ExpenseTrackerApp() {
  const [currentScreen, setCurrentScreen] = useState('dashboard');
  const [accounts, setAccounts] = useState({
    bank: [
      { id: 1, name: "People's Bank", number: "1234567890", type: "ඉතුරුම්", balance: 0, category: "පුබාන මුදල්" },
      { id: 2, name: "Commercial Bank", number: "0987654321", type: "ඉතුරුම්", balance: 0, category: "පුබාන මුදල්" }
    ],
    cash: [
      { id: 1, name: "පුබාන මුදල්", balance: 0 },
      { id: 2, name: "ඇත්නික්කා මුදල්", balance: 0 }
    ]
  });
  
  const [categories, setCategories] = useState([
    { id: 1, name: "පෙන් මලදී ගැනීම", budget: 10000, spent: 0 },
    { id: 2, name: "කෑම", budget: 0, spent: 0 }
  ]);

  const renderScreen = () => {
    switch(currentScreen) {
      case 'dashboard':
        return <DashboardScreen />;
      case 'bank':
        return <BankScreen accounts={accounts.bank} setAccounts={setAccounts} />;
      case 'cash':
        return <CashScreen accounts={accounts.cash} setAccounts={setAccounts} />;
      case 'categories':
        return <CategoriesScreen categories={categories} setCategories={setCategories} />;
      case 'settings':
        return <SettingsScreen />;
      default:
        return <DashboardScreen />;
    }
  };

  return (
    <SafeAreaView style={styles.container}>
      <StatusBar barStyle="light-content" backgroundColor="#4F46E5" />
      
      {/* Main Content */}
      <View style={styles.mainContent}>
        {renderScreen()}
      </View>

      {/* Bottom Navigation */}
      <View style={styles.bottomNav}>
        <NavButton 
          icon="🏠" 
          label="Dashboard" 
          active={currentScreen === 'dashboard'}
          onPress={() => setCurrentScreen('dashboard')}
        />
        <NavButton 
          icon="🏦" 
          label="Bank" 
          active={currentScreen === 'bank'}
          onPress={() => setCurrentScreen('bank')}
        />
        <NavButton 
          icon="💰" 
          label="Cash" 
          active={currentScreen === 'cash'}
          onPress={() => setCurrentScreen('cash')}
        />
        <NavButton 
          icon="📁" 
          label="Categories" 
          active={currentScreen === 'categories'}
          onPress={() => setCurrentScreen('categories')}
        />
        <NavButton 
          icon="⚙️" 
          label="Settings" 
          active={currentScreen === 'settings'}
          onPress={() => setCurrentScreen('settings')}
        />
      </View>
    </SafeAreaView>
  );
}

// Navigation Button Component
function NavButton({ icon, label, active, onPress }) {
  return (
    <TouchableOpacity 
      onPress={onPress}
      style={styles.navButton}
    >
      <Text style={styles.navIcon}>{icon}</Text>
      <Text style={[styles.navLabel, active && styles.navLabelActive]}>
        {label}
      </Text>
    </TouchableOpacity>
  );
}

// Dashboard Screen
function DashboardScreen() {
  return (
    <ScrollView style={styles.screenContainer}>
      <View style={styles.dashboardGradient}>
        {/* Header */}
        <View style={styles.dashboardHeader}>
          <View style={styles.headerCard}>
            <Text style={styles.headerTitle}>❤️ නුපුරුදු හෝමනා...</Text>
            <Text style={styles.headerSubtitle}>Lalanthi Stengran: ආදරෙයි පී...</Text>
            <View style={styles.headerButtons}>
              <TouchableOpacity style={styles.headerButton}>
                <Text style={styles.headerButtonText}>Like</Text>
              </TouchableOpacity>
              <TouchableOpacity style={styles.headerButton}>
                <Text style={styles.headerButtonText}>Reply</Text>
              </TouchableOpacity>
            </View>
          </View>

          {/* Action Buttons */}
          <View style={styles.actionRow}>
            <TouchableOpacity style={[styles.actionButton, styles.actionButtonBlue]}>
              <Text style={styles.actionButtonNumber}>1234567890</Text>
              <Text style={styles.actionButtonAmount}>රු 0</Text>
            </TouchableOpacity>
            <TouchableOpacity style={[styles.actionButton, styles.actionButtonGreen]}>
              <Text style={styles.actionButtonNumber}>0987654321</Text>
              <Text style={styles.actionButtonAmount}>රු 0</Text>
            </TouchableOpacity>
          </View>
        </View>

        {/* Quick Actions */}
        <View style={styles.section}>
          <Text style={styles.sectionTitle}>මුදල් ගිනුම</Text>
          <View style={styles.cashGrid}>
            <View style={[styles.cashCard, styles.cashCardYellow]}>
              <View style={styles.checkMark}>
                <Text style={styles.checkMarkText}>✓</Text>
              </View>
              <Text style={styles.cashCardTitle}>පුබාන මුදල්</Text>
              <Text style={styles.cashCardBalance}>රු 0</Text>
            </View>
            <View style={[styles.cashCard, styles.cashCardRed]}>
              <Text style={styles.cashCardTitle}>ඇත්නික්කා මුදල්</Text>
              <Text style={styles.cashCardBalance}>රු 0</Text>
            </View>
          </View>
        </View>

        {/* Main Actions */}
        <View style={styles.mainActions}>
          <TouchableOpacity style={[styles.mainActionButton, styles.mainActionBlue]}>
            <Text style={styles.mainActionIcon}>🏦</Text>
            <Text style={styles.mainActionText}>බැංකු නාන්පතු</Text>
          </TouchableOpacity>
          <TouchableOpacity style={[styles.mainActionButton, styles.mainActionGreen]}>
            <Text style={styles.mainActionIcon}>💰</Text>
            <Text style={styles.mainActionText}>බැංකු Withdraw</Text>
          </TouchableOpacity>
          <TouchableOpacity style={[styles.mainActionButton, styles.mainActionRed]}>
            <Text style={styles.mainActionIcon}>📉</Text>
            <Text style={styles.mainActionText}>විදමී කරන්න</Text>
          </TouchableOpacity>
          <TouchableOpacity style={[styles.mainActionButton, styles.mainActionGray]}>
            <Text style={styles.mainActionIcon}>➕</Text>
            <Text style={styles.mainActionText}>නව ගිනුමි එකතු කරන්න</Text>
          </TouchableOpacity>
        </View>
      </View>
    </ScrollView>
  );
}

// Bank Screen
function BankScreen({ accounts }) {
  return (
    <ScrollView style={styles.screenContainer}>
      {/* Header */}
      <View style={styles.screenHeader}>
        <Text style={styles.screenHeaderText}>Bank</Text>
      </View>

      <View style={styles.screenContent}>
        {/* Summary Card */}
        <View style={styles.summaryCard}>
          <Text style={styles.summaryLabel}>සම්පූර්ණ බැංකු ශේෂය</Text>
          <Text style={styles.summaryAmount}>රු 0</Text>
          <Text style={styles.summarySubtext}>2 ගිනුම් වලින්</Text>
        </View>

        {/* Add Button */}
        <TouchableOpacity style={[styles.addButton, styles.addButtonBlue]}>
          <Text style={styles.addButtonIcon}>➕</Text>
          <Text style={styles.addButtonText}>නව බැංකු ගිනුමි එකතු කරන්න</Text>
        </TouchableOpacity>

        {/* Bank Accounts List */}
        {accounts.map((account) => (
          <View key={account.id} style={[styles.accountCard, styles.accountCardBlue]}>
            <View style={styles.accountHeader}>
              <Text style={styles.accountName}>{account.name}</Text>
              <View style={styles.accountActions}>
                <TouchableOpacity style={styles.iconButton}>
                  <Text>📊</Text>
                </TouchableOpacity>
                <TouchableOpacity style={styles.iconButton}>
                  <Text>🔗</Text>
                </TouchableOpacity>
                <TouchableOpacity style={styles.iconButton}>
                  <Text>🗑️</Text>
                </TouchableOpacity>
                <TouchableOpacity style={styles.iconButton}>
                  <Text>✏️</Text>
                </TouchableOpacity>
              </View>
            </View>
            <Text style={styles.accountDetail}>ගිනුම් අංකය: {account.number}</Text>
            <Text style={styles.accountDetail}>වර්ගය: {account.type}</Text>
            <Text style={styles.accountCategory}>🔗 වර්ගීම: {account.category}</Text>
            <Text style={styles.accountBalance}>ශේෂය: <Text style={styles.balanceAmount}>රු {account.balance}</Text></Text>
          </View>
        ))}
      </View>
    </ScrollView>
  );
}

// Cash Screen
function CashScreen({ accounts }) {
  return (
    <ScrollView style={styles.screenContainer}>
      {/* Header */}
      <View style={styles.screenHeader}>
        <Text style={styles.screenHeaderText}>Cash</Text>
      </View>

      <View style={styles.screenContent}>
        {/* Summary Card */}
        <View style={styles.summaryCard}>
          <Text style={styles.summaryLabel}>සම්පූර්ණ මුදල් ශේෂය</Text>
          <Text style={[styles.summaryAmount, styles.summaryAmountGreen]}>රු 0</Text>
          <Text style={styles.summarySubtext}>2 ගිනුම් වලින්</Text>
        </View>

        {/* Add Button */}
        <TouchableOpacity style={[styles.addButton, styles.addButtonGreen]}>
          <Text style={styles.addButtonIcon}>➕</Text>
          <Text style={styles.addButtonText}>නව මුදල් ගිනුමි එකතු කරන්න</Text>
        </TouchableOpacity>

        {/* Cash Accounts List */}
        {accounts.map((account, index) => (
          <View 
            key={account.id} 
            style={[
              styles.accountCard, 
              index === 0 ? styles.accountCardYellow : styles.accountCardRed
            ]}
          >
            <View style={styles.accountHeader}>
              <Text style={styles.accountName}>{account.name}</Text>
              <View style={styles.accountActions}>
                <TouchableOpacity style={styles.iconButton}>
                  <Text>🗑️</Text>
                </TouchableOpacity>
                <TouchableOpacity style={styles.iconButton}>
                  <Text>✏️</Text>
                </TouchableOpacity>
              </View>
            </View>
            <Text style={styles.accountBalance}>
              ශේෂය: <Text style={[styles.balanceAmount, index === 0 ? styles.balanceYellow : styles.balanceRed]}>රු {account.balance}</Text>
            </Text>
          </View>
        ))}
      </View>
    </ScrollView>
  );
}

// Categories Screen
function CategoriesScreen({ categories }) {
  return (
    <ScrollView style={styles.screenContainer}>
      {/* Header */}
      <View style={styles.screenHeader}>
        <Text style={styles.screenHeaderText}>Expenses Categories</Text>
        <Text style={styles.screenHeaderSubtext}>Manage categories used in expenses</Text>
      </View>

      <View style={styles.screenContent}>
        {/* Add New Category Form */}
        <View style={styles.formCard}>
          <Text style={styles.formTitle}>නව කාන්ඩිකයක් එක් කරන්න</Text>
          <View style={styles.formGroup}>
            <Text style={styles.label}>නාමය</Text>
            <TextInput 
              style={styles.input}
              placeholder="උදා: කෑම"
              placeholderTextColor="#9CA3AF"
            />
          </View>
          <View style={styles.formGroup}>
            <Text style={styles.label}>ඉලක්කය (රු)</Text>
            <TextInput 
              style={styles.input}
              placeholder="0"
              keyboardType="numeric"
              placeholderTextColor="#9CA3AF"
            />
          </View>
          <TouchableOpacity style={styles.submitButton}>
            <Text style={styles.submitButtonText}>එක් කරන්න</Text>
          </TouchableOpacity>
        </View>

        {/* Existing Categories */}
        <Text style={styles.listTitle}>කාන්ඩික ලැයිස්තුව</Text>
        {categories.map((category) => (
          <View key={category.id} style={styles.categoryCard}>
            <View style={styles.categoryHeader}>
              <Text style={styles.categoryName}>{category.name}</Text>
              <View style={styles.categoryActions}>
                <TouchableOpacity style={styles.iconButton}>
                  <Text>✏️</Text>
                </TouchableOpacity>
                <TouchableOpacity style={styles.iconButton}>
                  <Text>🗑️</Text>
                </TouchableOpacity>
              </View>
            </View>
            <Text style={styles.categoryInfo}>
              Target: රු {category.budget.toLocaleString()} • Spent: රු {category.spent}
            </Text>
            {category.budget > 0 && (
              <View style={styles.progressBar}>
                <View 
                  style={[
                    styles.progressFill,
                    { width: `${(category.spent / category.budget) * 100}%` }
                  ]}
                />
              </View>
            )}
          </View>
        ))}
      </View>
    </ScrollView>
  );
}

// Settings Screen
function SettingsScreen() {
  return (
    <ScrollView style={styles.screenContainer}>
      {/* Header */}
      <View style={styles.screenHeader}>
        <Text style={styles.screenHeaderText}>Settings</Text>
        <Text style={styles.screenHeaderSubtext}>App settings and information</Text>
      </View>

      <View style={styles.screenContent}>
        {/* App Information */}
        <Text style={styles.listTitle}>ඇප් තොරතුරු</Text>
        <View style={styles.infoCard}>
          <View style={styles.infoRow}>
            <Text style={styles.infoLabel}>ඇප් නම:</Text>
            <Text style={styles.infoValue}>මුදල් කළමනාකරණ</Text>
          </View>
          <View style={styles.infoRow}>
            <Text style={styles.infoLabel}>වෙළුම:</Text>
            <Text style={styles.infoValue}>v3.0 - Enhanced</Text>
          </View>
          <View style={styles.infoRow}>
            <Text style={styles.infoLabel}>නිර්මාණය:</Text>
            <Text style={styles.infoValue}>2024</Text>
          </View>
          <View style={styles.infoRow}>
            <Text style={styles.infoLabel}>භාෂාව:</Text>
            <Text style={styles.infoValue}>සිංහල</Text>
          </View>
        </View>

        {/* Data Management */}
        <Text style={styles.listTitle}>දත්ත කළමනාකරණය</Text>
        <TouchableOpacity style={styles.settingsCard}>
          <Text style={styles.settingsIcon}>🗂️</Text>
          <View style={styles.settingsContent}>
            <Text style={styles.settingsTitle}>දත්ත අපනයනය කරන්න</Text>
            <Text style={styles.settingsDescription}>JSON ආකාරයෙන් ඔබගේ දත්ත බාගත කරන්න</Text>
          </View>
        </TouchableOpacity>
        
        <TouchableOpacity style={styles.settingsCard}>
          <Text style={styles.settingsIcon}>📊</Text>
          <View style={styles.settingsContent}>
            <Text style={styles.settingsTitle}>මැසික වාර්තාව (HTML)</Text>
            <Text style={styles.settingsDescription}>උපාබ පවතින මාසයේ HTML වාර්තාව</Text>
          </View>
        </TouchableOpacity>
        
        <TouchableOpacity style={[styles.settingsCard, styles.settingsCardDanger]}>
          <Text style={styles.settingsIcon}>🗑️</Text>
          <View style={styles.settingsContent}>
            <Text style={[styles.settingsTitle, styles.settingsTitleDanger]}>සියලුම දත්ත මකන්න</Text>
            <Text style={[styles.settingsDescription, styles.settingsDescriptionDanger]}>ප්‍රවේශමෙන්! මෙය ආපසු හරවන්න බැහැ</Text>
          </View>
        </TouchableOpacity>
      </View>
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#F9FAFB',
  },
  mainContent: {
    flex: 1,
  },
  bottomNav: {
    flexDirection: 'row',
    backgroundColor: '#4F46E5',
    paddingVertical: 12,
    paddingHorizontal: 8,
    justifyContent: 'space-around',
    elevation: 8,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: -2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
  },
  navButton: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  navIcon: {
    fontSize: 24,
  },
  navLabel: {
    color: '#FFFFFF',
    fontSize: 11,
    marginTop: 4,
  },
  navLabelActive: {
    color: '#FCD34D',
  },
  screenContainer: {
    flex: 1,
    backgroundColor: '#F9FAFB',
  },
  dashboardGradient: {
    backgroundColor: '#4F46E5',
    padding: 16,
    minHeight: '100%',
  },
  dashboardHeader: {
    marginBottom: 24,
    paddingTop: 16,
  },
  headerCard: {
    backgroundColor: 'rgba(255, 255, 255, 0.1)',
    borderRadius: 12,
    padding: 16,
    marginBottom: 16,
  },
  headerTitle: {
    fontSize: 20,
    fontWeight: 'bold',
    color: '#FFFFFF',
    marginBottom: 8,
  },
  headerSubtitle: {
    fontSize: 14,
    color: 'rgba(255, 255, 255, 0.8)',
  },
  headerButtons: {
    flexDirection: 'row',
    gap: 8,
    marginTop: 12,
  },
  headerButton: {
    backgroundColor: 'rgba(255, 255, 255, 0.1)',
    paddingVertical: 6,
    paddingHorizontal: 12,
    borderRadius: 8,
  },
  headerButtonText: {
    color: 'rgba(255, 255, 255, 0.8)',
    fontSize: 12,
  },
  actionRow: {
    flexDirection: 'row',
    gap: 8,
  },
  actionButton: {
    flex: 1,
    borderRadius: 12,
    padding: 16,
    justifyContent: 'space-between',
  },
  actionButtonBlue: {
    backgroundColor: '#3B82F6',
  },
  actionButtonGreen: {
    backgroundColor: '#10B981',
  },
  actionButtonNumber: {
    color: '#FFFFFF',
    fontSize: 12,
    fontWeight: '600',
    marginBottom: 4,
  },
  actionButtonAmount: {
    color: '#FFFFFF',
    fontSize: 16,
    fontWeight: 'bold',
  },
  section: {
    marginBottom: 24,
  },
  sectionTitle: {
    color: '#FFFFFF',
    fontSize: 18,
    fontWeight: '600',
    marginBottom: 12,
  },
  cashGrid: {
    flexDirection: 'row',
    gap: 12,
  },
  cashCard: {
    flex: 1,
    borderRadius: 12,
    padding: 16,
    position: 'relative',
  },
  cashCardYellow: {
    backgroundColor: '#F59E0B',
  },
  cashCardRed: {
    backgroundColor: '#EF4444',
  },
  checkMark: {
    position: 'absolute',
    top: 8,
    right: 8,
    backgroundColor: '#FFFFFF',
    borderRadius: 12,
    width: 24,
    height: 24,
    alignItems: 'center',
    justifyContent: 'center',
  },
  checkMarkText: {
    fontSize: 12,
  },
  cashCardTitle: {
    color: '#FFFFFF',
    fontSize: 14,
    fontWeight: '600',
    marginBottom: 8,
  },
  cashCardBalance: {
    color: '#FFFFFF',
    fontSize: 24,
    fontWeight: 'bold',
  },
  mainActions: {
    gap: 12,
  },
  mainActionButton: {
    borderRadius: 12,
    paddingVertical: 16,
    paddingHorizontal: 24,
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    gap: 8,
    elevation: 4,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
  },
  mainActionBlue: {
    backgroundColor: '#3B82F6',
  },
  mainActionGreen: {
    backgroundColor: '#10B981',
  },
  mainActionRed: {
    backgroundColor: '#EF4444',
  },
  mainActionGray: {
    backgroundColor: '#6B7280',
  },
  mainActionIcon: {
    fontSize: 20,
  },
  mainActionText: {
    color: '#FFFFFF',
    fontSize: 16,
    fontWeight: '600',
  },
  screenHeader: {
    backgroundColor: '#4F46E5',
    padding: 24,
    alignItems: 'center',
  },
  screenHeaderText: {
    color: '#FFFFFF',
    fontSize: 24,
    fontWeight: 'bold',
  },
  screenHeaderSubtext: {
    color: 'rgba(255, 255, 255, 0.8)',
    fontSize: 14,
    marginTop: 4,
  },
  screenContent: {
    padding: 16,
  },
  summaryCard: {
    backgroundColor: '#FFFFFF',
    borderRadius: 12,
    padding: 24,
    alignItems: 'center',
    marginBottom: 16,
    elevation: 2,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.05,
    shadowRadius: 2,
  },
  summaryLabel: {
    color: '#6B7280',
    fontSize: 14,
    marginBottom: 8,
  },
  summaryAmount: {
    color: '#4F46E5',
    fontSize: 36,
    fontWeight: 'bold',
    marginBottom: 4,
  },
  summaryAmountGreen: {
    color: '#10B981',
  },
  summarySubtext: {
    color: '#9CA3AF',
    fontSize: 12,
  },
  addButton: {
    borderRadius: 12,
    paddingVertical: 16,
    paddingHorizontal: 24,
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    gap: 8,
    marginBottom: 16,
    elevation: 2,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.05,
    shadowRadius: 2,
  },
  addButtonBlue: {
    backgroundColor: '#4F46E5',
  },
  addButtonGreen: {
    backgroundColor: '#10B981',
  },
  addButtonIcon: {
    color: '#FFFFFF',
    fontSize: 20,
  },
  addButtonText: {
    color: '#FFFFFF',
    fontSize: 16,
    fontWeight: '600',
  },
  accountCard: {
    backgroundColor: '#FFFFFF',
    borderRadius: 12,
    padding: 16,
    marginBottom: 12,
    borderLeftWidth: 4,
    elevation: 2,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.05,
    shadowRadius: 2,
  },
  accountCardBlue: {
    borderLeftColor: '#3B82F6',
  },
  accountCardYellow: {
    borderLeftColor: '#F59E0B',
  },
  accountCardRed: {
    borderLeftColor: '#EF4444',
  },
  accountHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'flex-start',
    marginBottom: 12,
  },
  accountName: {
    fontSize: 18,
    fontWeight: 'bold',
    color: '#1F2937',
    flex: 1,
  },
  accountActions: {
    flexDirection: 'row',
    gap: 8,
  },
  iconButton: {
    padding: 4,
  },
  accountDetail: {
    fontSize: 14,
    color: '#6B7280',
    marginBottom: 4,
  },
  accountCategory: {
    fontSize: 14,
    color: '#3B82F6',
    marginBottom: 8,
  },
  accountBalance: {
    fontSize: 18,
    fontWeight: 'bold',
    color: '#1F2937',
  },
  balanceAmount: {
    color: '#4F46E5',
  },
  balanceYellow: {
    color: '#F59E0B',
  },
  balanceRed: {
    color: '#EF4444',
  },
  formCard: {
    backgroundColor: '#FFFFFF',
    borderRadius: 12,
    padding: 16,
    marginBottom: 24,
    elevation: 2,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.05,
    shadowRadius: 2,
  },
  formTitle: {
    fontSize: 16,
    fontWeight: 'bold',
    color: '#1F2937',
    marginBottom: 16,
  },
  formGroup: {
    marginBottom: 12,
  },
  label: {
    fontSize: 14,
    color: '#6B7280',
    marginBottom: 4,
  },
  input: {
    borderWidth: 1,
    borderColor: '#D1D5DB',
    borderRadius: 8,
    paddingHorizontal: 16,
    paddingVertical: 10,
    fontSize: 16,
    color: '#1F2937',
  },
  submitButton: {
    backgroundColor: '#4F46E5',
    borderRadius: 8,
    paddingVertical: 12,
    alignItems: 'center',
    marginTop: 4,
  },
  submitButtonText: {
    color: '#FFFFFF',
    fontSize: 16,
    fontWeight: '600',
  },
  listTitle: {
    fontSize: 18,
    fontWeight: 'bold',
    color: '#1F2937',
    marginBottom: 12,
  },
  categoryCard: {
    backgroundColor: '#FFFFFF',
    borderRadius: 12,
    padding: 16,
    marginBottom: 12,
    elevation: 2,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.05,
    shadowRadius: 2,
  },
  categoryHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'flex-start',
    marginBottom: 8,
  },
  categoryName: {
    fontSize: 16,
    fontWeight: '600',
    color: '#1F2937',
    flex: 1,
  },
  categoryActions: {
    flexDirection: 'row',
    gap: 8,
  },
  categoryInfo: {
    fontSize: 14,
    color: '#6B7280',
    marginBottom: 8,
  },
  progressBar: {
    height: 8,
    backgroundColor: '#E5E7EB',
    borderRadius: 4,
    overflow: 'hidden',
  },
  progressFill: {
    height: '100%',
    backgroundColor: '#4F46E5',
  },
  infoCard: {
    backgroundColor: '#FFFFFF',
    borderRadius: 12,
    padding: 16,
    marginBottom: 24,
    elevation: 2,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.05,
    shadowRadius: 2,
  },
  infoRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    paddingVertical: 12,
    borderBottomWidth: 1,
    borderBottomColor: '#F3F4F6',
  },
  infoLabel: {
    fontSize: 14,
    color: '#6B7280',
  },
  infoValue: {
    fontSize: 14,
    fontWeight: '600',
    color: '#1F2937',
  },
  settingsCard: {
    backgroundColor: '#FFFFFF',
    borderRadius: 12,
    padding: 16,
    marginBottom: 12,
    flexDirection: 'row',
    alignItems: 'center',
    gap: 12,
    elevation: 2,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.05,
    shadowRadius: 2,
  },
  settingsCardDanger: {
    backgroundColor: '#FEF2F2',
    borderWidth: 1,
    borderColor: '#FEE2E2',
  },
  settingsIcon: {
    fontSize: 24,
  },
  settingsContent: {
    flex: 1,
  },
  settingsTitle: {
    fontSize: 16,
    fontWeight: '600',
    color: '#1F2937',
    marginBottom: 4,
  },
  settingsTitleDanger: {
    color: '#DC2626',
  },
  settingsDescription: {
    fontSize: 14,
    color: '#6B7280',
  },
  settingsDescriptionDanger: {
    color: '#EF4444',
  },
});
