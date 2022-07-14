import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Expenses',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Loged in'),
        ),
        body: Center(
          child: Text('Welcome'),
        ),
      ),
    );
  }
}