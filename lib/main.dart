import 'package:flutter/material.dart';
import 'transaction.dart';

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
      id: 't1',
      title: 'New Shoes',
      amount: 34.5,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'New Bag',
      amount: 34.5,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'New Pencil Box',
      amount: 34.5,
      date: DateTime.now(),
    ),
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
          Column(
            children: transactions.map(
              (tx) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        child: Text(tx.amount.toString()),
                      ),
                      Column(
                        children: [
                          Text(tx.title),
                          Text(
                            tx.date.toString(),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ).toList(),
          )
        ],
      ),
    );
  }
}
