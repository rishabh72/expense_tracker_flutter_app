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
                      // Container Styling
                      // Container has decoration property. With that we can add border.
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        child: Text(
                          tx.amount.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.purple,
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.purple,
                            width: 2,
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tx.title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            tx.date.toString(),
                            style: TextStyle(
                              color: Colors.grey,
                            ),
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
