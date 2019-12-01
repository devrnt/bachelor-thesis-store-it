import 'package:flutter/material.dart';

class PreferencesScreen extends StatelessWidget {
  final bool isDarkTheme;
  final Function onToggleTheme;

  PreferencesScreen({
    @required this.isDarkTheme,
    @required this.onToggleTheme,
  });

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
            activeColor: Theme.of(context).accentColor,
            value: isDarkTheme,
            onChanged: (value) => onToggleTheme(),
          ),
        ],
      ),
    );
  }
}
