import 'package:flutter/material.dart';
import 'package:widget_week/src/screens/home_screen.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home': ( _ ) => HomeScreen(),
      },
    );
  }
}