import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:store_it/src/mobx/store/main_store.dart';

class PreferencesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final preferencesStore = Provider.of<MainStore>(context).preferencesStore;

    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Nachmodus',
            style: Theme.of(context).textTheme.caption,
          ),
          Observer(builder: (context) {
            return Switch(
              key: Key('theme_switch'),
              activeColor: Theme.of(context).accentColor,
              value: preferencesStore.isDarkTheme,
              onChanged: (value) => preferencesStore.toggleTheme(),
            );
          }),
        ],
      ),
    );
  }
}
