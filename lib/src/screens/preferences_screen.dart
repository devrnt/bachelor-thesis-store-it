import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_it/src/models/preferences.dart';

class PreferencesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Preferences>(
      builder: (context, model, child) {
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
                value: model.isDarkTheme,
                onChanged: (value) => model.toggleTheme(),
              ),
            ],
          ),
        );
      },
    );
  }
}
