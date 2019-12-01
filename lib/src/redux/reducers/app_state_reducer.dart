import 'package:store_it/src/redux/models/app_state.dart';
import 'package:store_it/src/redux/reducers/reducers.dart';

AppState appReducer(AppState state, action){
  return AppState(
    products: productReducer(state.products, action),
  );
}