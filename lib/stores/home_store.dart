import 'package:mobx/mobx.dart';
import 'package:xlo/models/ad.dart';
import 'package:xlo/models/category.dart';
import 'package:xlo/repositories/ad_repository.dart';
import 'package:xlo/stores/filter_store.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  _HomeStore() {
    autorun((_) async {
      setLoading(true);
      try {
        final newAds = await AdRepository().getHomeAdList(
          filter: filter,
          search: search,
          page: page,
          category: category,
        );

        adList.clear();
        adList.add(newAds);

        setError(null);
        setLoading(false);
      } catch (e) {
        setError(e.toString());
      }
    });
  }

  ObservableList<List<Ad>> adList = ObservableList<List<Ad>>();

  @observable
  String search = '';

  @observable
  Category? category;

  @action
  setCategory(Category? value) {
    category = value;
  }

  @action
  setSearch(String value) {
    search = value;
  }

  @observable
  FilterStore filter = FilterStore();

  FilterStore get cloneFilter => filter.clone();

  @action
  void setFilter(FilterStore value) {
    filter = value;
  }

  @computed
  int get itemCount => adList.length + 1;

  @observable
  String? error;

  @action
  void setError(String? value) => error = value;

  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;

  @observable
  int page = 0;

  @action
  setPage() {
    page++;
  }
}
