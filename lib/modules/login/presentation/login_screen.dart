import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/app/asset.dart';
import '../../../core/app/dimen.dart';
import '../../../core/app/theme.dart';
import '../../dashboard/presentation/dashboard_screen.dart';
import '../../shared/widgets/carousel.dart';
import 'login_arc.dart';
import 'login_button.dart';
import 'login_view_model.dart';

class LoginScreen extends StatefulWidget {
  static const id = '/login';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _viewModel = getLoginViewModel();

  @override
  Widget build(BuildContext context) {
    final color = AppColor.of(context);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Container(
        color: color.primary,
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            LayoutBuilder(builder: (_, constraints) {
              return CustomPaint(
                painter: LoginArc(
                  color: color.primaryDark,
                  height: constraints.maxHeight * .7,
                ),
              );
            }),
            Align(
              alignment: Alignment.topRight,
              child: SvgPicture.asset(AppAsset.loginTopRightIcon),
            ),
            Align(
              alignment: Alignment.center,
              child: FractionallySizedBox(
                widthFactor: AppDimen.widthFactor,
                child: Column(
                  children: [
                    Expanded(child: SvgPicture.asset(AppAsset.loginCenterIcon)),
                    Carousel(
                      count: 3,
                      itemBuilder: (_, index) {
                        return Column(
                          children: [
                            Text(
                              'Welcome to E-Bikes',
                              style: textTheme.headlineSmall?.copyWith(
                                color: color.onboardingTitle,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Buying Electric bikes just got a lot easier, Try us today.',
                              style: TextStyle(color: color.onPrimary),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        );
                      },
                      inactiveIndicator: color.background,
                    ),
                    const SizedBox(height: 48),
                    SizedBox(
                      width: double.infinity,
                      child: ValueListenableBuilder(
                        valueListenable: _viewModel.loading,
                        builder: (_, loading, __) {
                          return LoginButton(
                            loading: loading,
                            onPressed: _onLogin,
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 48),
                      child: RichText(
                        text: TextSpan(
                          text: 'Don’t have any account? ',
                          style: TextStyle(
                            color: color.onPrimary,
                            fontWeight: FontWeight.w500,
                          ),
                          children: [
                            TextSpan(
                              text: 'Sign Up',
                              style: TextStyle(
                                color: color.primaryTitle,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onLogin() {
    _viewModel.signInWithGoogle(() {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Welcome back')),
      );
      Navigator.pushReplacementNamed(context, DashboardScreen.id);
    });
  }
}
