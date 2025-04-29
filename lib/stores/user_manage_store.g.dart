// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_manage_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserManageStore on _UserManageStore, Store {
  Computed<bool>? _$isLoggedInComputed;

  @override
  bool get isLoggedIn =>
      (_$isLoggedInComputed ??= Computed<bool>(() => super.isLoggedIn,
              name: '_UserManageStore.isLoggedIn'))
          .value;

  late final _$userAtom = Atom(name: '_UserManageStore.user', context: context);

  @override
  User? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$_UserManageStoreActionController =
      ActionController(name: '_UserManageStore', context: context);

  @override
  void setUser(User value) {
    final _$actionInfo = _$_UserManageStoreActionController.startAction(
        name: '_UserManageStore.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$_UserManageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
isLoggedIn: ${isLoggedIn}
    ''';
  }
}
