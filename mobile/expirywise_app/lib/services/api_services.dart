import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/food_item.dart';

class ApiServices {
  // Points Flutter to the backend
  static const String baseUrl = 'http://10.0.2.2:5000/api';

  Future<List<FoodItem>> fetchFoodItems() async {
    final url = Uri.parse('$baseUrl/food-items');

    // This line sends the request to the backend.
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Failed to load food items');
    }

    // Converts JSON text into Dart data
    final data = jsonDecode(response.body);
    // Extracts the food items array
    final items = data['items'] as List;

    return items.map((item){
      // Converts each JSON item into FoodItem object
      return FoodItem.fromJson(item);
    }).toList();
  }
}