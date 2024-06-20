import 'package:area_51/models/note_database.dart';
import 'package:area_51/pages/calculator.dart';
import 'package:area_51/pages/note_page.dart';
import 'package:area_51/theme/theme_prodiver.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDB.initialize();
  runApp(
    ChangeNotifierProvider(
      create: (context) => NoteDB(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotePage(),
    );
  }
}
