import 'package:flutter/material.dart';
import 'package:news_c10_online/shared/style/theme.dart';
import 'package:news_c10_online/ui/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routes: {
        HomeScreen.routeName:(_)=>HomeScreen()
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}

