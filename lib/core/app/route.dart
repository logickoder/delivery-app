import 'package:flutter/widgets.dart';

import '../../modules/dashboard/presentation/dashboard_screen.dart';
import '../../modules/login/presentation/login_screen.dart';

class AppRoute {
  static const login = '/';
  static const dashboard = '/dashboard';

  static Map<String, WidgetBuilder> get routes => {
        login: (_) => const LoginScreen(),
        dashboard: (_) => const DashboardScreen(),
      };
}
