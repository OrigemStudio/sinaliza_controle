import 'package:sinaliza_controle/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emporio Controle',
      theme: ThemeData(
        primaryColor: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

