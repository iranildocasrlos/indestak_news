import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:indestak_news/views/home.dart';

void main() async{

  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    MaterialColor colorSeed = Colors.deepPurple;

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

