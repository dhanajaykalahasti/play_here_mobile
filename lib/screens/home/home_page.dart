import 'package:flutter/material.dart';
import '../dashboards/cricket_dashboard.dart';
import '../dashboards/football_dashboard.dart';
import '../../widgets/top_bar.dart';
import '../../widgets/bottom_nav_bar.dart';

// Dark sky blue color palette
const Color backgroundColor = Color(0xFFF1F5F9); // Light blue-gray background
const Color cardColor = Color(0xFFFFFFFF); // White cards
const Color textPrimary = Color(0xFF1E293B); // Dark text
const Color textSecondary = Color(0xFF64748B); // Muted text
const Color accentColor = Color(0xFF3B82F6); // Sky blue

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedSport = 'Cricket';
  String currentLocation = 'Bengaluru';
  int _currentIndex = 0;

  final List<Widget> pages = [
    CricketDashboard(), // Default to cricket dashboard
    Center(
      child: Text(
        'Grounds Page',
        style: TextStyle(
          color: textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    Center(
      child: Text(
        'Tournaments Page',
        style: TextStyle(
          color: textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    Center(
      child: Text(
        'Live Scores Page',
        style: TextStyle(
          color: textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  ];

  void _onSportChanged(String? newValue) {
    setState(() {
      selectedSport = newValue!;
    });
  }

  void _onLocationChanged(String newLocation) {
    setState(() {
      currentLocation = newLocation;
    });
    // Here you can add logic to update data based on location
    print('Location changed to: $newLocation');
  }

  void _navigateToPage(int pageIndex) {
    setState(() {
      _currentIndex = pageIndex;
    });
  }

  Widget getSelectedDashboard() {
    switch (selectedSport) {
      case 'Football':
        return FootballDashboard(onNavigateToPage: _navigateToPage);
      case 'Volleyball':
        // You can create a VolleyballDashboard or use a placeholder
        return Center(child: Text('Volleyball Dashboard', style: TextStyle(fontSize: 20, color: Colors.white)));
      case 'Badminton':
        return Center(child: Text('Badminton Dashboard', style: TextStyle(fontSize: 20, color: Colors.white)));
      case 'Kabaddi':
        return Center(child: Text('Kabaddi Dashboard', style: TextStyle(fontSize: 20, color: Colors.white)));
      case 'Cricket':
      default:
        return CricketDashboard(onNavigateToPage: _navigateToPage);
    }
  }

  // User menu callback functions
  void _handleUserProfile() {
    print('Navigate to user profile');
    // Add navigation logic
  }

  void _handleUserBookings() {
    print('Navigate to bookings page');
    // Add navigation logic
  }

  void _handleUserFavorites() {
    print('Navigate to favorites page');
    // Add navigation logic
  }

  void _handleUserStarredEvents() {
    print('Navigate to starred events page');
    // Add navigation logic
  }

  void _handleUserStats() {
    print('Navigate to user stats page');
    // Add navigation logic
  }

  void _handleUserPaymentHistory() {
    print('Navigate to payment history page');
    // Add navigation logic
  }

  void _handleUserNotifications() {
    print('Navigate to notifications page');
    // Add navigation logic
  }

  void _handleUserHelpSupport() {
    print('Navigate to help & support page');
    // Add navigation logic
  }

  void _handleUserLogout() {
    print('User logged out');
    // Add logout logic
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: TopBar(
        selectedSport: selectedSport,
        onSportChanged: _onSportChanged,
        currentLocation: currentLocation,
        onLocationChanged: _onLocationChanged,
        onProfilePressed: () {
          // User profile logic
        },
        onMenuSelected: (value) => print(value),
        onLocationPressed: () {
          // Location selection logic
          print('Location button pressed');
        },
        // User menu callbacks
        onUserProfile: _handleUserProfile,
        onUserBookings: _handleUserBookings,
        onUserFavorites: _handleUserFavorites,
        onUserStarredEvents: _handleUserStarredEvents,
        onUserStats: _handleUserStats,
        onUserPaymentHistory: _handleUserPaymentHistory,
        onUserNotifications: _handleUserNotifications,
        onUserHelpSupport: _handleUserHelpSupport,
        onUserLogout: _handleUserLogout,
      ),
      body: _currentIndex == 0
          ? getSelectedDashboard()
          : pages[_currentIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
