import 'package:flutter/material.dart';
import 'chartBar.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;
  const Chart(this.recentTransaction);
  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalsum = 0.0;
      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekDay.day &&
            recentTransaction[i].date.month == weekDay.month &&
            recentTransaction[i].date.year == weekDay.year) {
          totalsum += recentTransaction[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalsum
      };
    });
  }

  double get totalSpending {
    return groupedTransactions.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 30,
        margin: EdgeInsets.all(10),
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: groupedTransactions.map((e) {
                return Flexible(
                  fit: FlexFit.tight,
                  child: ChartBar(
                      e['day'],
                      e['amount'],
                      totalSpending == 0.0
                          ? 0.0
                          : (e['amount'] as double) / totalSpending),
                );
              }).toList(),
            )));
  }
}
