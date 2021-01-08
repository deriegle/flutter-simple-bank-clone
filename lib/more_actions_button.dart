import 'package:flutter/material.dart';

enum MoreActions { refresh }

class MoreActionsButton extends StatelessWidget {
  final Function(MoreActions) onSelected;

  const MoreActionsButton({Key key, @required this.onSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MoreActions>(
      itemBuilder: (context) => <PopupMenuEntry<MoreActions>>[
        const PopupMenuItem<MoreActions>(
          child: Text('Refresh'),
          value: MoreActions.refresh,
        ),
      ],
      onSelected: onSelected,
      icon: Icon(Icons.more_vert),
    );
  }
}
