import 'package:flutter/material.dart';

import 'core/app/theme.dart';
import 'modules/dashboard/presentation/dashboard_screen.dart';
import 'modules/login/presentation/login_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery App',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id: (_) => const LoginScreen(),
        DashboardScreen.id: (_) => const DashboardScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
