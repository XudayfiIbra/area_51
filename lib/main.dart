import 'package:area_51/pages/calculator.dart';
import 'package:area_51/theme/theme_prodiver.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Calculator(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
