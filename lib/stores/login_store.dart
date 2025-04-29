
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo/help/extensions.dart';
import 'package:xlo/models/user.dart';
import 'package:xlo/repositories/user_repository.dart';
import 'package:xlo/stores/user_manage_store.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store{
  @observable
  String email = '';

  @observable
  String? errorParse;

  @computed
  String? get emailError {
    if(email.isEmpty || emailIsValid){
      return null;
    }else{
      return 'E-mail invalido';
    }
  }

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailIsValid => email.isEmailValid();

  @observable
  String password = '';

  @action
  void setPassword(String value) => password = value;

  @computed
  bool get passwordIsValid => password.length >= 6;

  @computed
  String? get passwordError {
    if(email.isEmpty || passwordIsValid){
      return null;
    }else{
      return 'verifique sua senha';
    }
  }

  @computed
  bool get isFormValid => emailIsValid && passwordIsValid;

  @observable
  bool loading = false;

  @action
  Future<void> login()async{
    errorParse = null;
    loading = true;
    try {
      final User user  = await UserRepository().loginWithEmail(email, password);
      GetIt.I<UserManageStore>().setUser(user);
    }catch (erro){
      errorParse = erro.toString();
    }


    loading = false;

  }
}