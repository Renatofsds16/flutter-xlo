import 'dart:io';

import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:path/path.dart' as path;
import 'package:xlo/repositories/parse_erros.dart';

import '../models/ad.dart';

class AdRepository {
  Future<Ad> save(Ad ad) async {
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
      if (response.success) {
        return Ad.fromParse(response.result);
      } else {
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
