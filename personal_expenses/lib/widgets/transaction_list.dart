import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      child: transactions.isEmpty
        ? Column(
          children: <Widget>[
            Text('No transactions added yet', style: Theme.of(context).textTheme.title),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 200,
              child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover),
            ),
          ],
        ) : ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: FittedBox(
                      child: Text('\$${transactions[index].amount}')
                    ),
                  ),
                ),
                title: Text(
                  transactions[index].title,
                  style: Theme.of(context).textTheme.title,
                ),
                subtitle: Text(DateFormat('dd/MM/yyyy').format(transactions[index].date)),
              ),
            );
          },
        ),
    );
  }
}