import 'package:store_it/src/redux/models/app_state.dart';
import 'package:store_it/src/redux/models/product.dart';

List<Product> productsSelector(AppState state) => state.products;

bool isDarkThemeSelector(AppState state) => state.preferences.isDarkTheme;
