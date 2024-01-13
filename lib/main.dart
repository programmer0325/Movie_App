import 'package:flutter/material.dart';
import 'package:movie_app/home_page.dart';
import 'package:movie_app/provider/favorite_Movies_Provider.dart';
import 'package:movie_app/themes/dark_mode.dart';
import 'package:movie_app/themes/light_mode.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoriteMoviesProvider()),
        // Add other providers if any
      ],
      child: const MyApp(),
    ),
  );
}

/// The main application widget.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightMode,  // Set the default theme to light mode.
      darkTheme: darkMode,  // Set the dark mode theme.
      home: const HomePage(),  // Set the initial home page as HomePage.
    );
  }
}

