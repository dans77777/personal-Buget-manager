import 'package:flutter/material.dart';
import '../widgets/transactionItem.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deletetx;
  const TransactionList(this.transactions, this.deletetx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: transactions.isEmpty
          ? LayoutBuilder(builder: (context, constraints) {
              return Column(
                children: <Widget>[
                  Text(
                    'No transactions added yet!',
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: constraints.maxHeight * 0.7,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      )),
                ],
              );
            })
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return TransactionItem(
                    transaction: transactions[index], deletetx: deletetx);
              },
              itemCount: transactions.length,
            ),
    );
  }
}
