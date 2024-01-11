import 'package:flutter/material.dart';

import '../../home/presentation/home_screen.dart';
import '../../shared/widgets/bottom_bar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedIndex = 0;

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemBuilder: _pageBuilder,
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomBar(
        selectedIndex: selectedIndex,
        onIndexSelected: _onPageChanged,
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  NullableIndexedWidgetBuilder get _pageBuilder {
    return (context, index) {
      switch (index) {
        case 0:
          return const HomeScreen();
        case 1:
          return const Center(child: Text('Bookmark Screen'));
        case 2:
          return const Center(child: Text('Chat Screen'));
        case 3:
          return const Center(child: Text('Settings Screen'));
        default:
          return const SizedBox();
      }
    };
  }

  void _onPageChanged(int index) {
    setState(() => selectedIndex = index);
    _pageController.animateToPage(
      index,
      duration: Durations.short4,
      curve: Curves.bounceIn,
    );
  }
}
