import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:xlo/models/adress.dart';
import 'package:xlo/models/category.dart';
import 'package:xlo/models/city.dart';
import 'package:xlo/models/uf.dart';
import 'package:xlo/models/user.dart';
import 'package:xlo/repositories/user_repository.dart';

enum AdStatus { PENDING, ACTIVE, SOLD, DELETED }

class Ad {
  Ad({
    this.images,
    this.title,
    this.id,
    this.description,
    this.category,
    this.address,
    this.price,
    this.hidePhone,
    this.status,
    this.user,
    this.created,
    this.views = 0,
  });
  Ad.fromParse(ParseObject parseObject) {
    id = parseObject.objectId;
    title = parseObject.get<String>('title');
    description = parseObject.get<String>('description');
    images = parseObject.get<List>('files')?.map((e) => e.url).toList();
    hidePhone = parseObject.get<bool>('hidePhone');
    price = parseObject.get<num>('price');
    created = parseObject.createdAt;
    address = Address(
      cep: parseObject.get<String>('cep'),
      district: parseObject.get<String>('district'),
      city: City(name: parseObject.get<String>('city')),
      uf: UF(initials: parseObject.get<String>('UF')),
    );
    views = parseObject.get<int>('views', defaultValue: 0) ?? 0;
    user = UserRepository().mapParseToUser(parseObject.get<ParseUser>('user'));
    category = Category.fromParseObject(
      parseObject.get<ParseObject>('category'),
    );
    final st = parseObject.get<int>('status');
    status = (st == null ? AdStatus.values[0] : AdStatus.values[st]);
  }

  List? images = [];
  String? title;
  String? id;
  String? description;
  Category? category;
  Address? address;
  num? price;
  bool? hidePhone;
  AdStatus? status;
  DateTime? created;
  User? user;
  int views = 0;
}
