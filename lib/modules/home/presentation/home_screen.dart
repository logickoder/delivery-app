import 'package:flutter/material.dart';

import '../../../core/presentation/view_model_provider.dart';
import '../../shared/widgets/greeting_text.dart';
import '../../shared/widgets/top_bar.dart';
import 'home_animation.dart';
import 'home_call_to_action.dart';
import 'home_carousel.dart';
import 'home_view_model.dart';

class HomeScreen extends StatefulWidget {
  static const id = '/';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _viewModel = getHomeViewModel();

  @override
  void initState() {
    Future.delayed(Duration.zero, _viewModel.getProductImages);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider(
      _viewModel,
      child: const Scaffold(
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
      ),
    );
  }
}
