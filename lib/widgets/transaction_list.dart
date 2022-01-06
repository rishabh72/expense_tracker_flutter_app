import 'package:flutter/material.dart';
import './transaction_item.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> list;
  final Function deleteTx;
  TransactionList(this.list, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return list.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                Text(
                  "No Transactions added yet",
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: constraints.maxHeight * .6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return TransactionItem(tx: list[index], deleteTx: deleteTx);
            },
            itemCount: list.length,
          );
  }
}
