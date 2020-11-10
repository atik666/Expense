import 'package:flutter/material.dart';
import '../main.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {

  String _titleInput;
  String _amountInput;
  DateTime _selectedDate;

  void _submitData() {
    if (_titleInput.isEmpty || double.parse(_amountInput) <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(
      _titleInput,
      double.parse(_amountInput),
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null){
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
                _titleInput = val;
              },
              onSubmitted: (_) => _submitData,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              keyboardType: TextInputType.number,
              onChanged: (val) => _amountInput = val,
              onSubmitted: (_) => _submitData,
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _selectedDate == null?
                      'No date chosen' : 'Picked date: ${DateFormat.yMMMd().format(_selectedDate)}',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  FlatButton(
                    color: Colors.grey[350],
                    textColor: Theme.of(context).primaryColor,
                    child: Text(
                      'Choose date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    onPressed: _presentDatePicker,
                  ),
                ],
              ),
            ),
            Center(
              child: FlatButton(
                color: Colors.grey[350],
                onPressed: _submitData,
                child: Text(
                  'Add Transaction',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                textColor: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
