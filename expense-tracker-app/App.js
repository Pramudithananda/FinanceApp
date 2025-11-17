import React, { useState } from 'react';
import { 
  StyleSheet, 
  Text, 
  View, 
  ScrollView, 
  TouchableOpacity,
  SafeAreaView,
  TextInput,
  StatusBar
} from 'react-native';
import { 
  Ionicons, 
  MaterialCommunityIcons, 
  Feather 
} from '@expo/vector-icons';

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
      <View style={styles.mainContent}>
        {renderScreen()}
      </View>

      {/* Bottom Navigation */}
      <View style={styles.bottomNav}>
        <NavButton 
          icon={<Ionicons name="home" size={24} color={currentScreen === 'dashboard' ? '#FCD34D' : '#FFFFFF'} />}
          label="Dashboard" 
          active={currentScreen === 'dashboard'}
          onPress={() => setCurrentScreen('dashboard')}
        />
        <NavButton 
          icon={<MaterialCommunityIcons name="bank" size={24} color={currentScreen === 'bank' ? '#FCD34D' : '#FFFFFF'} />}
          label="Bank" 
          active={currentScreen === 'bank'}
          onPress={() => setCurrentScreen('bank')}
        />
        <NavButton 
          icon={<Ionicons name="wallet" size={24} color={currentScreen === 'cash' ? '#FCD34D' : '#FFFFFF'} />}
          label="Cash" 
          active={currentScreen === 'cash'}
          onPress={() => setCurrentScreen('cash')}
        />
        <NavButton 
          icon={<Ionicons name="folder-open" size={24} color={currentScreen === 'categories' ? '#FCD34D' : '#FFFFFF'} />}
          label="Categories" 
          active={currentScreen === 'categories'}
          onPress={() => setCurrentScreen('categories')}
        />
        <NavButton 
          icon={<Ionicons name="settings" size={24} color={currentScreen === 'settings' ? '#FCD34D' : '#FFFFFF'} />}
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
      {icon}
      <Text style={[styles.navLabel, active && styles.navLabelActive]}>
        {label}
      </Text>
    </TouchableOpacity>
  );
}

// Dashboard Screen
function DashboardScreen() {
  return (
    <ScrollView style={styles.screen}>
      <View style={styles.dashboardHeader}>
        <View style={styles.greetingCard}>
          <Text style={styles.greetingTitle}>❤️ නුපුරුදු හෝමනා...</Text>
          <Text style={styles.greetingSubtitle}>Lalanthi Stengran: ආදරෙයි පී...</Text>
          <View style={styles.greetingActions}>
            <TouchableOpacity style={styles.greetingButton}>
              <Text style={styles.greetingButtonText}>Like</Text>
            </TouchableOpacity>
            <TouchableOpacity style={styles.greetingButton}>
              <Text style={styles.greetingButtonText}>Reply</Text>
            </TouchableOpacity>
          </View>
        </View>

        {/* Bank Account Buttons */}
        <View style={styles.accountButtonsRow}>
          <TouchableOpacity style={[styles.accountButton, { backgroundColor: '#6366F1' }]}>
            <Text style={styles.accountButtonNumber}>1234567890</Text>
            <Text style={styles.accountButtonBalance}>රු 0</Text>
          </TouchableOpacity>
          <TouchableOpacity style={[styles.accountButton, { backgroundColor: '#10B981' }]}>
            <Text style={styles.accountButtonNumber}>0987654321</Text>
            <Text style={styles.accountButtonBalance}>රු 0</Text>
          </TouchableOpacity>
        </View>
      </View>

      {/* Cash Accounts */}
      <View style={styles.section}>
        <Text style={styles.sectionTitle}>මුදල් ගිනුම</Text>
        <View style={styles.cashAccountsRow}>
          <View style={[styles.cashCard, { backgroundColor: '#EAB308' }]}>
            <View style={styles.checkmark}>
              <Text style={styles.checkmarkText}>✓</Text>
            </View>
            <Text style={styles.cashCardTitle}>පුබාන මුදල්</Text>
            <Text style={styles.cashCardBalance}>රු 0</Text>
          </View>
          <View style={[styles.cashCard, { backgroundColor: '#EF4444' }]}>
            <Text style={styles.cashCardTitle}>ඇත්නික්කා මුදල්</Text>
            <Text style={styles.cashCardBalance}>රු 0</Text>
          </View>
        </View>
      </View>

      {/* Main Actions */}
      <View style={styles.actionsSection}>
        <TouchableOpacity style={[styles.actionButton, { backgroundColor: '#4F46E5' }]}>
          <MaterialCommunityIcons name="bank" size={20} color="white" />
          <Text style={styles.actionButtonText}>බැංකු නාන්පතු</Text>
        </TouchableOpacity>
        <TouchableOpacity style={[styles.actionButton, { backgroundColor: '#059669' }]}>
          <Ionicons name="wallet" size={20} color="white" />
          <Text style={styles.actionButtonText}>බැංකු Withdraw</Text>
        </TouchableOpacity>
        <TouchableOpacity style={[styles.actionButton, { backgroundColor: '#DC2626' }]}>
          <Feather name="trending-down" size={20} color="white" />
          <Text style={styles.actionButtonText}>විදමී කරන්න</Text>
        </TouchableOpacity>
        <TouchableOpacity style={[styles.actionButton, { backgroundColor: '#6B7280' }]}>
          <Ionicons name="add-circle" size={20} color="white" />
          <Text style={styles.actionButtonText}>නව ගිනුමි එකතු කරන්න</Text>
        </TouchableOpacity>
      </View>
    </ScrollView>
  );
}

// Bank Screen
function BankScreen({ accounts }) {
  return (
    <ScrollView style={styles.screen}>
      <View style={styles.header}>
        <Text style={styles.headerTitle}>Bank</Text>
      </View>

      <View style={styles.content}>
        {/* Summary Card */}
        <View style={styles.summaryCard}>
          <Text style={styles.summaryLabel}>සම්පූර්ණ බැංකු ශේෂය</Text>
          <Text style={[styles.summaryAmount, { color: '#4F46E5' }]}>රු 0</Text>
          <Text style={styles.summarySubtext}>2 ගිනුම් වලින්</Text>
        </View>

        {/* Add Button */}
        <TouchableOpacity style={[styles.addButton, { backgroundColor: '#4F46E5' }]}>
          <Ionicons name="add-circle" size={20} color="white" />
          <Text style={styles.addButtonText}>නව බැංකු ගිනුමි එකතු කරන්න</Text>
        </TouchableOpacity>

        {/* Bank Accounts List */}
        <View style={styles.accountsList}>
          {accounts.map((account) => (
            <View key={account.id} style={[styles.accountCard, { borderLeftColor: '#4F46E5' }]}>
              <View style={styles.accountCardHeader}>
                <Text style={styles.accountCardTitle}>{account.name}</Text>
                <View style={styles.accountCardActions}>
                  <TouchableOpacity style={styles.iconButton}>
                    <Feather name="bar-chart-2" size={18} color="#4F46E5" />
                  </TouchableOpacity>
                  <TouchableOpacity style={styles.iconButton}>
                    <Feather name="link" size={18} color="#6B7280" />
                  </TouchableOpacity>
                  <TouchableOpacity style={styles.iconButton}>
                    <Feather name="trash-2" size={18} color="#EF4444" />
                  </TouchableOpacity>
                  <TouchableOpacity style={styles.iconButton}>
                    <Feather name="edit-2" size={18} color="#EAB308" />
                  </TouchableOpacity>
                </View>
              </View>
              <Text style={styles.accountDetail}>ගිනුම් අංකය: {account.number}</Text>
              <Text style={styles.accountDetail}>වර්ගය: {account.type}</Text>
              <View style={styles.accountCategoryRow}>
                <Feather name="link" size={14} color="#4F46E5" />
                <Text style={styles.accountCategory}>වර්ගීම: {account.category}</Text>
              </View>
              <Text style={styles.accountBalance}>
                ශේෂය: <Text style={{ color: '#4F46E5' }}>රු {account.balance}</Text>
              </Text>
            </View>
          ))}
        </View>
      </View>
    </ScrollView>
  );
}

// Cash Screen
function CashScreen({ accounts }) {
  return (
    <ScrollView style={styles.screen}>
      <View style={styles.header}>
        <Text style={styles.headerTitle}>Cash</Text>
      </View>

      <View style={styles.content}>
        {/* Summary Card */}
        <View style={styles.summaryCard}>
          <Text style={styles.summaryLabel}>සම්පූර්ණ මුදල් ශේෂය</Text>
          <Text style={[styles.summaryAmount, { color: '#10B981' }]}>රු 0</Text>
          <Text style={styles.summarySubtext}>2 ගිනුම් වලින්</Text>
        </View>

        {/* Add Button */}
        <TouchableOpacity style={[styles.addButton, { backgroundColor: '#10B981' }]}>
          <Ionicons name="add-circle" size={20} color="white" />
          <Text style={styles.addButtonText}>නව මුදල් ගිනුමි එකතු කරන්න</Text>
        </TouchableOpacity>

        {/* Cash Accounts List */}
        <View style={styles.accountsList}>
          {accounts.map((account, index) => (
            <View 
              key={account.id} 
              style={[styles.accountCard, { borderLeftColor: index === 0 ? '#EAB308' : '#EF4444' }]}
            >
              <View style={styles.accountCardHeader}>
                <Text style={styles.accountCardTitle}>{account.name}</Text>
                <View style={styles.accountCardActions}>
                  <TouchableOpacity style={styles.iconButton}>
                    <Feather name="trash-2" size={18} color="#EF4444" />
                  </TouchableOpacity>
                  <TouchableOpacity style={styles.iconButton}>
                    <Feather name="edit-2" size={18} color="#EAB308" />
                  </TouchableOpacity>
                </View>
              </View>
              <Text style={styles.accountBalance}>
                ශේෂය: <Text style={{ color: index === 0 ? '#EAB308' : '#EF4444' }}>රු {account.balance}</Text>
              </Text>
            </View>
          ))}
        </View>
      </View>
    </ScrollView>
  );
}

// Categories Screen
function CategoriesScreen({ categories }) {
  return (
    <ScrollView style={styles.screen}>
      <View style={styles.header}>
        <Text style={styles.headerTitle}>Expenses Categories</Text>
        <Text style={styles.headerSubtitle}>Manage categories used in expenses</Text>
      </View>

      <View style={styles.content}>
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
        <View style={styles.categoriesSection}>
          <Text style={styles.sectionHeaderTitle}>කාන්ඩික ලැයිස්තුව</Text>
          <View style={styles.categoriesList}>
            {categories.map((category) => (
              <View key={category.id} style={styles.categoryCard}>
                <View style={styles.categoryCardHeader}>
                  <Text style={styles.categoryCardTitle}>{category.name}</Text>
                  <View style={styles.categoryCardActions}>
                    <TouchableOpacity style={styles.iconButton}>
                      <Feather name="edit-2" size={16} color="#EAB308" />
                    </TouchableOpacity>
                    <TouchableOpacity style={styles.iconButton}>
                      <Feather name="trash-2" size={16} color="#EF4444" />
                    </TouchableOpacity>
                  </View>
                </View>
                <Text style={styles.categoryDetail}>
                  Target: රු {category.budget.toLocaleString()} • Spent: රු {category.spent}
                </Text>
                {category.budget > 0 && (
                  <View style={styles.progressBarContainer}>
                    <View 
                      style={[
                        styles.progressBar, 
                        { width: `${(category.spent / category.budget) * 100}%` }
                      ]} 
                    />
                  </View>
                )}
              </View>
            ))}
          </View>
        </View>
      </View>
    </ScrollView>
  );
}

// Settings Screen
function SettingsScreen() {
  return (
    <ScrollView style={styles.screen}>
      <View style={styles.header}>
        <Text style={styles.headerTitle}>Settings</Text>
        <Text style={styles.headerSubtitle}>App settings and information</Text>
      </View>

      <View style={styles.content}>
        {/* App Information */}
        <View style={styles.settingsSection}>
          <Text style={styles.sectionHeaderTitle}>ඇප් තොරතුරු</Text>
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
        </View>

        {/* Data Management */}
        <View style={styles.settingsSection}>
          <Text style={styles.sectionHeaderTitle}>දත්ත කළමනාකරණය</Text>
          <View style={styles.settingsActions}>
            <TouchableOpacity style={styles.settingsButton}>
              <Text style={styles.settingsButtonIcon}>🗂️</Text>
              <View style={styles.settingsButtonContent}>
                <Text style={styles.settingsButtonTitle}>දත්ත අපනයනය කරන්න</Text>
                <Text style={styles.settingsButtonSubtitle}>JSON ආකාරයෙන් ඔබගේ දත්ත බාගත කරන්න</Text>
              </View>
            </TouchableOpacity>
            
            <TouchableOpacity style={styles.settingsButton}>
              <Text style={styles.settingsButtonIcon}>📊</Text>
              <View style={styles.settingsButtonContent}>
                <Text style={styles.settingsButtonTitle}>මැසික වාර්තාව (HTML)</Text>
                <Text style={styles.settingsButtonSubtitle}>උපාබ පවතින මාසයේ HTML වාර්තාව</Text>
              </View>
            </TouchableOpacity>
            
            <TouchableOpacity style={[styles.settingsButton, styles.dangerButton]}>
              <Text style={styles.settingsButtonIcon}>🗑️</Text>
              <View style={styles.settingsButtonContent}>
                <Text style={[styles.settingsButtonTitle, { color: '#DC2626' }]}>සියලුම දත්ත මකන්න</Text>
                <Text style={[styles.settingsButtonSubtitle, { color: '#EF4444' }]}>ප්‍රවේශමෙන්! මෙය ආපසු හරවන්න බැහැ</Text>
              </View>
            </TouchableOpacity>
          </View>
        </View>
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
  screen: {
    flex: 1,
  },
  bottomNav: {
    flexDirection: 'row',
    backgroundColor: '#4F46E5',
    paddingVertical: 12,
    paddingHorizontal: 8,
    justifyContent: 'space-around',
    borderTopWidth: 1,
    borderTopColor: '#3730A3',
  },
  navButton: {
    alignItems: 'center',
    justifyContent: 'center',
    flex: 1,
  },
  navLabel: {
    color: '#FFFFFF',
    fontSize: 10,
    marginTop: 4,
  },
  navLabelActive: {
    color: '#FCD34D',
  },
  // Dashboard Styles
  dashboardHeader: {
    backgroundColor: '#4F46E5',
    padding: 16,
    paddingTop: 20,
  },
  greetingCard: {
    backgroundColor: 'rgba(255, 255, 255, 0.1)',
    borderRadius: 12,
    padding: 16,
    marginBottom: 16,
  },
  greetingTitle: {
    color: '#FFFFFF',
    fontSize: 20,
    fontWeight: 'bold',
    marginBottom: 8,
  },
  greetingSubtitle: {
    color: 'rgba(255, 255, 255, 0.8)',
    fontSize: 14,
  },
  greetingActions: {
    flexDirection: 'row',
    gap: 8,
    marginTop: 12,
  },
  greetingButton: {
    backgroundColor: 'rgba(255, 255, 255, 0.1)',
    paddingHorizontal: 12,
    paddingVertical: 6,
    borderRadius: 8,
  },
  greetingButtonText: {
    color: 'rgba(255, 255, 255, 0.8)',
    fontSize: 12,
  },
  accountButtonsRow: {
    flexDirection: 'row',
    gap: 8,
  },
  accountButton: {
    flex: 1,
    borderRadius: 12,
    padding: 16,
    justifyContent: 'space-between',
  },
  accountButtonNumber: {
    color: '#FFFFFF',
    fontWeight: '600',
    fontSize: 12,
  },
  accountButtonBalance: {
    color: '#FFFFFF',
    fontSize: 14,
    marginTop: 8,
  },
  section: {
    padding: 16,
  },
  sectionTitle: {
    color: '#FFFFFF',
    fontSize: 18,
    fontWeight: '600',
    marginBottom: 12,
  },
  cashAccountsRow: {
    flexDirection: 'row',
    gap: 12,
  },
  cashCard: {
    flex: 1,
    borderRadius: 12,
    padding: 16,
    position: 'relative',
  },
  checkmark: {
    position: 'absolute',
    top: 8,
    right: 8,
    backgroundColor: '#FFFFFF',
    width: 24,
    height: 24,
    borderRadius: 12,
    alignItems: 'center',
    justifyContent: 'center',
  },
  checkmarkText: {
    fontSize: 10,
  },
  cashCardTitle: {
    color: '#FFFFFF',
    fontWeight: '600',
    marginBottom: 8,
  },
  cashCardBalance: {
    color: '#FFFFFF',
    fontSize: 24,
    fontWeight: 'bold',
  },
  actionsSection: {
    padding: 16,
    gap: 12,
  },
  actionButton: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    paddingVertical: 16,
    paddingHorizontal: 24,
    borderRadius: 12,
    gap: 8,
  },
  actionButtonText: {
    color: '#FFFFFF',
    fontWeight: '600',
  },
  // Common Screen Styles
  header: {
    backgroundColor: '#4F46E5',
    padding: 24,
    alignItems: 'center',
  },
  headerTitle: {
    color: '#FFFFFF',
    fontSize: 24,
    fontWeight: 'bold',
  },
  headerSubtitle: {
    color: 'rgba(255, 255, 255, 0.8)',
    fontSize: 14,
    marginTop: 4,
  },
  content: {
    padding: 16,
  },
  summaryCard: {
    backgroundColor: '#FFFFFF',
    borderRadius: 12,
    padding: 24,
    alignItems: 'center',
    marginBottom: 16,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
    elevation: 3,
  },
  summaryLabel: {
    color: '#6B7280',
    fontSize: 14,
    marginBottom: 8,
  },
  summaryAmount: {
    fontSize: 36,
    fontWeight: 'bold',
    marginBottom: 4,
  },
  summarySubtext: {
    color: '#9CA3AF',
    fontSize: 12,
  },
  addButton: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    paddingVertical: 16,
    paddingHorizontal: 24,
    borderRadius: 12,
    gap: 8,
    marginBottom: 16,
  },
  addButtonText: {
    color: '#FFFFFF',
    fontWeight: '600',
  },
  accountsList: {
    gap: 12,
  },
  accountCard: {
    backgroundColor: '#FFFFFF',
    borderRadius: 12,
    padding: 16,
    borderLeftWidth: 4,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.1,
    shadowRadius: 2,
    elevation: 2,
  },
  accountCardHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'flex-start',
    marginBottom: 12,
  },
  accountCardTitle: {
    fontSize: 18,
    fontWeight: 'bold',
    color: '#1F2937',
    flex: 1,
  },
  accountCardActions: {
    flexDirection: 'row',
    gap: 8,
  },
  iconButton: {
    padding: 4,
  },
  accountDetail: {
    color: '#6B7280',
    fontSize: 12,
    marginBottom: 4,
  },
  accountCategoryRow: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 4,
    marginBottom: 8,
  },
  accountCategory: {
    color: '#4F46E5',
    fontSize: 12,
  },
  accountBalance: {
    color: '#1F2937',
    fontWeight: 'bold',
    fontSize: 18,
  },
  // Categories Screen
  formCard: {
    backgroundColor: '#FFFFFF',
    borderRadius: 12,
    padding: 16,
    marginBottom: 24,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
    elevation: 3,
  },
  formTitle: {
    fontWeight: 'bold',
    marginBottom: 16,
    fontSize: 16,
  },
  formGroup: {
    marginBottom: 12,
  },
  label: {
    fontSize: 12,
    color: '#6B7280',
    marginBottom: 4,
  },
  input: {
    borderWidth: 1,
    borderColor: '#D1D5DB',
    borderRadius: 8,
    paddingHorizontal: 16,
    paddingVertical: 12,
    fontSize: 14,
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
    fontWeight: '600',
  },
  categoriesSection: {
    marginBottom: 16,
  },
  sectionHeaderTitle: {
    fontWeight: 'bold',
    fontSize: 18,
    marginBottom: 12,
  },
  categoriesList: {
    gap: 12,
  },
  categoryCard: {
    backgroundColor: '#FFFFFF',
    borderRadius: 12,
    padding: 16,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.1,
    shadowRadius: 2,
    elevation: 2,
  },
  categoryCardHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'flex-start',
    marginBottom: 8,
  },
  categoryCardTitle: {
    fontWeight: '600',
    color: '#1F2937',
    flex: 1,
  },
  categoryCardActions: {
    flexDirection: 'row',
    gap: 8,
  },
  categoryDetail: {
    fontSize: 12,
    color: '#6B7280',
  },
  progressBarContainer: {
    width: '100%',
    height: 8,
    backgroundColor: '#E5E7EB',
    borderRadius: 4,
    marginTop: 8,
    overflow: 'hidden',
  },
  progressBar: {
    height: 8,
    backgroundColor: '#4F46E5',
    borderRadius: 4,
  },
  // Settings Screen
  settingsSection: {
    marginBottom: 24,
  },
  infoCard: {
    backgroundColor: '#FFFFFF',
    borderRadius: 12,
    padding: 16,
    gap: 12,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
    elevation: 3,
  },
  infoRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
  },
  infoLabel: {
    color: '#6B7280',
  },
  infoValue: {
    fontWeight: '600',
  },
  settingsActions: {
    gap: 12,
  },
  settingsButton: {
    backgroundColor: '#FFFFFF',
    borderRadius: 12,
    padding: 16,
    flexDirection: 'row',
    gap: 12,
    alignItems: 'center',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.1,
    shadowRadius: 2,
    elevation: 2,
  },
  dangerButton: {
    backgroundColor: '#FEF2F2',
    borderWidth: 1,
    borderColor: '#FECACA',
  },
  settingsButtonIcon: {
    fontSize: 24,
  },
  settingsButtonContent: {
    flex: 1,
  },
  settingsButtonTitle: {
    fontWeight: '600',
    marginBottom: 4,
  },
  settingsButtonSubtitle: {
    fontSize: 12,
    color: '#6B7280',
  },
});
