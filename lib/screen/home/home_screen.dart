import 'package:flutter/material.dart';
import 'package:go_laundry/content/home_screen_content.dart';
import 'package:go_laundry/content/order_screen_content.dart';
import 'package:go_laundry/content/settings_screen_content.dart';
import 'package:go_laundry/themes.dart';
import 'package:go_laundry/widgets/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreenContent(),
    const OrderScreenContent(),
    const SettingsScreenContent(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: _screens[_currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
