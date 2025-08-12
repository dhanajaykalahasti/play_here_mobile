class Tournament {
  final String id;
  final String name;
  final String location;
  final double distance;
  final String startDate;
  final String endDate;
  final String imageUrl;
  final String prizePool;
  final List<String> sports;

  const Tournament({
    required this.id,
    required this.name,
    required this.location,
    required this.distance,
    required this.startDate,
    required this.endDate,
    required this.imageUrl,
    required this.prizePool,
    required this.sports,
  });
} 