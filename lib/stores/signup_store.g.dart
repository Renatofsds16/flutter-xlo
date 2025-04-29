// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignupStore on _SignupStore, Store {
  Computed<bool>? _$nameIsValidComputed;

  @override
  bool get nameIsValid =>
      (_$nameIsValidComputed ??= Computed<bool>(() => super.nameIsValid,
              name: '_SignupStore.nameIsValid'))
          .value;
  Computed<String?>? _$nameErrorComputed;

  @override
  String? get nameError =>
      (_$nameErrorComputed ??= Computed<String?>(() => super.nameError,
              name: '_SignupStore.nameError'))
          .value;
  Computed<String?>? _$emailErrorComputed;

  @override
  String? get emailError =>
      (_$emailErrorComputed ??= Computed<String?>(() => super.emailError,
              name: '_SignupStore.emailError'))
          .value;
  Computed<bool>? _$emailIsValidComputed;

  @override
  bool get emailIsValid =>
      (_$emailIsValidComputed ??= Computed<bool>(() => super.emailIsValid,
              name: '_SignupStore.emailIsValid'))
          .value;
  Computed<bool>? _$phoneIsValidComputed;

  @override
  bool get phoneIsValid =>
      (_$phoneIsValidComputed ??= Computed<bool>(() => super.phoneIsValid,
              name: '_SignupStore.phoneIsValid'))
          .value;
  Computed<String?>? _$phoneErrorComputed;

  @override
  String? get phoneError =>
      (_$phoneErrorComputed ??= Computed<String?>(() => super.phoneError,
              name: '_SignupStore.phoneError'))
          .value;
  Computed<bool>? _$passIsValidComputed;

  @override
  bool get passIsValid =>
      (_$passIsValidComputed ??= Computed<bool>(() => super.passIsValid,
              name: '_SignupStore.passIsValid'))
          .value;
  Computed<String?>? _$passwordErrorComputed;

  @override
  String? get passwordError =>
      (_$passwordErrorComputed ??= Computed<String?>(() => super.passwordError,
              name: '_SignupStore.passwordError'))
          .value;
  Computed<bool>? _$pass2IsValidComputed;

  @override
  bool get pass2IsValid =>
      (_$pass2IsValidComputed ??= Computed<bool>(() => super.pass2IsValid,
              name: '_SignupStore.pass2IsValid'))
          .value;
  Computed<String?>? _$password2ErrorComputed;

  @override
  String? get password2Error => (_$password2ErrorComputed ??= Computed<String?>(
          () => super.password2Error,
          name: '_SignupStore.password2Error'))
      .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_SignupStore.isFormValid'))
          .value;

  late final _$nameAtom = Atom(name: '_SignupStore.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$emailAtom = Atom(name: '_SignupStore.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$phoneAtom = Atom(name: '_SignupStore.phone', context: context);

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  late final _$errorParseAtom =
      Atom(name: '_SignupStore.errorParse', context: context);

  @override
  String? get errorParse {
    _$errorParseAtom.reportRead();
    return super.errorParse;
  }

  @override
  set errorParse(String? value) {
    _$errorParseAtom.reportWrite(value, super.errorParse, () {
      super.errorParse = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_SignupStore.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$password2Atom =
      Atom(name: '_SignupStore.password2', context: context);

  @override
  String get password2 {
    _$password2Atom.reportRead();
    return super.password2;
  }

  @override
  set password2(String value) {
    _$password2Atom.reportWrite(value, super.password2, () {
      super.password2 = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_SignupStore.loading', context: context);

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

  late final _$signUpAsyncAction =
      AsyncAction('_SignupStore.signUp', context: context);

  @override
  Future<void> signUp() {
    return _$signUpAsyncAction.run(() => super.signUp());
  }

  late final _$_SignupStoreActionController =
      ActionController(name: '_SignupStore', context: context);

  @override
  void setName(String value) {
    final _$actionInfo = _$_SignupStoreActionController.startAction(
        name: '_SignupStore.setName');
    try {
      return super.setName(value);
    } finally {
      _$_SignupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_SignupStoreActionController.startAction(
        name: '_SignupStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_SignupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String value) {
    final _$actionInfo = _$_SignupStoreActionController.startAction(
        name: '_SignupStore.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$_SignupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_SignupStoreActionController.startAction(
        name: '_SignupStore.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_SignupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword2(String value) {
    final _$actionInfo = _$_SignupStoreActionController.startAction(
        name: '_SignupStore.setPassword2');
    try {
      return super.setPassword2(value);
    } finally {
      _$_SignupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$_SignupStoreActionController.startAction(
        name: '_SignupStore.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_SignupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
email: ${email},
phone: ${phone},
errorParse: ${errorParse},
password: ${password},
password2: ${password2},
loading: ${loading},
nameIsValid: ${nameIsValid},
nameError: ${nameError},
emailError: ${emailError},
emailIsValid: ${emailIsValid},
phoneIsValid: ${phoneIsValid},
phoneError: ${phoneError},
passIsValid: ${passIsValid},
passwordError: ${passwordError},
pass2IsValid: ${pass2IsValid},
password2Error: ${password2Error},
isFormValid: ${isFormValid}
    ''';
  }
}
