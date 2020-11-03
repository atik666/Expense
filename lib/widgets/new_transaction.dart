import 'package:flutter/material.dart';
import '../main.dart';

class NewTransaction extends StatelessWidget {

  String titleInput;
  String amountInput;

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
              onChanged: (val){
                titleInput = val;
              },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              keyboardType: TextInputType.number,
              onChanged: (val) => amountInput = val,
            ),
            FlatButton(
              color: Colors.grey,
              onPressed: () {

              },
              child: Text('Add Transaction'),
              textColor: PrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
