import 'package:mobx/mobx.dart';
import 'package:store_it/src/mobx/store/preferences/preferences.dart';
import 'package:store_it/src/mobx/store/product-store/product_store.dart';

part 'main_store.g.dart';

class MainStore = _MainStore with _$MainStore;

abstract class _MainStore with Store {
  final productStore = ProductStore();

  final preferencesStore = Preferences();
}
