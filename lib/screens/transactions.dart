import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Transactions extends StatefulWidget {
  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'welcome to flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Loged in!'),
        ),
        body: Center(
          child: Text(
            'text',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        )
      )
    );
  }
  
}