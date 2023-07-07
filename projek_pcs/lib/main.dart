import 'package:flutter/material.dart';
import 'package:projek_pcs/Screen/login.dart';
import 'Screen/register.dart';
import 'Screen/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      debugShowCheckedModeBanner: false, 
      initialRoute: '/login', 
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/register': (context) => RegisterPage(),
        '/detail_pesanan': (context) => HomePage (),
      },
    );
  }
}

