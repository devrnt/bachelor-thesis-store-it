import 'package:store_it/src/redux/models/app_state.dart';
import 'package:store_it/src/redux/reducers/preferences_reducer.dart';
import 'package:store_it/src/redux/reducers/products_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    products: productReducer(state.products, action),
    preferences: preferencesReducer(state.preferences, action),
  );
}
