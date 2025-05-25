import 'package:mobx/mobx.dart';

part 'filter_store.g.dart';

enum OrderBy { DATA, PRICE }

const VENDOR_TYPE_PARTICULAR = 1 << 0;
const VENDOR_TYPE_PROFESSIONAL = 1 << 1;

class FilterStore = _FilterStore with _$FilterStore;

abstract class _FilterStore with Store {
  @observable
  OrderBy? orderBy = OrderBy.DATA;

  @action
  setOrderBy(OrderBy value) => orderBy = value;

  @observable
  num? minPrice;

  @action
  num? setMinPrice(num? value) => value != null ? minPrice = value : null;

  @observable
  num? maxPrice;

  @action
  num? setMaxPrice(num? value) => value != null ? maxPrice = value : null;

  @computed
  String? get priceError =>
      maxPrice != null && minPrice != null && maxPrice! < minPrice!
          ? 'Preço invalido!'
          : null;

  @computed
  bool get isTypeParticular => (vendorType & VENDOR_TYPE_PARTICULAR) != 0;
  bool get isTypeProfessional => (vendorType & VENDOR_TYPE_PROFESSIONAL) != 0;

  @observable
  int vendorType = VENDOR_TYPE_PROFESSIONAL;

  @action
  void selectorVendorType(int value) => vendorType = value;
  void setVendorType(int value) => vendorType = vendorType | value;
  void resetVendorType(int value) => vendorType = vendorType & ~value;
}
