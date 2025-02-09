// main.dart
import 'package:KURONIME_APP/page/search.dart';
import 'package:KURONIME_APP/page/splash.dart';
import 'package:flutter/material.dart';
import 'package:KURONIME_APP/page/home.dart';
import 'package:KURONIME_APP/page/episode.dart';
import 'package:KURONIME_APP/page/jadwal.dart';
import 'package:KURONIME_APP/page/login.dart';
import 'package:KURONIME_APP/page/navbar.dart';
import 'package:KURONIME_APP/page/nonton.dart';
import 'package:KURONIME_APP/page/profile.dart';
import 'package:KURONIME_APP/page/setting.dart';
import 'package:KURONIME_APP/page/jadwal.dart';
import 'package:KURONIME_APP/page/search.dart';
import 'package:KURONIME_APP/page/splash.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
} 