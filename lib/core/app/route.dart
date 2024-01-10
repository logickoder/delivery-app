import 'package:flutter/widgets.dart';

import '../../modules/login/presentation/login_screen.dart';

class AppRoute {
  static const login = '/';
  static const forms = '/forms';
  static const form = '/forms/edit';

  static Map<String, WidgetBuilder> get routes => {
        login: (_) => const LoginScreen(),
        // form: (_) => const FormScreen(),
        // forms: (_) => const FormListScreen(),
      };
}
