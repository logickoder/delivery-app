import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../orders/presentation/orders_screen.dart';
import 'home_screen.dart';

class HomeNavigator extends StatelessWidget {
  static final _key = GlobalKey<NavigatorState>();

  const HomeNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) {
          return;
        } else if (_key.currentState?.canPop() == true) {
          _key.currentState?.pop();
        } else {
          SystemNavigator.pop();
        }
      },
      child: Navigator(
        key: _key,
        initialRoute: HomeScreen.id,
        onGenerateRoute: _generateRoute,
      ),
    );
  }

  static Route<dynamic> _generateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (_) {
      switch (settings.name) {
        case HomeScreen.id:
          return const HomeScreen();
        case OrdersScreen.id:
          return const OrdersScreen();

        default:
          return const Scaffold(body: Center(child: Text('Error}')));
      }
    });
  }
}
