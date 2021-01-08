import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Expenses',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: MyHomePage(title: 'Activity'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AppDrawer extends StatelessWidget {
  get backgroundColor => Colors.black.withAlpha(175);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 50, left: 20, bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage('https://picsum.photos/50'),
                  maxRadius: 20,
                ),
                SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Devin Riegle',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Your account', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: backgroundColor,
              border: Border(bottom: BorderSide(color: Colors.grey, width: 1)),
            ),
          ),
          _buildDrawerItem(icon: Icons.ac_unit, title: 'Activity', onPressed: () {}),
          _buildDrawerItem(icon: Icons.ac_unit, title: 'Scheduled', onPressed: () {}),
          _buildDrawerItem(icon: Icons.ac_unit, title: 'Expenses', onPressed: () {}),
          _buildDrawerItem(icon: Icons.ac_unit, title: 'Goals', onPressed: () {}),
          Container(height: 1, color: Colors.grey),
          _buildDrawerItem(icon: Icons.ac_unit, title: 'Move money', onPressed: () {}),
          _buildDrawerItem(icon: Icons.ac_unit, title: 'Rules', onPressed: () {}),
          Container(height: 1, color: Colors.grey),
          _buildDrawerItem(icon: Icons.ac_unit, title: 'Simple Bulletin', onPressed: () {}),
          Container(height: 1, color: Colors.grey),
          _buildDrawerItem(icon: Icons.ac_unit, title: 'Refer a friend', onPressed: () {}),
          _buildDrawerItem(icon: Icons.ac_unit, title: 'Support', onPressed: () {}),
          _buildDrawerItem(icon: Icons.ac_unit, title: 'Personal Info', onPressed: () {}),
          _buildDrawerItem(icon: Icons.ac_unit, title: 'Account details', onPressed: () {}),
          _buildDrawerItem(icon: Icons.ac_unit, title: 'App settings', onPressed: () {}),
          Container(height: 1, color: Colors.grey),
          _buildDrawerItem(icon: Icons.ac_unit, title: 'Sign out', onPressed: () {}),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    @required IconData icon,
    @required String title,
    @required Function onPressed,
  }) {
    return Container(
      color: backgroundColor,
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(title, style: TextStyle(color: Colors.white)),
        onTap: onPressed,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

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

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  onHamburgerMenuPress() {
    print('hamburger menu pressed');
  }

  onMoreActionPress() {
    print('More pressed');
  }

  onSafeToSpendPress(BuildContext ctx) async {
    return showDialog<void>(
      context: ctx,
      barrierDismissible: true,
      builder: (BuildContext context) {
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withAlpha(230),
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: onMoreActionPress,
          )
        ],
        bottom: SafeToSpend(amount: 0, onPressed: () => onSafeToSpendPress(context)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      drawer: AppDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
