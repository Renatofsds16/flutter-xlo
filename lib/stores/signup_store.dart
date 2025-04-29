
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo/help/extensions.dart';
import 'package:xlo/stores/user_manage_store.dart';

import '../models/user.dart';
import '../repositories/user_repository.dart';

part 'signup_store.g.dart';

class SignupStore = _SignupStore with _$SignupStore;

abstract class _SignupStore with Store{

  //campo name
  @observable
  String name = '';

  @action
  void setName(String value)=> name = value;

  @computed
  bool get nameIsValid => name.length > 5;

  @computed
  String? get nameError {
    if(name.isEmpty || nameIsValid){
      return null;
    }else if(name.isEmpty){
      return 'Este campo e obrigatorio';
    }else{
      return 'Nome muito curto';
    }

  }

  //campo email
  @observable
  String email = '';

  @action
  void setEmail(String value)=> email = value;

  @computed
  String? get emailError{
    if(email.isEmpty || emailIsValid){
      return null;
    }else{
      return 'E-mail invalido';
    }
  }
  @computed
  bool get emailIsValid => email.isEmailValid();

  //phone
  @observable
  String phone = '';

  @action
  void setPhone(String value)=> phone = value;

  @computed
  bool get phoneIsValid => phone.length >= 14;


  @computed
  String? get phoneError{
    if(phone.isEmpty || phoneIsValid){
      return null;
    }else{
      return 'Telefone invalido';
    }
  }

  @observable
  String? errorParse;

  @observable
  String password = '';

  @action
  void setPassword(String value)=> password = value;

  @computed
  bool get passIsValid => password.length >= 6;

  @computed
  String? get passwordError{
    if(password.isEmpty || passIsValid){
      return null;
    }else{
      return 'senha muito curta';
    }
  }




  @observable
  String password2 = '';

  @action
  void setPassword2(String value)=> password2 = value;

  @computed
  bool get pass2IsValid => password2.length >= 6 && password == password2;

  @computed
  String? get password2Error{
    if(password2.isEmpty || pass2IsValid){
      return null;
    }else{
      return 'verifique as senhas';
    }
  }

  @computed
  bool get isFormValid => nameIsValid && emailIsValid && phoneIsValid && passIsValid && pass2IsValid;


  @observable
  bool loading = false;

  @action
  setLoading(bool value) => loading = value;

  @action
  Future<void> signUp()async{
    errorParse = null;
    loading = true;
    final User user = User(name: name,email: email,password1:password,phone: phone);
    try {
      final User userResponse = await UserRepository().signUp(user);
      GetIt.I<UserManageStore>().setUser(userResponse);
      if(userResponse.id != null){
        errorParse = null;
      }
    }catch (error) {
      errorParse = error.toString();
    }

        loading = false;

      }


}