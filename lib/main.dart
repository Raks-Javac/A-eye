import 'package:catdogdec/src/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      title: 'My Cat vs your dog',
      debugShowCheckedModeBanner: false,
      home: const MySplashScreen(),
    );
  }
}
