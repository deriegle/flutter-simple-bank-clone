import 'package:flutter/material.dart';
import 'package:simple_expenses/models/expense.dart';
import 'package:simple_expenses/navigation_controller.dart';
import 'package:simple_expenses/register_services.dart';
import 'package:simple_expenses/services/expense_service.dart';

class MemoEditPage extends StatefulWidget {
  final Expense expense;

  const MemoEditPage({Key key, @required this.expense}) : super(key: key);

  @override
  _MemoEditPageState createState() => _MemoEditPageState();
}

class _MemoEditPageState extends State<MemoEditPage> {
  TextEditingController memoTextController;

  @override
  void initState() {
    memoTextController = TextEditingController(text: widget.expense.notes ?? '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.expense.name),
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Edit memo',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: 40,
              height: 5,
              color: Colors.white,
            ),
            Container(
              color: Colors.white30,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: memoTextController,
                decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  hintText: 'Add notes, #hashtags, and emojis here',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width,
              child: FlatButton(
                  child: Text('Save'),
                  color: Colors.blue,
                  onPressed: () async {
                    getIt
                        .get<ExpenseService>()
                        .updateNotes(widget.expense.id, memoTextController.text);
                    NavigationController.of(context).pop();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
