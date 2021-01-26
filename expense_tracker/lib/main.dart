import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import './transaction.dart ';

void main() {
  initializeDateFormatting('de', null);
  runApp(MyApp());
}

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
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 99.99, date: DateTime.now()),
    Transaction(
        id: 't1', title: 'Groceries', amount: 25.21, date: DateTime.now())
  ];
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            child: Card(
              child: Text('CHART'),
              color: Colors.blueAccent,
              elevation: 5,
            ),
          ),
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: titleController,
                    //onChanged: (transactionName) =>
                        //this.titleInput = transactionName,
                    decoration: InputDecoration(labelText: 'Transaction name:'),
                  ),
                  TextField(
                    controller: amountController,
                    //onChanged: (transactionAmount) =>
                        //this.amountInput = transactionAmount,
                    decoration: InputDecoration(labelText: 'Amount:'),
                  ),
                  FlatButton(
                    onPressed: () {
                      transactions.add(Transaction(
                          id: transactions.length.toString(),
                          date: DateTime.now(),
                          title: titleController.text,
                          amount: double.parse(amountController.text)));
                      print('There are a total of ${transactions.length} transactions now');
                    },
                    child: Text('Add Transcation'),
                    textColor: Colors.deepPurple,
                  )
                ],
              ),
            ),
          ),
          Column(
            children: transactions
                .map((tx) => Card(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Colors.lightBlueAccent[700],
                            Colors.white
                          ]),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Colors.deepPurple,
                                  Colors.lightBlueAccent[700]
                                ]),
                                color: Colors.blueGrey,
                                border: Border.all(
                                    color: Colors.tealAccent,
                                    width: 2,
                                    style: BorderStyle.solid),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              padding: EdgeInsets.all(10),
                              child: Text(
                                '${tx.amount.toString()}€',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  tx.title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text(
                                  DateFormat.yMMMMd("de_CH").format(tx.date),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueGrey),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
