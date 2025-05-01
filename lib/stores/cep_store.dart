import 'package:mobx/mobx.dart';
import 'package:xlo/models/adress.dart';

import '../repositories/cep_repository.dart';

part 'cep_store.g.dart';

class CepStore = _CepStore with _$CepStore;

abstract class _CepStore with Store {
  _CepStore() {
    autorun((_) {
      if (clearCep?.length != 8) {
        _reset();
      } else {
        _searchCep();
      }
    });
  }
  @observable
  String? cep;

  @observable
  String? errorText;

  @observable
  Address? address;

  @observable
  bool loading = false;

  @action
  void setCep(String value) => cep = value;

  @computed
  String? get clearCep => cep?.replaceAll(RegExp('[^0-9]'), '');

  @action
  Future<void> _searchCep() async {
    loading = true;
    try {
      address = await CepRepository().getAdressFromApi(clearCep);
      errorText = null;
    } catch (error) {
      errorText = error.toString();
      address = null;
      return Future.error('cep inexistente');
    }
    loading = false;
  }

  @action
  void _reset() {
    errorText = null;
    address = null;
  }
}
