import 'dart:io';

import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:path/path.dart' as path;
import 'package:xlo/repositories/parse_erros.dart';
import 'package:xlo/stores/filter_store.dart';

import '../models/ad.dart';
import '../models/user.dart';

class AdRepository {
  Future<List<Ad>> getHomeAdList({
    required FilterStore filter,
    required String? search,
    category,
  }) async {
    final queryBuilder = QueryBuilder<ParseObject>(ParseObject('Ad'));
    queryBuilder.includeObject(['user', 'category']);
    queryBuilder.setLimit(20);
    queryBuilder.whereEqualTo('status', AdStatus.ACTIVE.index);
    if (search != null && search.trim().isNotEmpty) {
      queryBuilder.whereContains('title', search, caseSensitive: false);
    }
    if (category?.id != null && category.id != '*') {
      queryBuilder.whereEqualTo(
        'category',
        (ParseObject('Category')..set('objectId', category.id)).toPointer(),
      );
    }
    switch (filter.orderBy) {
      case OrderBy.PRICE:
        queryBuilder.orderByAscending('price');
        break;
      case OrderBy.DATA:
      default:
        queryBuilder.orderByDescending('createdAt');
        break;
    }
    if (filter.maxPrice != null) {
      queryBuilder.whereLessThanOrEqualTo('price', filter.maxPrice);
    }

    if (filter.minPrice != null) {
      queryBuilder.whereGreaterThanOrEqualsTo('price', filter.minPrice);
    }

    if (filter.vendorType != null &&
        filter.vendorType! > 0 &&
        filter.vendorType! <
            (VENDOR_TYPE_PROFESSIONAL | VENDOR_TYPE_PARTICULAR)) {
      final userQuery = QueryBuilder<ParseUser>(ParseUser.forQuery());
      if (filter.vendorType == VENDOR_TYPE_PARTICULAR) {
        userQuery.whereEqualTo('type', UserType.PARTICULAR.index);
      }
      if (filter.vendorType == VENDOR_TYPE_PROFESSIONAL) {
        userQuery.whereEqualTo('type', UserType.PROFESSIONAL.index);
      }
      //queryBuilder.whereMatchesQuery('user', userQuery);
    }
    print('resultado das pesquisa');
    print('-------------------------55555555555555555555---------------------');
    print('valor adStatus ${AdStatus.ACTIVE.index}');
    print('valor search ${search?.isEmpty}');
    print('valor catetoria ${category?.id}');
    print('valor orderby ${filter.orderBy}');
    print('valor prico min ${filter.minPrice}');
    print('valor prico max ${filter.maxPrice}');
    print('valor vendotype ${filter.vendorType}');

    print('-------------------------55555555555555555555555------------------');

    final response = await queryBuilder.query();
    if (response.success && response.results != null) {
      print('--------------------------------------------------------------');
      print(response.results);
      print('--------------------------------------------------------------');
      return response.results!.map((ad) => Ad.fromParse(ad)).toList();
    } else if (response.success && response.results == null) {
      return [];
    } else {
      final error = response.error;
      if (error != null) {
        return Future.error(ParseErrors.getDescription(error.code).toString());
      } else {
        return [];
      }
    }
  }

  Future<void> save(Ad ad) async {
    try {
      final parseImages = await saveImages(ad.images);
      ParseUser parseUser = ParseUser(
        ad.user?.email,
        ad.user?.password1,
        ad.user?.email,
      )..objectId = ad.user?.id;
      ParseObject adObject = ParseObject('Ad');
      ParseACL parseACL = ParseACL(owner: parseUser);
      parseACL.setPublicReadAccess(allowed: true);
      parseACL.setPublicWriteAccess(allowed: false);
      adObject.setACL(parseACL);
      adObject.set<String>('title', ad.title ?? 'nao definido');
      adObject.set<String>('description', ad.description ?? 'nao definido');
      adObject.set<bool>('hidePhone', ad.hidePhone ?? false);
      adObject.set<num>('price', ad.price ?? 0);
      adObject.set<int>('status', ad.status?.index ?? 0);
      adObject.set<String>('rua', ad.address?.rua ?? 'nao definido');
      adObject.set<String>('number', ad.address?.number ?? 'nao definido');
      adObject.set<String>('district', ad.address?.district ?? 'nao definido');
      adObject.set<String>('city', ad.address?.city?.name ?? 'nao definido');
      adObject.set<String>('UF', ad.address?.uf?.initials ?? 'nao definido');
      adObject.set<String>('cep', ad.address?.cep ?? 'nao definido');
      adObject.set<List<ParseFile>>('files', parseImages);
      adObject.set<ParseUser>('user', parseUser);
      adObject.set<ParseObject>(
        'category',
        ParseObject('Category')..set('objectId', ad.category?.id),
      );
      ParseResponse response = await adObject.save();
      if (!response.success) {
        return Future.error(
          ParseErrors.getDescription(response.error!.code).toString(),
        );
      }
    } catch (e) {
      return Future.error('Falha ao sava anuncio $e');
    }
  }

  Future<List<ParseFile>> saveImages(List? images) async {
    final parseImages = <ParseFile>[];
    try {
      if (images != null) {
        for (final image in images) {
          if (image is File) {
            ParseFile parseFile = ParseFile(
              image,
              name: path.basename(image.path),
            );
            final response = await parseFile.save();
            if (!response.success) {
              return Future.error('erro grave');
            }
            parseImages.add(parseFile);
          } else {
            // url
            final parseFile = ParseFile(null);
            parseFile.name = path.basename(image);
            parseFile.url = image;
            parseImages.add(parseFile);
          }
        }
      }
    } catch (e) {
      return Future.error('Erro ao carregar imagens $e');
    }

    return parseImages;
  }
}
