import 'package:flutter/material.dart';
import 'widgets/user_transactions.dart';

// We have split code into multiple widgets UserTransactions, NewTransaction, TransactionList
// We have created UserTransactions widget for managing state
// because we dont want to convert MyHomePage into stateful widget
// if we would convert then after changing state MaterialApp, Scaffold will create again

// To convert string into double
// double.parse(strNum)

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: Card(
              child: Text('Chart'),
              elevation: 5,
              color: Colors.green,
            ),
          ),
          UserTransactions(),
        ],
      ),
    );
  }
}
