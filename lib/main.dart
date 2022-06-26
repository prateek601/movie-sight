import 'package:flutter/material.dart';
import 'package:trending_movies/app/data/values/env.dart';
import 'package:trending_movies/app/modules/home/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Env.title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xff0e0f15)
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}
