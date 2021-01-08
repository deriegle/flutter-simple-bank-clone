import 'package:flutter/material.dart';

class SafeToSpend extends StatelessWidget implements PreferredSizeWidget {
  final double amount;
  final Function onPressed;

  const SafeToSpend({
    Key key,
    @required this.amount,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        margin: const EdgeInsets.only(top: 1),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage('https://picsum.photos/50'),
                  maxRadius: 10,
                ),
                SizedBox(width: 10),
                Text('Safe-to-Spend', style: TextStyle(color: Colors.white)),
              ],
            ),
            Text('\$${amount.toStringAsFixed(2)}', style: TextStyle(color: Colors.white))
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(300, 40);
}

class SafeToSpendDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey,
      titlePadding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      titleTextStyle: TextStyle(fontSize: 15, color: Colors.black),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Available balance', style: TextStyle(color: Colors.white)),
          Text('\$14.63', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ],
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('- Expenses', style: TextStyle(color: Colors.white.withAlpha(200))),
                Text('\$0.00', style: TextStyle(color: Colors.white.withAlpha(200))),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('- Goals', style: TextStyle(color: Colors.white.withAlpha(200))),
                Text('\$0.00', style: TextStyle(color: Colors.white.withAlpha(200))),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('- Scheduled', style: TextStyle(color: Colors.white.withAlpha(200))),
                Text('\$0.00', style: TextStyle(color: Colors.white.withAlpha(200))),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Safe-to-Spend', style: TextStyle(color: Colors.white)),
                  Text('\$14.63',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
