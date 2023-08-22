import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

//import 'package:meal/screens/categories.dart';
import 'package:meal/screens/tabs.dart';
//  
void main() {
  runApp(const MyApp());
}

final theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color(0xFF833900),),
      //textTheme : GoogleFonts.latoTextTheme() ,
      fontFamily: "Oswald",
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:theme,
      home: const TabsScreen(),
    );
  }
}