import 'package:flutter/material.dart';

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

  const TopBar({
    Key? key,
    required this.selectedSport,
    required this.onSportChanged,
    this.onProfilePressed,
    this.onMenuSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      elevation: 4,
      shadowColor: Colors.black26,
      title: Row(
        children: [
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert, color: Colors.white, size: 24),
            onSelected: onMenuSelected ?? (value) => print(value),
            color: Colors.white,
            itemBuilder: (context) => [
              PopupMenuItem(
                value: "Settings", 
                child: Row(
                  children: [
                    Icon(Icons.settings, color: secondaryColor, size: 20),
                    SizedBox(width: 12),
                    Text(
                      "Settings", 
                      style: TextStyle(
                        color: textPrimary, 
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                value: "Help", 
                child: Row(
                  children: [
                    Icon(Icons.help_outline, color: secondaryColor, size: 20),
                    SizedBox(width: 12),
                    Text(
                      "Help", 
                      style: TextStyle(
                        color: textPrimary, 
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: accentColor, width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedSport,
                  onChanged: onSportChanged,
                  icon: Icon(Icons.keyboard_arrow_down, color: secondaryColor, size: 20),
                  style: TextStyle(
                    color: textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  dropdownColor: Colors.white,
                  items: ['Cricket', 'Football', 'Volleyball', 'Badminton', 'Kabaddi']
                      .map((sport) {
                    return DropdownMenuItem(
                      value: sport,
                      child: Text(
                        sport,
                        style: TextStyle(
                          color: textPrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
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
              onPressed: onProfilePressed,
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
