import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:xlo/repositories/parse_erros.dart';

import '../models/category.dart';

class CategoryRepository {
  Future<Iterable<Category>?> getCategoryList() async {
    List<Category> list = [];
    final QueryBuilder queryBuilder = QueryBuilder(ParseObject('Category'))
      ..orderByAscending('name');
    final response = await queryBuilder.query();
    if (response.success) {
      return response.results?.map((i) => Category.fromParseObject(i)).toList();
    } else {
      throw ParseErrors.getDescription(response.error!.code) as Object;
    }
    return null;
  }
}
