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


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: lightMode,
      darkTheme: darkMode,
      home: const HomePage(),
    );
  }
}

