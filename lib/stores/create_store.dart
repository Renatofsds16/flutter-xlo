import 'dart:io';

import 'package:mobx/mobx.dart';

part 'create_store.g.dart';

class CreateStore = _CreateStore with _$CreateStore;

abstract class _CreateStore with Store {
  ObservableList image = ObservableList<File>();

  @action
  void addImage(File? file) {
    if (file != null) {
      image.add(file);
    }
  }
}
