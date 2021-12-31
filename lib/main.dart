import 'package:flutter/material.dart';
import 'widgets/user_transactions.dart';

// Making list scrollview
// we have SingleChildScrollView() to make list scrollable
// * Element should have fixed height which is wrapped by SingleChildScrollView

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
