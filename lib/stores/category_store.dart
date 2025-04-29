import 'package:mobx/mobx.dart';
import 'package:xlo/repositories/category_repository.dart';

import '../models/category.dart';

part 'category_store.g.dart';

class CategoryStore = _CategoryStore with _$CategoryStore;

abstract class _CategoryStore with Store {
  _CategoryStore() {
    _loadCategories();
  }
  ObservableList listCategory = ObservableList();

  @observable
  String? error;

  @computed
  List<Category> get allCategoryList =>
      List.from(listCategory)..insert(0, Category(id: '*', name: 'todas'));

  @action
  setError(String value) => error = value;

  Future<void> _loadCategories() async {
    try {
      final categories = await CategoryRepository().getCategoryList();

      if (categories != null) {
        setList(categories);
      }
    } catch (error) {
      setError(error.toString());
    }
  }

  @action
  setList(value) {
    listCategory.clear();
    listCategory.addAll(value);
  }
}
