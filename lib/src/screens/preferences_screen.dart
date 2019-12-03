import 'package:flutter/material.dart';

class PreferencesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Nachmodus',
            style: Theme.of(context).textTheme.caption,
          ),
          Switch(
            key: Key('theme_switch'),
            activeColor: Theme.of(context).accentColor,
            value: false,
            onChanged: (value) => print('state should be updated'),
          ),
        ],
      ),
    );
  }
}
