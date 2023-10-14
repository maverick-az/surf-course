import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/presets/strings/app_strings.dart';
import 'package:surf_flutter_courses_template/screens/profile_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appTitle,
      theme: ThemeData(
        fontFamily: 'Rubic wet paint',
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.redAccent,
          ),
        ),
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          elevation: 0.0,
          titleTextStyle: theme.textTheme.headlineMedium?.copyWith(
            fontFamily: 'Rubic wet paint',
            color: Colors.redAccent,
          ),
        ),
        iconTheme: IconTheme.of(context).copyWith(
          color: Colors.redAccent,
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Colors.redAccent,
          linearTrackColor: Colors.white10,
        ),
      ),
      home: const ProfileScreen(),
    );
  }
}
