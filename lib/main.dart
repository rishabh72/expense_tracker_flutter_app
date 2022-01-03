import 'package:flutter/material.dart';
import 'widgets/chart.dart';
import 'widgets/transaction_list.dart';
import 'widgets/new_transaction.dart';
import 'models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.black,
        errorColor: Colors.orange,
        fontFamily: 'OpenSans',
        textTheme: TextTheme(
            headline6: TextStyle(
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            button: TextStyle(color: Colors.white)),
        // textTheme: ThemeData.light().textTheme.copyWith(
        //       headline6: TextStyle(
        //         fontFamily: 'Quicksand',
        //         fontWeight: FontWeight.bold,
        //         fontSize: 18,
        //       ),
        //     ),
        // appBarTheme: AppBarTheme(
        //   textTheme: ThemeData.light().textTheme.copyWith(
        //         headline6: TextStyle(
        //           fontFamily: 'Caveat',
        //           fontSize: 25,
        //         ),
        //       ),
        // ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'Caveat',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: '1',
      title: "test",
      amount: 123,
      date: DateTime.now(),
    ),
    Transaction(
        id: '1',
        title: "test",
        amount: 120,
        date: DateTime.now().subtract(Duration(days: 1))),
    Transaction(
        id: '1',
        title: "test",
        amount: 223,
        date: DateTime.now().subtract(Duration(days: 2))),
    Transaction(
        id: '1',
        title: "test",
        amount: 22,
        date: DateTime.now().subtract(Duration(days: 3))),
    Transaction(
        id: '1',
        title: "test",
        amount: 102,
        date: DateTime.now().subtract(Duration(days: 5))),
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: chosenDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTx(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction(_addNewTransaction);
      },
    );
  }

  void _deleteTx(String txId) {
    setState(() {
      _userTransactions.removeWhere((element) => element.id == txId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text(
        'Personal Expenses',
      ),
      actions: [
        IconButton(
          onPressed: () => _startAddNewTx(context),
          icon: Icon(
            Icons.add,
          ),
        )
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Chart(_recentTransactions),
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  .4,
            ),
            Container(
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.6,
                child: TransactionList(_userTransactions, _deleteTx)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _startAddNewTx(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
