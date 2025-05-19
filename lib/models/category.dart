import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class Category {
  Category({this.id, this.name, this.createdAt});
  Category.fromParseObject(ParseObject? parseObject) {
    if (parseObject != null) {
      id = parseObject.objectId;
      name = parseObject.get('name');
      createdAt = parseObject.get('createdAt');
    }
  }
  String? id;
  String? name;
  DateTime? createdAt;

  @override
  String toString() {
    return 'Category{id: $id, name: $name, createdAt: $createdAt}';
  }
}
