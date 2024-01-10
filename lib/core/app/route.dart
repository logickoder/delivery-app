import 'package:flutter/widgets.dart';

import '../../modules/home/presentation/home_screen.dart';
import '../../modules/login/presentation/login_screen.dart';

class AppRoute {
  static const login = '/';
  static const home = '/home';

  static Map<String, WidgetBuilder> get routes => {
        login: (_) => const LoginScreen(),
        home: (_) => const HomeScreen(),
      };
}
