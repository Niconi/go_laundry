import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_laundry/screen/onboarding/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: OnboardingScreen());
  }
}
