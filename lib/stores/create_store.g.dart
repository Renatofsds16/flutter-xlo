// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateStore on _CreateStore, Store {
  Computed<bool>? _$categoryValidComputed;

  @override
  bool get categoryValid =>
      (_$categoryValidComputed ??= Computed<bool>(() => super.categoryValid,
              name: '_CreateStore.categoryValid'))
          .value;
  Computed<String?>? _$categoryErrorComputed;

  @override
  String? get categoryError =>
      (_$categoryErrorComputed ??= Computed<String?>(() => super.categoryError,
              name: '_CreateStore.categoryError'))
          .value;
  Computed<Address?>? _$addressComputed;

  @override
  Address? get address => (_$addressComputed ??=
          Computed<Address?>(() => super.address, name: '_CreateStore.address'))
      .value;
  Computed<bool>? _$imageIsValidComputed;

  @override
  bool get imageIsValid =>
      (_$imageIsValidComputed ??= Computed<bool>(() => super.imageIsValid,
              name: '_CreateStore.imageIsValid'))
          .value;
  Computed<bool>? _$titleValidComputed;

  @override
  bool get titleValid =>
      (_$titleValidComputed ??= Computed<bool>(() => super.titleValid,
              name: '_CreateStore.titleValid'))
          .value;
  Computed<bool>? _$descriptionValidComputed;

  @override
  bool get descriptionValid => (_$descriptionValidComputed ??= Computed<bool>(
          () => super.descriptionValid,
          name: '_CreateStore.descriptionValid'))
      .value;
  Computed<String?>? _$descriptionErrorComputed;

  @override
  String? get descriptionError => (_$descriptionErrorComputed ??=
          Computed<String?>(() => super.descriptionError,
              name: '_CreateStore.descriptionError'))
      .value;
  Computed<String?>? _$errorTitleComputed;

  @override
  String? get errorTitle =>
      (_$errorTitleComputed ??= Computed<String?>(() => super.errorTitle,
              name: '_CreateStore.errorTitle'))
          .value;
  Computed<String?>? _$errorMessageComputed;

  @override
  String? get errorMessage =>
      (_$errorMessageComputed ??= Computed<String?>(() => super.errorMessage,
              name: '_CreateStore.errorMessage'))
          .value;
  Computed<num?>? _$priceComputed;

  @override
  num? get price => (_$priceComputed ??=
          Computed<num?>(() => super.price, name: '_CreateStore.price'))
      .value;
  Computed<bool>? _$priceValidComputed;

  @override
  bool get priceValid =>
      (_$priceValidComputed ??= Computed<bool>(() => super.priceValid,
              name: '_CreateStore.priceValid'))
          .value;
  Computed<String?>? _$priceErrorComputed;

  @override
  String? get priceError =>
      (_$priceErrorComputed ??= Computed<String?>(() => super.priceError,
              name: '_CreateStore.priceError'))
          .value;
  Computed<bool>? _$formValidComputed;

  @override
  bool get formValid => (_$formValidComputed ??=
          Computed<bool>(() => super.formValid, name: '_CreateStore.formValid'))
      .value;
  Computed<VoidCallback?>? _$sendPressedComputed;

  @override
  VoidCallback? get sendPressed => (_$sendPressedComputed ??=
          Computed<VoidCallback?>(() => super.sendPressed,
              name: '_CreateStore.sendPressed'))
      .value;

  late final _$categoryAtom =
      Atom(name: '_CreateStore.category', context: context);

  @override
  Category? get category {
    _$categoryAtom.reportRead();
    return super.category;
  }

  @override
  set category(Category? value) {
    _$categoryAtom.reportWrite(value, super.category, () {
      super.category = value;
    });
  }

  late final _$titleAtom = Atom(name: '_CreateStore.title', context: context);

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: '_CreateStore.description', context: context);

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$hidePhoneAtom =
      Atom(name: '_CreateStore.hidePhone', context: context);

  @override
  bool get hidePhone {
    _$hidePhoneAtom.reportRead();
    return super.hidePhone;
  }

  @override
  set hidePhone(bool value) {
    _$hidePhoneAtom.reportWrite(value, super.hidePhone, () {
      super.hidePhone = value;
    });
  }

  late final _$priceTextAtom =
      Atom(name: '_CreateStore.priceText', context: context);

  @override
  String get priceText {
    _$priceTextAtom.reportRead();
    return super.priceText;
  }

  @override
  set priceText(String value) {
    _$priceTextAtom.reportWrite(value, super.priceText, () {
      super.priceText = value;
    });
  }

  late final _$showErrosAtom =
      Atom(name: '_CreateStore.showErros', context: context);

  @override
  bool get showErros {
    _$showErrosAtom.reportRead();
    return super.showErros;
  }

  @override
  set showErros(bool value) {
    _$showErrosAtom.reportWrite(value, super.showErros, () {
      super.showErros = value;
    });
  }

  late final _$resultErrorAtom =
      Atom(name: '_CreateStore.resultError', context: context);

  @override
  String? get resultError {
    _$resultErrorAtom.reportRead();
    return super.resultError;
  }

  @override
  set resultError(String? value) {
    _$resultErrorAtom.reportWrite(value, super.resultError, () {
      super.resultError = value;
    });
  }

  late final _$savedAdAtom =
      Atom(name: '_CreateStore.savedAd', context: context);

  @override
  bool get savedAd {
    _$savedAdAtom.reportRead();
    return super.savedAd;
  }

  @override
  set savedAd(bool value) {
    _$savedAdAtom.reportWrite(value, super.savedAd, () {
      super.savedAd = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_CreateStore.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$_sendAsyncAction =
      AsyncAction('_CreateStore._send', context: context);

  @override
  Future<void> _send() {
    return _$_sendAsyncAction.run(() => super._send());
  }

  late final _$_CreateStoreActionController =
      ActionController(name: '_CreateStore', context: context);

  @override
  dynamic setCategory(Category value) {
    final _$actionInfo = _$_CreateStoreActionController.startAction(
        name: '_CreateStore.setCategory');
    try {
      return super.setCategory(value);
    } finally {
      _$_CreateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTitle(dynamic value) {
    final _$actionInfo = _$_CreateStoreActionController.startAction(
        name: '_CreateStore.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_CreateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(dynamic value) {
    final _$actionInfo = _$_CreateStoreActionController.startAction(
        name: '_CreateStore.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$_CreateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setHidePhone(bool value) {
    final _$actionInfo = _$_CreateStoreActionController.startAction(
        name: '_CreateStore.setHidePhone');
    try {
      return super.setHidePhone(value);
    } finally {
      _$_CreateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addImage(File? file) {
    final _$actionInfo = _$_CreateStoreActionController.startAction(
        name: '_CreateStore.addImage');
    try {
      return super.addImage(file);
    } finally {
      _$_CreateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPrice(String value) {
    final _$actionInfo = _$_CreateStoreActionController.startAction(
        name: '_CreateStore.setPrice');
    try {
      return super.setPrice(value);
    } finally {
      _$_CreateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void invalidSendPressed() {
    final _$actionInfo = _$_CreateStoreActionController.startAction(
        name: '_CreateStore.invalidSendPressed');
    try {
      return super.invalidSendPressed();
    } finally {
      _$_CreateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
category: ${category},
title: ${title},
description: ${description},
hidePhone: ${hidePhone},
priceText: ${priceText},
showErros: ${showErros},
resultError: ${resultError},
savedAd: ${savedAd},
loading: ${loading},
categoryValid: ${categoryValid},
categoryError: ${categoryError},
address: ${address},
imageIsValid: ${imageIsValid},
titleValid: ${titleValid},
descriptionValid: ${descriptionValid},
descriptionError: ${descriptionError},
errorTitle: ${errorTitle},
errorMessage: ${errorMessage},
price: ${price},
priceValid: ${priceValid},
priceError: ${priceError},
formValid: ${formValid},
sendPressed: ${sendPressed}
    ''';
  }
}
