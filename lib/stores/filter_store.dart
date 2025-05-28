import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo/stores/home_store.dart';

part 'filter_store.g.dart';

enum OrderBy { DATA, PRICE }

const VENDOR_TYPE_PARTICULAR = 1 << 0;
const VENDOR_TYPE_PROFESSIONAL = 1 << 1;

class FilterStore = _FilterStore with _$FilterStore;

abstract class _FilterStore with Store {
  _FilterStore({
    this.orderBy = OrderBy.DATA,
    this.minPrice,
    this.maxPrice,
    this.vendorType = VENDOR_TYPE_PROFESSIONAL,
  });
  @observable
  OrderBy? orderBy = OrderBy.DATA;

  @action
  setOrderBy(OrderBy value) => orderBy = value;

  @observable
  num? minPrice;

  @action
  num? setMinPrice(num? value) => minPrice = value;

  @observable
  num? maxPrice;

  @action
  num? setMaxPrice(num? value) => maxPrice = value;

  @computed
  String? get priceError =>
      maxPrice != null && minPrice != null && maxPrice! < minPrice!
          ? 'Preço invalido!'
          : null;

  @computed
  bool get isTypeParticular => (vendorType! & VENDOR_TYPE_PARTICULAR) != 0;
  bool get isTypeProfessional => (vendorType! & VENDOR_TYPE_PROFESSIONAL) != 0;

  @observable
  int? vendorType;

  @action
  void selectorVendorType(int value) => vendorType = value;
  void setVendorType(int value) =>
      vendorType != null ? vendorType = vendorType! | value : null;
  void resetVendorType(int value) =>
      vendorType != null ? vendorType = vendorType! & ~value : null;

  @computed
  bool get isFormValid => priceError == null;

  void save() {
    GetIt.I<HomeStore>().setFilter(this as FilterStore);
  }

  FilterStore clone() {
    return FilterStore(
      orderBy: orderBy,
      minPrice: minPrice,
      maxPrice: maxPrice,
      vendorType: vendorType,
    );
  }
}
