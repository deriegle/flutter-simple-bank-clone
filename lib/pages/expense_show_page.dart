import 'package:flutter/material.dart';
import 'package:simple_expenses/date_formatter.dart';
import 'package:simple_expenses/models/expense.dart';
import 'package:simple_expenses/navigation_controller.dart';
import 'package:simple_expenses/pages/memo_edit_page.dart';

class ExpenseShowPage extends StatefulWidget {
  final Expense expense;

  const ExpenseShowPage({Key key, @required this.expense}) : super(key: key);

  @override
  _ExpenseShowPageState createState() => _ExpenseShowPageState();
}

class _ExpenseShowPageState extends State<ExpenseShowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.attach_file),
            onPressed: () {
              print('show alert dialog for taking photo, choosing photo or choosing document');
            },
          ),
          IconButton(
            icon: Icon(Icons.chat_bubble_outline),
            onPressed: () {
              print('open contact support page');
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              print('Open popup menu for reporting transaction');
            },
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                widget.expense.name,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                DateFormatter.formatLong(widget.expense.date),
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flex(
                    direction: Axis.horizontal,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Flexible(
                        child: Container(
                          child: Text(
                            '\$${widget.expense.amount.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        flex: 3,
                        fit: FlexFit.tight,
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            widget.expense.category,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      NavigationController.of(context).push(MemoEditPage(expense: widget.expense));
                    },
                    child: Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        widget.expense.notes.isEmpty
                            ? 'Add notes, #hashtags, and emojis here'
                            : widget.expense.notes,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Spending from', style: TextStyle(color: Colors.white)),
                        Text('Safe-to-Spend', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Made by', style: TextStyle(color: Colors.white)),
                        Row(
                          children: <Widget>[
                            CircleAvatar(
                              child: Text('D', style: TextStyle(fontSize: 12)),
                              maxRadius: 10,
                            ),
                            SizedBox(width: 5),
                            Text('Devin Riegle', style: TextStyle(color: Colors.white)),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    height: 20,
                    child: widget.expense.location == null || widget.expense.location.isEmpty
                        ? Container()
                        : Text(widget.expense.location, style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
