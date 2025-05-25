import 'package:mobx/mobx.dart';
import 'package:xlo/models/category.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  @observable
  String search = '';

  @observable
  Category? category;

  @action
  setCategory(Category? value) => category = value;

  @action
  setSearch(String value) => search = value;
}
