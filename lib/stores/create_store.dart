import 'dart:io';
import 'dart:ui';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo/models/ad.dart';
import 'package:xlo/models/adress.dart';
import 'package:xlo/repositories/ad_repository.dart';
import 'package:xlo/stores/cep_store.dart';
import 'package:xlo/stores/user_manage_store.dart';

import '../models/category.dart';

part 'create_store.g.dart';

class CreateStore = _CreateStore with _$CreateStore;

abstract class _CreateStore with Store {
  ObservableList image = ObservableList<File>();

  @observable
  Category? category;

  @action
  setCategory(Category value) => category = value;

  @computed
  bool get categoryValid => category != null;

  @computed
  String? get categoryError {
    if (categoryValid) {
      return null;
    } else {
      return 'Category Obrigatoria';
    }
  }

  CepStore cepStore = CepStore();

  @computed
  Address? get address => cepStore.address;
  bool get addressValid => address != null;
  String? get addressError {
    if (addressValid) {
      return null;
    } else {
      return 'Campo obrigatorio';
    }
  }

  @computed
  bool get imageIsValid => image.isNotEmpty;

  @observable
  String title = '';

  @observable
  String description = '';

  @action
  void setTitle(value) => title = value;

  @action
  void setDescription(value) => description = value;

  @computed
  bool get titleValid => title.length >= 6;

  @computed
  bool get descriptionValid => description.length >= 10;

  @computed
  String? get descriptionError {
    if (descriptionValid) {
      return null;
    } else if (description.isEmpty) {
      return 'Campo obrigatorio';
    } else {
      return 'Descricao muito curta';
    }
  }

  @computed
  String? get errorTitle {
    if (titleValid) {
      return null;
    } else if (title.isEmpty) {
      return 'Campo obrigatorio';
    } else {
      return 'Titulo muito curto';
    }
  }

  @computed
  String? get errorMessage {
    if (imageIsValid) {
      return null;
    } else {
      return 'porfavor insirar imagens';
    }
  }

  @observable
  bool hidePhone = false;

  @action
  setHidePhone(bool value) => hidePhone = value;

  @action
  void addImage(File? file) {
    if (file != null) {
      image.add(file);
    }
  }

  @observable
  String priceText = '';

  @action
  void setPrice(String value) => priceText = value;

  @computed
  num? get price {
    if (priceText.contains(',')) {
      return num.tryParse(priceText.replaceAll(RegExp('[^0-9]'), ''))! / 100;
    } else {
      return num.tryParse(priceText);
    }
  }

  @computed
  bool get priceValid => price != null;

  @computed
  String? get priceError {
    if (priceValid) {
      return null;
    } else if (priceText.isEmpty) {
      return 'Campo obrigatorio0';
    } else {
      return 'Preco invalido';
    }
  }

  @computed
  bool get formValid =>
      imageIsValid &&
      titleValid &&
      descriptionValid &&
      categoryValid &&
      addressValid &&
      priceValid;

  @computed
  VoidCallback? get sendPressed => formValid ? _send : null;

  @observable
  bool showErros = false;

  @action
  void invalidSendPressed() => showErros = true;

  @action
  Future<void> _send() async {
    final ad = Ad(
      images: image,
      title: title,
      description: description,
      category: category,
      address: address,
      price: price,
      hidePhone: hidePhone,
      user: GetIt.I<UserManageStore>().user,
    );
    loading = true;
    try {
      savedAd = await AdRepository().save(ad);
    } catch (e) {
      resultError = e.toString();
    }
    loading = false;
  }

  @observable
  String? resultError;

  @observable
  Ad? savedAd;

  @observable
  bool loading = false;
}
