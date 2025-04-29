
import 'package:mobx/mobx.dart';
import 'package:xlo/models/user.dart';
import 'package:xlo/repositories/user_repository.dart';

part 'user_manage_store.g.dart';

class UserManageStore = _UserManageStore with _$UserManageStore;

abstract class _UserManageStore with Store{
  _UserManageStore(){
    _getCurrentUser();
  }

  @observable
  User? user;

  @action
  void setUser(User value) => user = value;

  @computed
  bool get isLoggedIn => user != null;

  Future<void> _getCurrentUser()async{
    final user = await UserRepository().currentUser();
    if(user != null){
      setUser(user);
    }

  }

}