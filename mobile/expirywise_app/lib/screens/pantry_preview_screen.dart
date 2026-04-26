import 'package:flutter/material.dart';

import '../models/food_item.dart';
import '../services/api_services.dart';

class PantryPreviewScreen extends StatefulWidget {
  const PantryPreviewScreen({super.key});

  @override
  State<PantryPreviewScreen> createState() => _PantryPreviewScreenState();
}

class _PantryPreviewScreenState extends State<PantryPreviewScreen> {
  // This stores the future API result
  late Future<List<FoodItem>> foodItemsFuture;

  @override
  void initState(){
    super.initState();
    // This line starts the API request when the screen opens
    foodItemsFuture = ApiServices().fetchFoodItems();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xFFE0F2E9),
      appBar: AppBar(
        title: const Text('Pantry Preview'),
      ),
      // This widget handles loading, error, empty, and success
      body: FutureBuilder<List<FoodItem>>(
        future: foodItemsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  'Could not load food items. \n\n${snapshot.error}',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          final foodItems = snapshot.data ?? [];

          if (foodItems.isEmpty){
            // Empty state shows when foodItems array is empty
            return const Center(
              child: Text('Your pantry is empty.')
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: foodItems.length,
            itemBuilder: (context, index) {
              final item = foodItems[index];

              return Card(
                child: ListTile(
                  leading: const Icon(Icons.kitchen, color: Colors.green),
                  title: Text(item.name),
                  subtitle: Text(
                    // Displays food items and their respective
                    // Forgot to add stupid '$' thats why the item.category was not calling and displaying properly
                    '${item.category} • Expires: ${item.expiryDate}',
                  ),
                  trailing: Text(item.status),
                ),
              );
            },
          );
        }
      )
    );
  }
}