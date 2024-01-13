import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final light = _get(
    color: const AppColor(
      primary: Color(0xFFFFD337),
      onPrimary: Color(0xFF96823D),
      primaryDark: Color(0xFFFFCE23),
      secondary: Color(0xFF000000),
      background: Color(0xFFFFFFFF),
      onBackground: Color(0xFF424242),
      card: Color(0xFFF1F6FB),
      onCard: Color(0xFFBBBFD0),
      title: Color(0xFF092C4C),
      listTitle: Color(0xFF2E3E5C),
      sectionTitle: Color(0xFF1E3354),
      primaryTitle: Color(0xFF031725),
      onboardingTitle: Color(0xFF041C2E),
      body: Color(0xFF7A809D),
      border: Color(0xFF031420),
    ),
    base: ThemeData.light(),
  );

  static final dark = _get(
    color: const AppColor(
      primary: Color(0xFFFFD337),
      onPrimary: Color(0xFF96823D),
      primaryDark: Color(0xFFFFCE23),
      secondary: Color(0xFF000000),
      background: Color(0xFFFFFFFF),
      onBackground: Color(0xFF424242),
      card: Color(0xFFF1F6FB),
      onCard: Color(0xFFBBBFD0),
      title: Color(0xFF092C4C),
      listTitle: Color(0xFF2E3E5C),
      sectionTitle: Color(0xFF1E3354),
      primaryTitle: Color(0xFF031725),
      onboardingTitle: Color(0xFF041C2E),
      body: Color(0xFF7A809D),
      border: Color(0xFF031420),
    ),
    base: ThemeData.dark(),
  );

  static ThemeData _get({required AppColor color, required ThemeData base}) {
    return base.copyWith(
      colorScheme: ColorScheme.fromSeed(
        seedColor: color.primary,
        primary: color.primary,
        onPrimary: color.background,
        background: color.background,
        surface: color.card,
        onSurface: color.body,
        onBackground: color.body,
      ),
      extensions: [
        color,
      ],
      scaffoldBackgroundColor: color.background,
      appBarTheme: AppBarTheme(
        backgroundColor: color.background,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: color.background,
          backgroundColor: color.secondary,
          disabledBackgroundColor: color.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(52),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        ),
      ),
      inputDecorationTheme: () {
        final border = OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: color.border, width: 0.5),
        );
        return InputDecorationTheme(
          border: border,
          enabledBorder: border,
          focusedBorder: border,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 34,
          ),
          hintStyle: TextStyle(color: color.border),
        );
      }(),
      textTheme: () {
        final theme = GoogleFonts.interTextTheme().apply(
          bodyColor: color.body,
          displayColor: color.body,
        );
        return theme.copyWith(
          bodyLarge: theme.bodyLarge?.copyWith(
            color: color.border,
            fontWeight: FontWeight.w500,
          ),
        );
      }(),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: color.border,
        selectionHandleColor: color.border,
      ),
    );
  }
}

class AppColor extends ThemeExtension<AppColor> {
  const AppColor({
    required this.primary,
    required this.onPrimary,
    required this.primaryDark,
    required this.secondary,
    required this.background,
    required this.onBackground,
    required this.card,
    required this.onCard,
    required this.title,
    required this.listTitle,
    required this.sectionTitle,
    required this.primaryTitle,
    required this.onboardingTitle,
    required this.body,
    required this.border,
  });

  final Color primary;
  final Color onPrimary;
  final Color primaryDark;
  final Color secondary;
  final Color background;
  final Color onBackground;
  final Color card;
  final Color onCard;
  final Color title;
  final Color listTitle;
  final Color sectionTitle;
  final Color primaryTitle;
  final Color onboardingTitle;
  final Color body;
  final Color border;

  static AppColor of(BuildContext context) {
    return Theme.of(context).extension<AppColor>()!;
  }

  @override
  ThemeExtension<AppColor> copyWith({
    Color? primary,
    Color? onPrimary,
    Color? primaryDark,
    Color? secondary,
    Color? background,
    Color? onBackground,
    Color? card,
    Color? onCard,
    Color? title,
    Color? listTitle,
    Color? sectionTitle,
    Color? primaryTitle,
    Color? onboardingTitle,
    Color? body,
    Color? border,
  }) {
    return AppColor(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      primaryDark: primaryDark ?? this.primaryDark,
      secondary: secondary ?? this.secondary,
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
      card: card ?? this.card,
      onCard: onCard ?? this.onCard,
      title: title ?? this.title,
      listTitle: listTitle ?? this.listTitle,
      sectionTitle: sectionTitle ?? this.sectionTitle,
      primaryTitle: primaryTitle ?? this.primaryTitle,
      onboardingTitle: onboardingTitle ?? this.onboardingTitle,
      body: body ?? this.body,
      border: border ?? this.border,
    );
  }

  @override
  ThemeExtension<AppColor> lerp(
    covariant ThemeExtension<AppColor>? other,
    double t,
  ) {
    if (other is! AppColor) {
      return this;
    }

    return AppColor(
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      primaryDark: Color.lerp(primaryDark, other.primaryDark, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      background: Color.lerp(background, other.background, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
      card: Color.lerp(card, other.card, t)!,
      onCard: Color.lerp(onCard, other.onCard, t)!,
      title: Color.lerp(title, other.title, t)!,
      listTitle: Color.lerp(listTitle, other.listTitle, t)!,
      sectionTitle: Color.lerp(sectionTitle, other.sectionTitle, t)!,
      primaryTitle: Color.lerp(primaryTitle, other.primaryTitle, t)!,
      onboardingTitle: Color.lerp(onboardingTitle, other.onboardingTitle, t)!,
      body: Color.lerp(body, other.body, t)!,
      border: Color.lerp(border, other.border, t)!,
    );
  }
}
