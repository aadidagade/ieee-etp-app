
import 'package:flutter/material.dart';
import 'theme/app_colors.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const LearnHubAdmin());
}

class LearnHubAdmin extends StatelessWidget {
  const LearnHubAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LearnHub Admin',

      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
        ),
        fontFamily: 'Roboto',
      ),

      home: const LoginScreen(),
    );
  }
}
