import 'package:flutter/material.dart';
import 'new_transaction.dart';
import 'transaction_list.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {

  final List<Transaction> _userTransaction = [
    Transaction(
      id: 't1',
      title: 'New shoes',
      amount: 69.69,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Pants',
      amount: 18.24,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String title, var amount){
    
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        NewTransaction(),
        TransactionList(_userTransaction),
      ],
    );
  }
}
