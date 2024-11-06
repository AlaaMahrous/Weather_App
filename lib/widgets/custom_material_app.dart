import 'package:flutter/material.dart';
import 'package:weather_app/views/home_view.dart';

class CustomMaterialApp extends StatelessWidget {
  const CustomMaterialApp({
    super.key,
    required this.color
  });
  final Color color;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        hintStyle: const TextStyle(color: Colors.grey),
        labelStyle: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: color,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        suffixIconColor: Colors.grey,
      ),
      appBarTheme: AppBarTheme(
        color: color,
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: color,
      ),
    ),
      home: const HomeView(),
    );
  }
}