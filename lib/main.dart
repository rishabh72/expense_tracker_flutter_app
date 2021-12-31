import 'package:flutter/material.dart';
import 'widgets/user_transactions.dart';

// ListView
// ListView is like "scrollable" column or Column with SingleChildScrollView
// There are two ways to define ListView
// 1) ListView(children: [...])
// 2) ListView.builder(...)

// with ListView(children: [...]), all widgets that are part of ListView
// are rendered even if they are offscreen
// ListView.builder only renders the widget that are visible

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
