import 'package:flutter/material.dart';
import 'package:indestak_news/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    MaterialColor colorSeed = Colors.deepPurple;
    ValueNotifier<bool>materialNofier = ValueNotifier(false);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Indestak News',

      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: colorSeed)
      ),
      home: Home(),
    );
  }
}

