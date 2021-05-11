import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deletetx,
  }) : super(key: key);

  final transaction;
  final Function deletetx;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
            radius: 30,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: FittedBox(child: Text('\$${transaction.amount}')),
            )),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(DateFormat.yMEd().format(transaction.date)),
        trailing: MediaQuery.of(context).size.width > 460
            ? FlatButton.icon(
                onPressed: () => deletetx(transaction.id),
                icon: Icon(Icons.delete),
                label: Text('Delete'),
                textColor: Theme.of(context).errorColor,
              )
            : IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => deletetx(transaction.id),
              ),
      ),
    );
  }
}
