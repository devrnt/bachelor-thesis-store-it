import 'package:flutter/material.dart';
import 'package:store_it/src/blocs/bloc_provider.dart';
import 'package:store_it/src/blocs/preferences_bloc.dart';

class PreferencesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final preferencesBloc = BlocProvider.of<PreferencesBloc>(context);

    return StreamBuilder<bool>(
      stream: preferencesBloc.isDarkTheme,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
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
                    value: snapshot.data,
                    onChanged: (_) => preferencesBloc.toggleTheme.add(_),
                  ),
                ],
              ),
            );
            break;
          default:
            return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
