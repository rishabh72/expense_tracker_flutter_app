import 'package:flutter/material.dart';
import 'transaction.dart';

// We have list of transactions [{id: 't1', title: "Bag", amount: 12, date: ""}]
// We can create new class Transaction and define type like below
// final List<Transaction> = [Transaction({id: "1",title: "Bag",amount: 12, date: DateTime.now()})]

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
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 34.5, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    print(transactions[0].date);
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
          Card(
            child: Text('List of Transactions'),
            color: Colors.pink,
          )
        ],
      ),
    );
  }
}
