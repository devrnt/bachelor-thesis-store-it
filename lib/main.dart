import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:store_it/src/redux/containers/add_product.dart';
import 'package:store_it/src/redux/containers/preferences.dart';
import 'package:store_it/src/redux/containers/products.dart';
import 'package:store_it/src/redux/models/app_state.dart';
import 'package:store_it/src/redux/reducers/app_state_reducer.dart';
import 'package:store_it/src/selectors/selectors.dart';
import 'package:store_it/src/theme/theme.dart' as storeItTheme;

void main() => runApp(MyAppWithStore());

class MyAppWithStore extends StatelessWidget {
  final reduxStore = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: reduxStore,
      child: MyApp(),
    );
  }
}

class _BottomNavigationItem {
  final Icon icon;
  final String toolTip;

  _BottomNavigationItem({this.icon, this.toolTip});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(
      builder: (context, store) {
        return MaterialApp(
          title: 'Store It',
          theme: isDarkThemeSelector(store.state)
              ? storeItTheme.Theme.darkTheme
              : storeItTheme.Theme.lightTheme,
          home: Screen(),
        );
      },
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
    Products(),
    AddProduct(),
    Preferences(),
  ];

  static const _fragmentTitles = [
    'Winkelen',
    'Product toevoegen',
    'Voorkeuren',
  ];

  static final _bottomNavItems = <_BottomNavigationItem>[
    _BottomNavigationItem(icon: Icon(Icons.home), toolTip: 'home_tab'),
    _BottomNavigationItem(
        icon: Icon(Icons.add_circle_outline), toolTip: 'add_product_tab'),
    _BottomNavigationItem(icon: Icon(Icons.tune), toolTip: 'preferences_tab'),
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
          children: _bottomNavItems.map((bottomNavItem) {
            final iconIndex = _bottomNavItems.indexOf(bottomNavItem);
            return IconButton(
              tooltip: bottomNavItem.toolTip,
              disabledColor: Theme.of(context).accentColor,
              icon: bottomNavItem.icon,
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
