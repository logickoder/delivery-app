import 'package:flutter/material.dart';

import 'core/app/route.dart';
import 'core/app/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery App',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      routes: AppRoute.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
