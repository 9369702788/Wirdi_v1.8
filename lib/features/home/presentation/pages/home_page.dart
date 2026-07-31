import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wirdi/features/home/presentation/widgets/bottom_nav_bar.dart';
import 'package:wirdi/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:wirdi/features/quran/presentation/pages/quran_page.dart';
import 'package:wirdi/features/azkar/presentation/pages/azkar_page.dart';
import 'package:wirdi/features/prayer/presentation/pages/prayer_page.dart';
import 'package:wirdi/features/tasbeeh/presentation/pages/tasbeeh_page.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int _currentIndex = 0;
  
  final List<Widget> _pages = const [
    DashboardPage(),
    QuranPage(),
    AzkarPage(),
    PrayerPage(),
    TasbeehPage(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: WirdiBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
