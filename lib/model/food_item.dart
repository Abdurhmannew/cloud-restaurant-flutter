import 'package:uuid/uuid.dart';

class FoodItem {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final String description; // Added description property

  FoodItem({
    String? id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.description, // Added required description
  }) : id = id ?? Uuid().v4(); // Generate unique ID if not provided

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FoodItem && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
