import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;

      for (var transaction in recentTransactions) {
        if (transaction.date.day == weekday.day && transaction.date.month == weekday.month && transaction.date.year == weekday.year) {
          totalSum += transaction.amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekday),
        'amount': totalSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[

        ],
      ),
    );
  }
}
