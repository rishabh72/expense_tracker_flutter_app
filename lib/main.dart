import 'package:flutter/material.dart';
import 'widgets/user_transactions.dart';

// To display only 2 digits after decimal, we can use toStringAsFixed() method
// We also want that if user pressed done button after entering amount,
// then newTransaction Fn should also trigger for that we can use onSubmitted property in TextField

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
      body: SingleChildScrollView(
        child: Column(
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
      ),
    );
  }
}
