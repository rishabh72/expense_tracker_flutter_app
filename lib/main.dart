import 'package:flutter/material.dart';
import 'transaction.dart';
import 'package:intl/intl.dart';

// Getting user input
// 1. using TextEditingController()
// 2. store value from onChanged to variable
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

  // String titleInput;
  // String amountInput;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

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
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    // onChanged: (value) {
                    //   titleInput = value;
                    // },
                    controller: titleController,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                    controller: amountController,
                    // onChanged: (val) => amountInput = val,
                  ),
                  FlatButton(
                    textColor: Colors.purple,
                    onPressed: () {
                      // print(titleInput);
                      // print(amountInput);
                      print(titleController.text);
                      print(amountController.text);
                    },
                    child: Text('Add Transaction'),
                  )
                ],
              ),
            ),
          ),
          Column(
            children: transactions.map(
              (tx) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        child: Text(
                          '\$${tx.amount}',
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
                            DateFormat.yMMMd().format(tx.date),
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
