import 'package:flutter/material.dart';
import 'package:loginsignup/Screens/splash/splashscreen.dart';

void main() {
  runApp(Alumni_Connect());
}

class Alumni_Connect extends StatelessWidget {
  const Alumni_Connect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(),
      routes: {
        '/home': (context) => AnimatedSplashScreen(), // Your main app screen
      },
    );
  }
}



