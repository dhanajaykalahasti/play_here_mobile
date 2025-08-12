import 'package:flutter/material.dart';
import 'user_profile_menu.dart';

// Dark sky blue color palette
const Color primaryColor = Color(0xFF1E3A8A); // Dark sky blue
const Color secondaryColor = Color(0xFF3B82F6); // Sky blue
const Color accentColor = Color(0xFF60A5FA); // Light sky blue
const Color backgroundColor = Color(0xFFF1F5F9); // Light blue-gray background
const Color textPrimary = Color(0xFF1E293B); // Dark text
const Color textSecondary = Color(0xFF64748B); // Muted text
const Color whiteText = Color(0xFFFFFFFF); // White text for contrast

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final String selectedSport;
  final Function(String?) onSportChanged;
  final VoidCallback? onProfilePressed;
  final Function(String)? onMenuSelected;
  final String currentLocation;
  final Function(String)? onLocationChanged;
  final VoidCallback? onLocationPressed;
  final VoidCallback? onUserProfile;
  final VoidCallback? onUserBookings;
  final VoidCallback? onUserFavorites;
  final VoidCallback? onUserStarredEvents;
  final VoidCallback? onUserStats;
  final VoidCallback? onUserPaymentHistory;
  final VoidCallback? onUserNotifications;
  final VoidCallback? onUserHelpSupport;
  final VoidCallback? onUserLogout;

  const TopBar({
    Key? key,
    required this.selectedSport,
    required this.onSportChanged,
    required this.currentLocation,
    this.onProfilePressed,
    this.onMenuSelected,
    this.onLocationChanged,
    this.onLocationPressed,
    this.onUserProfile,
    this.onUserBookings,
    this.onUserFavorites,
    this.onUserStarredEvents,
    this.onUserStats,
    this.onUserPaymentHistory,
    this.onUserNotifications,
    this.onUserHelpSupport,
    this.onUserLogout,
  }) : super(key: key);

  void _showUserMenu(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: UserProfileMenu(
            onProfile: onUserProfile,
            onBookings: onUserBookings,
            onFavorites: onUserFavorites,
            onStarredEvents: onUserStarredEvents,
            onUserStats: onUserStats,
            onPaymentHistory: onUserPaymentHistory,
            onNotifications: onUserNotifications,
            onHelpSupport: onUserHelpSupport,
            onLogout: onUserLogout,
          ),
        );
      },
    );
  }

  void _showSportSelection(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return _buildSelectionDialog(
          context: context,
          title: 'Select Sport',
          icon: Icons.sports,
          options: [
            {'label': 'Cricket', 'icon': Icons.sports_cricket},
            {'label': 'Football', 'icon': Icons.sports_soccer},
            {'label': 'Volleyball', 'icon': Icons.sports_volleyball},
            {'label': 'Badminton', 'icon': Icons.sports_tennis},
            {'label': 'Kabaddi', 'icon': Icons.sports},
          ],
          selected: selectedSport,
          onSelected: (value) {
            onSportChanged?.call(value);
            Navigator.of(context).pop();
          },
          showSearch: false,
        );
      },
    );
  }

  void _showLocationSelection(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return _buildSelectionDialog(
          context: context,
          title: 'Select Location',
          icon: Icons.location_on,
          options: [
            {'label': 'Bengaluru', 'icon': Icons.location_city},
            {'label': 'Tirupati', 'icon': Icons.location_city},
            {'label': 'Hyderabad', 'icon': Icons.location_city},
            {'label': 'Chennai', 'icon': Icons.location_city},
            {'label': 'Mumbai', 'icon': Icons.location_city},
            // Add more locations as needed
          ],
          selected: currentLocation,
          onSelected: (value) {
            onLocationChanged?.call(value);
            Navigator.of(context).pop();
          },
          showSearch: true,
        );
      },
    );
  }

  Widget _buildSelectionDialog({
    required BuildContext context,
    required String title,
    required IconData icon,
    required List<Map<String, dynamic>> options,
    required String selected,
    required Function(String) onSelected,
    bool showSearch = false,
  }) {
    TextEditingController searchController = TextEditingController();
    ValueNotifier<String> searchValue = ValueNotifier('');

    return Dialog(
      backgroundColor: Colors.transparent,
      child: StatefulBuilder(
        builder: (context, setState) {
          List<Map<String, dynamic>> filteredOptions = options
              .where((option) => option['label']
                  .toLowerCase()
                  .contains(searchValue.value.toLowerCase()))
              .toList();

          return Container(
            width: 320,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color(0xFF1E3A8A),
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  child: Row(
                    children: [
                      Icon(icon, color: Colors.white, size: 24),
                      SizedBox(width: 8),
                      Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                if (showSearch)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: ValueListenableBuilder<String>(
                      valueListenable: searchValue,
                      builder: (context, value, _) {
                        return TextField(
                          controller: searchController,
                          onChanged: (val) => searchValue.value = val,
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                          ),
                        );
                      },
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: ValueListenableBuilder<String>(
                    valueListenable: searchValue,
                    builder: (context, value, _) {
                      final displayOptions = showSearch ? filteredOptions : options;
                      return Column(
                        children: displayOptions.map((option) {
                          bool isSelected = selected == option['label'];
                          return InkWell(
                            onTap: () => onSelected(option['label']),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              margin: EdgeInsets.only(bottom: 8),
                              decoration: BoxDecoration(
                                color: isSelected ? Color(0xFF1E3A8A).withOpacity(0.1) : Colors.transparent,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: isSelected ? Color(0xFF1E3A8A) : Colors.grey[300]!,
                                  width: isSelected ? 2 : 1,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    option['icon'],
                                    size: 24,
                                    color: isSelected ? Color(0xFF1E3A8A) : Color(0xFF64748B),
                                  ),
                                  SizedBox(width: 12),
                                  Text(
                                    option['label'],
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                                      color: isSelected ? Color(0xFF1E3A8A) : Color(0xFF1E293B),
                                    ),
                                  ),
                                  Spacer(),
                                  if (isSelected)
                                    Icon(
                                      Icons.check_circle,
                                      color: Color(0xFF1E3A8A),
                                      size: 20,
                                    ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  IconData _getSportIcon(String sport) {
    switch (sport.toLowerCase()) {
      case 'cricket':
        return Icons.sports_cricket;
      case 'football':
        return Icons.sports_soccer;
      case 'volleyball':
        return Icons.sports_volleyball;
      case 'badminton':
        return Icons.sports_tennis; // Using tennis icon for badminton
      case 'kabaddi':
        return Icons.sports; // Generic sports icon for kabaddi
      default:
        return Icons.sports_cricket;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      elevation: 4,
      shadowColor: Colors.black26,
      title: Row(
        children: [
          // Sport selection button with icon
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: accentColor, width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              icon: Icon(
                _getSportIcon(selectedSport),
                color: Color(0xFF1E3A8A),
                size: 24,
              ),
              onPressed: () => _showSportSelection(context),
              padding: EdgeInsets.all(8),
            ),
          ),
          const SizedBox(width: 12),
          // App title
          Expanded(
            child: Text(
              'PlayHere',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Location button (icon + value, no dropdown arrow)
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: accentColor, width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () => _showLocationSelection(context),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.location_on, color: secondaryColor, size: 20),
                    SizedBox(width: 4),
                    Text(
                      currentLocation,
                      style: TextStyle(
                        color: textPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    // No dropdown arrow here!
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          // User profile button
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: accentColor, width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              icon: Icon(Icons.account_circle, color: secondaryColor, size: 24),
              onPressed: () => _showUserMenu(context),
              padding: EdgeInsets.all(8),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
