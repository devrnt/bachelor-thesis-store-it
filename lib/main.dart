import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_it/src/blocs/bloc_provider.dart';
import 'package:store_it/src/blocs/preferences_bloc.dart';
import 'package:store_it/src/blocs/store_bloc.dart';
import 'package:store_it/src/screens/add_product_screen.dart';
import 'package:store_it/src/screens/home_screen.dart';
import 'package:store_it/src/screens/preferences_screen.dart';
import 'package:store_it/src/theme/theme.dart' as storeItTheme;

void main() => runApp(
      BlocProvider<PreferencesBloc>(
        bloc: PreferencesBloc(),
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final preferencesBloc = BlocProvider.of<PreferencesBloc>(context);

    return BlocProvider<StoreBloc>(
      bloc: StoreBloc(),
      child: StreamBuilder<bool>(
        stream: preferencesBloc.isDarkTheme,
        initialData: false,
        builder: (context, snapshot) {
          return MaterialApp(
            title: 'Store It',
            theme: snapshot.data
                ? storeItTheme.Theme.darkTheme
                : storeItTheme.Theme.lightTheme,
            home: Screen(),
          );
        },
      ),
    );
  }
}

class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  var _selectedTabIndex = 0;

  final _screens = <Widget>[
    HomeScreen(),
    AddProductScreen(),
    PreferencesScreen(),
  ];

  static const _fragmentTitles = [
    'Winkelen',
    'Product toevoegen',
    'Voorkeuren',
  ];

  static const _bottomNavItems = [
    Icon(Icons.home),
    Icon(Icons.add_circle_outline),
    Icon(Icons.tune),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            _fragmentTitles.elementAt(_selectedTabIndex),
            style: TextStyle(
              color: Theme.of(context).textTheme.title.color,
              fontSize: 22.0,
              fontFamily: 'Asap',
            ),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 22.0),
        child: _screens.elementAt(_selectedTabIndex),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _bottomNavItems.map((icon) {
            final iconIndex = _bottomNavItems.indexOf(icon);
            return IconButton(
              disabledColor: Theme.of(context).accentColor,
              icon: icon,
              onPressed: _selectedTabIndex == iconIndex
                  // don't rebuild if the new tab index is the same as the current
                  ? null
                  : () => setState(() => _selectedTabIndex = iconIndex),
            );
          }).toList(),
        ),
      ),
    );
  }
}
