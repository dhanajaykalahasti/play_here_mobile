import 'package:flutter/material.dart';
import '../models/ground.dart';

class GroundCard extends StatelessWidget {
  final Ground ground;
  final VoidCallback onTap;

  const GroundCard({
    Key? key,
    required this.ground,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 260,
        margin: EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Image placeholder
              Container(
                height: 80,
                decoration: BoxDecoration(
                  color: Color(0xFF3B82F6),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                child: Center(
                  child: Icon(
                    Icons.sports_soccer,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
              // Content area with dark background for white text
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF1E293B), // Dark background
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        ground.name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // White text on dark background
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          Icon(Icons.location_on, size: 14, color: Colors.white70),
                          SizedBox(width: 2),
                          Expanded(
                            child: Text(
                              ground.location,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white70, // Light gray text
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.star, size: 14, color: Colors.amber),
                              SizedBox(width: 2),
                              Text(
                                ground.rating.toString(),
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white, // White text
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '₹${ground.price}/hr',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF3B82F6), // Blue accent color
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2),
                      Text(
                        '${ground.distance.toStringAsFixed(1)} km away',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.white70, // Light gray text
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 