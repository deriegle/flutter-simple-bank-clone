import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  get backgroundColor => Colors.white;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: backgroundColor,
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
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Your account', style: TextStyle(color: Colors.black.withAlpha(200))),
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
            _buildDrawerItem(icon: Icons.date_range, title: 'Scheduled', onPressed: () {}),
            _buildDrawerItem(icon: Icons.table_chart, title: 'Expenses', onPressed: () {}),
            _buildDrawerItem(icon: Icons.trending_up, title: 'Goals', onPressed: () {}),
            separator,
            _buildDrawerItem(icon: Icons.attach_money, title: 'Move money', onPressed: () {}),
            _buildDrawerItem(icon: Icons.check, title: 'Rules', onPressed: () {}),
            separator,
            _buildDrawerItem(icon: Icons.notifications, title: 'Simple Bulletin', onPressed: () {}),
            separator,
            _buildDrawerItem(icon: Icons.card_giftcard, title: 'Refer a friend', onPressed: () {}),
            _buildDrawerItem(icon: Icons.chat, title: 'Support', onPressed: () {}),
            _buildDrawerItem(icon: Icons.person, title: 'Personal Info', onPressed: () {}),
            _buildDrawerItem(
                icon: Icons.account_balance, title: 'Account details', onPressed: () {}),
            _buildDrawerItem(icon: Icons.settings, title: 'App settings', onPressed: () {}),
            separator,
            _buildDrawerItem(
                icon: Icons.signal_cellular_4_bar, title: 'Sign out', onPressed: () {}),
          ],
        ),
      ),
    );
  }

  Widget get separator => Container(height: 1, color: Colors.grey);

  Widget _buildDrawerItem({
    @required IconData icon,
    @required String title,
    @required Function onPressed,
  }) {
    return Container(
      color: backgroundColor,
      child: ListTile(
        leading: Icon(icon, color: Colors.black),
        title: Text(title, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        dense: true,
        onTap: onPressed,
      ),
    );
  }
}
