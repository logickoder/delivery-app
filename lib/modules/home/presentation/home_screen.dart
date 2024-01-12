import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/app/theme.dart';
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
    return Scaffold(
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle(
          statusBarColor: AppColor.of(context).background,
        ),
        child: const SafeArea(
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
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
      ),
    );
  }
}
