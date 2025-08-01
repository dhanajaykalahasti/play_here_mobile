import 'package:flutter/material.dart';
import '../dashboards/cricket_dashboard.dart';
import '../dashboards/football_dashboard.dart';
import '../../widgets/top_bar.dart';
import '../../widgets/bottom_nav_bar.dart';
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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedSport = 'Cricket';
  int _currentIndex = 0;

  // Sample data - in real app, this would come from API
  final List<Ground> nearbyGrounds = [
    Ground(
      id: '1',
      name: 'Central Cricket Ground',
      location: 'Indiranagar, Bangalore',
      distance: 2.5,
      rating: 4.5,
      imageUrl: '',
      price: 1500,
      sports: ['Cricket', 'Football'],
    ),
    Ground(
      id: '2',
      name: 'Sports Complex Arena',
      location: 'Koramangala, Bangalore',
      distance: 3.2,
      rating: 4.3,
      imageUrl: '',
      price: 1200,
      sports: ['Cricket', 'Football', 'Tennis'],
    ),
    Ground(
      id: '3',
      name: 'Elite Sports Center',
      location: 'HSR Layout, Bangalore',
      distance: 4.1,
      rating: 4.7,
      imageUrl: '',
      price: 1800,
      sports: ['Cricket', 'Badminton'],
    ),
    Ground(
      id: '4',
      name: 'Community Ground',
      location: 'JP Nagar, Bangalore',
      distance: 5.0,
      rating: 4.1,
      imageUrl: '',
      price: 800,
      sports: ['Cricket', 'Football', 'Volleyball'],
    ),
    Ground(
      id: '5',
      name: 'Premium Sports Hub',
      location: 'Whitefield, Bangalore',
      distance: 6.2,
      rating: 4.8,
      imageUrl: '',
      price: 2200,
      sports: ['Cricket', 'Football', 'Tennis', 'Badminton'],
    ),
  ];

  final List<Tournament> nearbyTournaments = [
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
      id: '3',
      name: 'Youth Badminton Championship',
      location: 'Bangalore',
      distance: 2.8,
      startDate: '22 Dec',
      endDate: '24 Dec',
      imageUrl: '',
      prizePool: '₹15,000',
      sports: ['Badminton'],
    ),
    Tournament(
      id: '4',
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
      id: '5',
      name: 'Amateur Football League',
      location: 'Bangalore',
      distance: 3.8,
      startDate: '28 Dec',
      endDate: '02 Jan',
      imageUrl: '',
      prizePool: '₹20,000',
      sports: ['Football'],
    ),
  ];

  final List<LiveScore> liveScores = [
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

  final List<Widget> pages = [
    Center(
      child: Text(
        'Home Page Content',
        style: TextStyle(
          color: textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
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

  Widget getDashboardContent() {
    switch (selectedSport) {
      case 'Football':
        return FootballDashboard();
      case 'Volleyball':
        return Center(
          child: Text(
            'Volleyball Dashboard',
            style: TextStyle(
              color: textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      case 'Badminton':
        return Center(
          child: Text(
            'Badminton Dashboard',
            style: TextStyle(
              color: textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      case 'Kabaddi':
        return Center(
          child: Text(
            'Kabaddi Dashboard',
            style: TextStyle(
              color: textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      default:
        return CricketDashboard();
    }
  }

  Widget _buildHomeContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Book Grounds Section
          _buildSectionHeader('Book Grounds', 'Top 5 grounds near you', () {
            setState(() => _currentIndex = 1);
          }),
          SizedBox(height: 12),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: nearbyGrounds.length,
              itemBuilder: (context, index) {
                return GroundCard(
                  ground: nearbyGrounds[index],
                  onTap: () {
                    setState(() => _currentIndex = 1);
                  },
                );
              },
            ),
          ),
          SizedBox(height: 24),

          // Tournaments Section
          _buildSectionHeader('Tournaments', 'Upcoming tournaments nearby', () {
            setState(() => _currentIndex = 2);
          }),
          SizedBox(height: 12),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: nearbyTournaments.length,
              itemBuilder: (context, index) {
                return TournamentCard(
                  tournament: nearbyTournaments[index],
                  onTap: () {
                    setState(() => _currentIndex = 2);
                  },
                );
              },
            ),
          ),
          SizedBox(height: 24),

          // Live Scores Section
          _buildSectionHeader('Live Scores', 'Live matches around you', () {
            setState(() => _currentIndex = 3);
          }),
          SizedBox(height: 12),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: liveScores.length,
              itemBuilder: (context, index) {
                return LiveScoreCard(
                  liveScore: liveScores[index],
                  onTap: () {
                    setState(() => _currentIndex = 3);
                  },
                );
              },
            ),
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }

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
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: TopBar(
        selectedSport: selectedSport,
        onSportChanged: (String? newValue) {
          setState(() {
            selectedSport = newValue!;
          });
        },
        onProfilePressed: () {
          // User profile logic
        },
        onMenuSelected: (value) => print(value),
      ),
      body: _currentIndex == 0 ? _buildHomeContent() : pages[_currentIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
