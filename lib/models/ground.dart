class Ground {
  final String id;
  final String name;
  final String location;
  final double distance;
  final double rating;
  final String imageUrl;
  final double price;
  final List<String> sports;

  const Ground({
    required this.id,
    required this.name,
    required this.location,
    required this.distance,
    required this.rating,
    required this.imageUrl,
    required this.price,
    required this.sports,
  });
} 