import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.tx,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction tx;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text('\$${tx.amount.toStringAsFixed(2)}'),
            ),
          ),
        ),
        title: Text(
          tx.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(tx.date),
        ),
        trailing: MediaQuery.of(context).size.width > 360
            ? FlatButton.icon(
                icon: const Icon(Icons.delete),
                label: const Text('delete'),
                onPressed: () => deleteTx(tx.id),
                textColor: Theme.of(context).errorColor,
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => deleteTx(tx.id),
              ),
      ),
    );
  }
}
