import 'package:flutter/material.dart';
import '../../widgets/ground_card.dart';
import '../../widgets/tournament_card.dart';
import '../../widgets/live_score_card.dart';
import '../../models/ground.dart';
import '../../models/tournament.dart';
import '../../models/live_score.dart';

// Dark sky blue color palette
const Color backgroundColor = Color(0xFFF1F5F9); // Light blue-gray background
const Color cardColor = Color(0xFFFFFFFF); // White cards
const Color textPrimary = Color(0xFF1E293B); // Dark text
const Color textSecondary = Color(0xFF64748B); // Muted text
const Color accentColor = Color(0xFF3B82F6); // Sky blue

class FootballDashboard extends StatelessWidget {
  final Function(int)? onNavigateToPage;
  
  const FootballDashboard({
    Key? key,
    this.onNavigateToPage,
  }) : super(key: key);

  // Sample football-specific data
  final List<Ground> footballGrounds = const [
    Ground(
      id: '1',
      name: 'Football Arena Center',
      location: 'Indiranagar, Bangalore',
      distance: 2.5,
      rating: 4.5,
      imageUrl: '',
      price: 1500,
      sports: ['Football'],
    ),
    Ground(
      id: '2',
      name: 'Sports Complex Arena',
      location: 'Koramangala, Bangalore',
      distance: 3.2,
      rating: 4.3,
      imageUrl: '',
      price: 1200,
      sports: ['Football'],
    ),
    Ground(
      id: '3',
      name: 'Elite Football Center',
      location: 'HSR Layout, Bangalore',
      distance: 4.1,
      rating: 4.7,
      imageUrl: '',
      price: 1800,
      sports: ['Football'],
    ),
    Ground(
      id: '4',
      name: 'Community Football Ground',
      location: 'JP Nagar, Bangalore',
      distance: 5.0,
      rating: 4.1,
      imageUrl: '',
      price: 800,
      sports: ['Football'],
    ),
    Ground(
      id: '5',
      name: 'Premium Football Hub',
      location: 'Whitefield, Bangalore',
      distance: 6.2,
      rating: 4.8,
      imageUrl: '',
      price: 2200,
      sports: ['Football'],
    ),
  ];

  final List<Tournament> footballTournaments = const [
    Tournament(
      id: '1',
      name: 'Corporate Football Cup',
      location: 'Bangalore',
      distance: 4.2,
      startDate: '18 Dec',
      endDate: '25 Dec',
      imageUrl: '',
      prizePool: '₹25,000',
      sports: ['Football'],
    ),
    Tournament(
      id: '2',
      name: 'Amateur Football League',
      location: 'Bangalore',
      distance: 3.8,
      startDate: '28 Dec',
      endDate: '02 Jan',
      imageUrl: '',
      prizePool: '₹20,000',
      sports: ['Football'],
    ),
    Tournament(
      id: '3',
      name: 'Youth Football Championship',
      location: 'Bangalore',
      distance: 2.8,
      startDate: '22 Dec',
      endDate: '24 Dec',
      imageUrl: '',
      prizePool: '₹15,000',
      sports: ['Football'],
    ),
    Tournament(
      id: '4',
      name: 'Local Football Tournament',
      location: 'Bangalore',
      distance: 5.5,
      startDate: '25 Dec',
      endDate: '30 Dec',
      imageUrl: '',
      prizePool: '₹10,000',
      sports: ['Football'],
    ),
    Tournament(
      id: '5',
      name: 'Community Football Cup',
      location: 'Bangalore',
      distance: 3.5,
      startDate: '15 Dec',
      endDate: '20 Dec',
      imageUrl: '',
      prizePool: '₹12,000',
      sports: ['Football'],
    ),
  ];

  final List<LiveScore> footballLiveScores = const [
    LiveScore(
      id: '1',
      team1: 'Brazil',
      team2: 'Argentina',
      score1: '2',
      score2: '1',
      status: 'Live',
      tournament: 'World Cup Qualifier',
      location: 'Rio de Janeiro',
      imageUrl: '',
      matchType: 'international',
    ),
    LiveScore(
      id: '2',
      team1: 'Bengaluru FC',
      team2: 'Mumbai City',
      score1: '1',
      score2: '0',
      status: 'Live',
      tournament: 'ISL',
      location: 'Bangalore',
      imageUrl: '',
      matchType: 'national',
    ),
    LiveScore(
      id: '3',
      team1: 'Local FC A',
      team2: 'Local FC B',
      score1: '3',
      score2: '2',
      status: 'Live',
      tournament: 'Local League',
      location: 'Indiranagar',
      imageUrl: '',
      matchType: 'local',
    ),
    LiveScore(
      id: '4',
      team1: 'City United',
      team2: 'District FC',
      score1: '0',
      score2: '0',
      status: 'Live',
      tournament: 'City Championship',
      location: 'Koramangala',
      imageUrl: '',
      matchType: 'local',
    ),
    LiveScore(
      id: '5',
      team1: 'Community FC',
      team2: 'Sports United',
      score1: '1',
      score2: '1',
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
            _buildSectionHeader('Football Grounds', 'Top 5 football grounds near you', () {
              // Navigate to grounds page (index 1)
              onNavigateToPage?.call(1);
            }),
            SizedBox(height: 12),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: footballGrounds.length,
                itemBuilder: (context, index) {
                  return GroundCard(
                    ground: footballGrounds[index],
                    onTap: () {
                      // Navigate to ground details
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 24),

            // Tournaments Section
            _buildSectionHeader('Football Tournaments', 'Upcoming football tournaments nearby', () {
              // Navigate to tournaments page (index 2)
              onNavigateToPage?.call(2);
            }),
            SizedBox(height: 12),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: footballTournaments.length,
                itemBuilder: (context, index) {
                  return TournamentCard(
                    tournament: footballTournaments[index],
                    onTap: () {
                      // Navigate to tournament details
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 24),

            // Live Scores Section
            _buildSectionHeader('Football Live Scores', 'Live football matches around you', () {
              // Navigate to live scores page (index 3)
              onNavigateToPage?.call(3);
            }),
            SizedBox(height: 12),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: footballLiveScores.length,
                itemBuilder: (context, index) {
                  return LiveScoreCard(
                    liveScore: footballLiveScores[index],
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
