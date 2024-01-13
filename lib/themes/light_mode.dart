import 'package:flutter/material.dart';

/// Light mode theme configuration.
ThemeData lightMode = ThemeData(
      // Custom color scheme for light mode.
      colorScheme: const ColorScheme.light(
            brightness: Brightness.light,  // Set brightness to light.
            background: Colors.white,      // Background color in light mode.
            primary: Colors.black,         // Primary text and icon color in light mode.
            secondary: Colors.orange,      // Secondary color in light mode.
            inversePrimary: Colors.white,  // Inverse color for primary elements in light mode.
      ),
);
