import 'package:flutter/material.dart';

import '../../shared/widgets/greeting_text.dart';
import '../../shared/widgets/top_bar.dart';
import 'home_animation.dart';
import 'home_call_to_action.dart';
import 'home_carousel.dart';

class HomeScreen extends StatelessWidget {
  static const id = '/';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: [
            TopBar(),
            SliverToBoxAdapter(child: GreetingText()),
            SliverToBoxAdapter(child: HomeCarousel()),
            SliverPadding(
              padding: EdgeInsets.only(top: 25),
              sliver: SliverToBoxAdapter(child: HomeCallToAction()),
            ),
            SliverToBoxAdapter(child: HomeAnimation()),
          ],
        ),
      ),
    );
  }
}
