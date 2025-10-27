import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals/screens/tabs_screens.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
  // ignore: unused_local_variable
  final theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 30, 37, 233),
      brightness: Brightness.light,
    ),
    textTheme: GoogleFonts.latoTextTheme(),
  );
}

var darkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 31, 11, 181),
);
final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: const Color.fromARGB(255, 18, 7, 72),
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: AppBarTheme(
    backgroundColor: darkColorScheme.onPrimaryContainer,
    foregroundColor: Colors.white,
    elevation: 0,
  ),
  drawerTheme: DrawerThemeData(
    backgroundColor: darkColorScheme.onPrimaryContainer,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.black87),
    bodyMedium: TextStyle(color: Colors.black87),
    titleLarge: TextStyle(
      color: Color.fromARGB(255, 255, 255, 255),
      fontWeight: FontWeight.bold,
    ),
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const TabsScreens(),
      darkTheme: darkTheme,
    );
  }
}
