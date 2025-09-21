import 'package:flutter/material.dart';

Widget promoCard(String title, String subtitle, String badge, String image) {
  return Container(
    margin: const EdgeInsets.only(bottom: 12),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.08),
          blurRadius: 6,
          offset: Offset(2, 4),
        ),
      ],
    ),
    child: Row(
      children: [
        // Left: image
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(image, width: 60, height: 60, fit: BoxFit.cover),
        ),
        SizedBox(width: 12),

        // Center: texts (Expanded to fill space)
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              SizedBox(height: 4),
              Text(subtitle,
                  style: TextStyle(color: Colors.grey[600], fontSize: 14)),
            ],
          ),
        ),

        // Right: badge
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            badge,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}
