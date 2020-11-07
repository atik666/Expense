import 'package:flutter/material.dart';
import '../main.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  String titleInput;

  String amountInput;

  void submitData() {

    if (titleInput.isEmpty || double.parse(amountInput) <= 0){
      return;
    }

    widget.addTx(
      titleInput,
      double.parse(amountInput),
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              onChanged: (val) {
                titleInput = val;
              },
              onSubmitted: (_) => submitData,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              keyboardType: TextInputType.number,
              onChanged: (val) => amountInput = val,
              onSubmitted: (_) => submitData,
            ),
            FlatButton(
              color: Colors.grey,
              onPressed: submitData,
              child: Text('Add Transaction'),
              textColor: PrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
