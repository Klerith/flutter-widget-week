import 'package:flutter/material.dart';
import 'package:widget_week/screens/align_screen.dart';
import 'package:widget_week/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'align',
      routes: {
        'home': (_) => HomeScreen(),
        'align': (_) => AlignScreen(),
      },
    );
  }
}
