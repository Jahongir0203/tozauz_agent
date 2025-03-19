import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tozauz_agent/features/home/presentation/pages/home_screen.dart';
import 'package:tozauz_agent/features/payment/presentation/pages/payment/payment_screen.dart';
import 'package:tozauz_agent/features/profile/presentation/pages/profile/profile_screen.dart';
import 'package:tozauz_agent/features/reports/presentation/pages/reports_screen.dart';

import '../core/utils/locale_keys.g.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    ReportsScreen(),
    PaymentScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue, // Change color as needed
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: LocaleKeys.containers.tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: LocaleKeys.reports.tr(),
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: LocaleKeys.wallet.tr(),
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: LocaleKeys.profile.tr(),
          ),
        ],
      ),
    );
  }
}
