class FoodItem {
  // Defines what my app expects from the backend.
  final int id;
  final String name;
  final String category;
  final num quantity;
  final String unit;
  final String purchaseDate;
  final String expiryDate;
  final double estimatedCost;
  final String storageLocation;
  final String status;

  const FoodItem({
    required this.id,
    required this.name,
    required this.category,
    required this.quantity,
    required this.unit,
    required this.purchaseDate,
    required this.expiryDate,
    required this.estimatedCost,
    required this.storageLocation,
    required this.status,
  });

  // Converts backend JSON into a Dart object
  // Take one JSON food item from the backend and turn it into a FoodItem object.
  factory FoodItem.fromJson(Map<String, dynamic> json) {
   return FoodItem(
     id: json['id'],
     name: json['name'],
     category: json['category'],
     quantity: json['quantity'],
     unit: json['unit'],
     purchaseDate: json['purchaseDate'],
     expiryDate: json['expiryDate'],
     estimatedCost: (json['estimatedCost'] as num).toDouble(),
     storageLocation: json['storageLocation'],
     status: json['status'],
   );
  }
}