import 'package:flutter/material.dart';
import 'screens/pantry_preview_screen.dart';

void main() {
  runApp(const ExpiryWiseApp());
}

class ExpiryWiseApp extends StatelessWidget {
  const ExpiryWiseApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: 'ExpiryWise', // This title is app-level metadata and IS NOT the "ExpiryWise" text that the user sees on the welcome screen
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
        ),
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
    );
  }
}

// WelcomeScreen Class
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  void showComingSoonMessage(BuildContext context, String screenName){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$screenName is coming soon!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE0F2E9),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Spacer(),
              Icon(
                Icons.eco,
                size:88,
                color: Colors.green,
              ),

              SizedBox(height: 24),

              Text(
                'ExpiryWise',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color:Color(0xFF1B3D2F),
                ),
              ),

              SizedBox(height: 12),

              Text(
                'Track groceries, reduce food waste, and use what expires first.',
                textAlign: TextAlign.center,
              ),

              Spacer(),

              SizedBox(height: 40,),

              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    FeatureRow(
                      icon:Icons.kitchen,
                      title: 'Track pantry items',
                      description: 'Add food items and their expiry dates.',
                    ),

                    SizedBox(height: 16),

                    FeatureRow(
                      icon: Icons.notifications_active,
                      title: 'Get expiry reminders',
                      description: 'Know what needs to be used soon.',
                    ),

                    SizedBox(height: 16),

                    FeatureRow(
                      icon:Icons.restaurant_menu,
                      title: 'Plan smarter meals',
                      description: 'Use ingredients before they go to waste.',
                    ),

                    SizedBox(height: 16),

                    // Get Started Button
                    ElevatedButton(
                      onPressed: () {
                        // Open a new screen on top of the current screen
                        Navigator.push(
                          context,
                          // Use a normal Android-style page transition
                          MaterialPageRoute(
                            builder: (context) => const PantryPreviewScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white
                      ),
                      child: const Text ('Get Started'),
                    ),

                    SizedBox(height: 12),

                    // I already have an account Button
                    OutlinedButton(
                      onPressed: () {
                        showComingSoonMessage(context, 'Login');
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.green
                      ),
                      child: const Text('I already have an account'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// FeatureRow Class
class FeatureRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const FeatureRow({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.green,
          size: 28,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  title,
                  style: const TextStyle(
                  fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1B3D2F),
                  ),
                ),
              Text(
                  description,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF5F6F67),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}