import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/app/theme.dart';
import '../../home/presentation/home_navigator.dart';
import '../../shared/widgets/bottom_bar.dart';

class DashboardScreen extends StatefulWidget {
  static const id = '/dashboard';

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
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle(
          statusBarColor: AppColor.of(context).background,
        ),
        child: PageView.builder(
          itemBuilder: _pageBuilder,
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
        ),
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
          return const HomeNavigator();
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
