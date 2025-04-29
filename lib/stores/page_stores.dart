
import 'package:mobx/mobx.dart';

part 'page_stores.g.dart';

class PageStores = _PageStores with _$PageStores;

abstract class _PageStores with Store{
  @observable
  int page = 0;

  @action
  void setPage(int value){
    page = value;

  }
}