import 'package:flutter/material.dart';
import 'package:flutter_expenses/screens/login.dart';
import 'package:flutter_expenses/screens/register.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses App',
      home: const Login(),
      routes: {
        '/login': (context) => const Login(),
        '/register': (context) => const Register(),
      },
    );
  }
}
