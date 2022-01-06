import 'dart:math';

import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    @required this.tx,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction tx;
  final Function deleteTx;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgColor;

  @override
  void initState() {
    const colors = [
      Colors.red,
      Colors.black,
      Colors.orange,
      Colors.green,
      Colors.pink,
      Colors.teal
    ];
    _bgColor = colors[Random().nextInt(6)];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text('\$${widget.tx.amount.toStringAsFixed(2)}'),
            ),
          ),
        ),
        title: Text(
          widget.tx.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(widget.tx.date),
        ),
        trailing: MediaQuery.of(context).size.width > 360
            ? FlatButton.icon(
                icon: const Icon(Icons.delete),
                label: const Text('delete'),
                onPressed: () => widget.deleteTx(widget.tx.id),
                textColor: Theme.of(context).errorColor,
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => widget.deleteTx(widget.tx.id),
              ),
      ),
    );
  }
}
