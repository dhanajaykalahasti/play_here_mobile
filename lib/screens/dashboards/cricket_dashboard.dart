import 'package:flutter/material.dart';
import '../../widgets/ground_card.dart';
import '../../widgets/tournament_card.dart';
import '../../widgets/live_score_card.dart';
import '../../models/ground.dart';
import '../../models/tournament.dart';
import '../../models/live_score.dart';

// Unified color palette
const Color backgroundColor = Color(0xFFF1F5F9); // Light blue-gray
const Color cardColor = Color(0xFFFFFFFF); // White cards
const Color textPrimary = Color(0xFF1E293B); // Very dark text
const Color textSecondary = Color(0xFF475569); // Medium dark
const Color textMuted = Color(0xFF64748B); // Muted
const Color accentColor = Color(0xFF3B82F6); // Sky blue
const Color liveStatusColor = Color(0xFFEF4444); // Red

class CricketDashboard extends StatelessWidget {
  final Function(int)? onNavigateToPage;
  
  const CricketDashboard({
    Key? key,
    this.onNavigateToPage,
  }) : super(key: key);

  // Sample cricket-specific data
  final List<Ground> cricketGrounds = const [
    Ground(
      id: '1',
      name: 'Nehru Grounds',
      location: 'Municipal Park, Tirupati',
      distance: 2.5,
      rating: 4.5,
      imageUrl: '',
      price: 1500,
      sports: ['Cricket'],
    ),
    Ground(
      id: '2',
      name: 'YSR Grounds',
      location: 'Tummalagunta, Tirupati',
      distance: 3.2,
      rating: 4.3,
      imageUrl: '',
      price: 1200,
      sports: ['Cricket'],
    ),
    Ground(
      id: '3',
      name: 'Tharaka Rama Grounds',
      location: 'SVU, Tirupati',
      distance: 4.1,
      rating: 4.7,
      imageUrl: '',
      price: 1800,
      sports: ['Cricket'],
    ),
    Ground(
      id: '4',
      name: 'Kishore Turf',
      location: 'Panagal, Sri Kalahasti',
      distance: 5.0,
      rating: 4.1,
      imageUrl: '',
      price: 800,
      sports: ['Cricket'],
    ),
    Ground(
      id: '5',
      name: 'Premium Cricket Hub',
      location: 'Whitefield, Bangalore',
      distance: 6.2,
      rating: 4.8,
      imageUrl: '',
      price: 2200,
      sports: ['Cricket'],
    ),
  ];

  final List<Tournament> cricketTournaments = const [
    Tournament(
      id: '1',
      name: 'Bangalore Premier League',
      location: 'Bangalore',
      distance: 3.5,
      startDate: '15 Dec',
      endDate: '20 Dec',
      imageUrl: '',
      prizePool: '₹50,000',
      sports: ['Cricket'],
    ),
    Tournament(
      id: '2',
      name: 'Local Cricket Tournament',
      location: 'Bangalore',
      distance: 5.5,
      startDate: '25 Dec',
      endDate: '30 Dec',
      imageUrl: '',
      prizePool: '₹10,000',
      sports: ['Cricket'],
    ),
    Tournament(
      id: '3',
      name: 'Corporate Cricket Cup',
      location: 'Bangalore',
      distance: 4.2,
      startDate: '18 Dec',
      endDate: '25 Dec',
      imageUrl: '',
      prizePool: '₹25,000',
      sports: ['Cricket'],
    ),
    Tournament(
      id: '4',
      name: 'Youth Cricket Championship',
      location: 'Bangalore',
      distance: 2.8,
      startDate: '22 Dec',
      endDate: '24 Dec',
      imageUrl: '',
      prizePool: '₹15,000',
      sports: ['Cricket'],
    ),
    Tournament(
      id: '5',
      name: 'Amateur Cricket League',
      location: 'Bangalore',
      distance: 3.8,
      startDate: '28 Dec',
      endDate: '02 Jan',
      imageUrl: '',
      prizePool: '₹20,000',
      sports: ['Cricket'],
    ),
  ];

  final List<LiveScore> cricketLiveScores = const [
    LiveScore(
      id: '1',
      team1: 'India',
      team2: 'Australia',
      score1: '285/6',
      score2: '180/4',
      status: 'Live',
      tournament: 'Border Gavaskar Trophy',
      location: 'Melbourne',
      imageUrl: '',
      matchType: 'international',
    ),
    LiveScore(
      id: '2',
      team1: 'Karnataka',
      team2: 'Tamil Nadu',
      score1: '320/8',
      score2: '280/6',
      status: 'Live',
      tournament: 'Ranji Trophy',
      location: 'Bangalore',
      imageUrl: '',
      matchType: 'national',
    ),
    LiveScore(
      id: '3',
      team1: 'Local Team A',
      team2: 'Local Team B',
      score1: '45/2',
      score2: '32/1',
      status: 'Live',
      tournament: 'Local League',
      location: 'Indiranagar',
      imageUrl: '',
      matchType: 'local',
    ),
    LiveScore(
      id: '4',
      team1: 'City Club',
      team2: 'District XI',
      score1: '120/5',
      score2: '95/3',
      status: 'Live',
      tournament: 'City Championship',
      location: 'Koramangala',
      imageUrl: '',
      matchType: 'local',
    ),
    LiveScore(
      id: '5',
      team1: 'Community XI',
      team2: 'Sports Club',
      score1: '85/4',
      score2: '72/2',
      status: 'Live',
      tournament: 'Community Cup',
      location: 'HSR Layout',
      imageUrl: '',
      matchType: 'local',
    ),
  ];

  Widget _buildSectionHeader(String title, String subtitle, VoidCallback onViewAll) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: textPrimary,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 14,
                  color: textSecondary,
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: onViewAll,
            child: Text(
              'View All',
              style: TextStyle(
                color: accentColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalList<T>({
    required List<T> items,
    required Widget Function(T item) itemBuilder,
  }) {
    return Container(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) => itemBuilder(items[index]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Book Grounds Section
            _buildSectionHeader('Cricket Grounds', 'Top 5 cricket grounds near you', () {
              // Navigate to grounds page (index 1)
              onNavigateToPage?.call(1);
            }),
            SizedBox(height: 12),
            SizedBox(
              height: 200, // ADD THIS BACK - ListView needs a defined height
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: cricketGrounds.length,
                itemBuilder: (context, index) {
                  return GroundCard(
                    ground: cricketGrounds[index],
                    onTap: () {
                      // Navigate to ground details
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 24),

            // Tournaments Section
            _buildSectionHeader('Cricket Tournaments', 'Upcoming cricket tournaments nearby', () {
              // Navigate to tournaments page (index 2)
              onNavigateToPage?.call(2);
            }),
            SizedBox(height: 12),
            SizedBox(
              height: 200, // ADD THIS BACK - ListView needs a defined height
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: cricketTournaments.length,
                itemBuilder: (context, index) {
                  return TournamentCard(
                    tournament: cricketTournaments[index],
                    onTap: () {
                      // Navigate to tournament details
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 24),

            // Live Scores Section
            _buildSectionHeader('Cricket Live Scores', 'Live cricket matches around you', () {
              // Navigate to live scores page (index 3)
              onNavigateToPage?.call(3);
            }),
            SizedBox(height: 12),
            SizedBox(
              height: 200, // ADD THIS BACK - ListView needs a defined height
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: cricketLiveScores.length,
                itemBuilder: (context, index) {
                  return LiveScoreCard(
                    liveScore: cricketLiveScores[index],
                    onTap: () {
                      // Navigate to live score details
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
