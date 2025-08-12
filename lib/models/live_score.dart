class LiveScore {
  final String id;
  final String team1;
  final String team2;
  final String score1;
  final String score2;
  final String status;
  final String tournament;
  final String location;
  final String imageUrl;
  final String matchType; // 'international', 'national', 'local'

  const LiveScore({
    required this.id,
    required this.team1,
    required this.team2,
    required this.score1,
    required this.score2,
    required this.status,
    required this.tournament,
    required this.location,
    required this.imageUrl,
    required this.matchType,
  });
} 