import 'package:flutter/material.dart';
import 'package:flutter_expenses/providers/AuthProvider.dart';
import 'package:flutter_expenses/screens/categories.dart';
import 'package:flutter_expenses/screens/home.dart';
import 'package:flutter_expenses/screens/login.dart';
import 'package:flutter_expenses/screens/register.dart';

import 'package:flutter_expenses/providers/CategoryProvider.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CategoryProvider>(
          create: (context) => CategoryProvider(),
        ),
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        ),
      ],
      child: MaterialApp(title: 'Expenses App', routes: {
        '/': (context) {
          final authProvider = Provider.of<AuthProvider>(context);
          if (authProvider.isAuthenticated) {
            return Home();
          } else {
            return Login();
          }
        },
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        '/categories': (context) => Categories(),
      }),
    );
  }
}
