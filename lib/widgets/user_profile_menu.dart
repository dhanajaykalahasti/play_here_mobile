import 'package:flutter/material.dart';

class UserProfileMenu extends StatelessWidget {
  final VoidCallback? onLogout;
  final VoidCallback? onBookings;
  final VoidCallback? onFavorites;
  final VoidCallback? onStarredEvents;
  final VoidCallback? onUserStats;
  final VoidCallback? onProfile;
  final VoidCallback? onPaymentHistory;
  final VoidCallback? onNotifications;
  final VoidCallback? onHelpSupport;

  const UserProfileMenu({
    Key? key,
    this.onLogout,
    this.onBookings,
    this.onFavorites,
    this.onStarredEvents,
    this.onUserStats,
    this.onProfile,
    this.onPaymentHistory,
    this.onNotifications,
    this.onHelpSupport,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
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
          // User Profile Header
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xFF1E3A8A),
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 30,
                    color: Color(0xFF1E3A8A),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'John Doe',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'john.doe@email.com',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Menu Items
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: [
                _buildMenuItem(
                  icon: Icons.person_outline,
                  title: 'My Profile',
                  subtitle: 'Edit personal information',
                  onTap: onProfile,
                ),
                _buildMenuItem(
                  icon: Icons.calendar_today,
                  title: 'My Bookings',
                  subtitle: 'View booking history',
                  onTap: onBookings,
                ),
                _buildMenuItem(
                  icon: Icons.favorite_border,
                  title: 'Favorite Grounds',
                  subtitle: 'Your saved grounds',
                  onTap: onFavorites,
                ),
                _buildMenuItem(
                  icon: Icons.star_border,
                  title: 'Starred Events',
                  subtitle: 'Upcoming tournaments',
                  onTap: onStarredEvents,
                ),
                _buildMenuItem(
                  icon: Icons.analytics_outlined,
                  title: 'User Stats',
                  subtitle: 'Your activity & achievements',
                  onTap: onUserStats,
                ),
                _buildMenuItem(
                  icon: Icons.payment,
                  title: 'Payment History',
                  subtitle: 'Transaction records',
                  onTap: onPaymentHistory,
                ),
                _buildMenuItem(
                  icon: Icons.notifications_outlined,
                  title: 'Notifications',
                  subtitle: 'Manage alerts',
                  onTap: onNotifications,
                ),
                _buildMenuItem(
                  icon: Icons.help_outline,
                  title: 'Help & Support',
                  subtitle: 'Get assistance',
                  onTap: onHelpSupport,
                ),
                Divider(height: 1, color: Colors.grey[300]),
                _buildMenuItem(
                  icon: Icons.logout,
                  title: 'Logout',
                  subtitle: 'Sign out of account',
                  onTap: onLogout,
                  isDestructive: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required String subtitle,
    VoidCallback? onTap,
    bool isDestructive = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(
              icon,
              size: 24,
              color: isDestructive ? Colors.red : Color(0xFF64748B),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: isDestructive ? Colors.red : Color(0xFF1E293B),
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF64748B),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              size: 20,
              color: Color(0xFF64748B),
            ),
          ],
        ),
      ),
    );
  }
} 