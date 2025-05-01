import 'dart:io';

import 'package:mobx/mobx.dart';

import '../models/category.dart';

part 'create_store.g.dart';

class CreateStore = _CreateStore with _$CreateStore;

abstract class _CreateStore with Store {
  ObservableList image = ObservableList<File>();

  @observable
  Category? category;

  @observable
  bool hidePhone = false;

  @action
  setHidePhone(bool value) => hidePhone = value;

  @action
  setCategory(Category value) => category = value;

  @action
  void addImage(File? file) {
    if (file != null) {
      image.add(file);
    }
  }
}
