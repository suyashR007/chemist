import 'package:chemist/models/chemist_model.dart';
import 'package:chemist/screens/home_page.dart';
import 'package:chemist/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ChemistModelAdapter());
  await Hive.openBox<ChemistModel>('chemistList');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      home: const HomePage(),
    );
  }
}
