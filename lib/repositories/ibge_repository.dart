import 'package:dio/dio.dart';
import 'package:xlo/models/city.dart';
import 'package:xlo/models/uf.dart';

class IBGERepository {
  Future<List<UF>?> getUFListFromAPI() async {
    const String endpoint =
        'http://servicodados.ibge.gov.br/api/v1/localidades/estados';
    try {
      final response = await Dio().get<List>(endpoint);
      final ufList =
          response.data?.map<UF>((i) => UF.fromJason(i)).toList()?..sort(
            (a, b) => a.name!.toLowerCase().compareTo(b.name!.toLowerCase()),
          );
      return ufList;
    } on DioException {
      return Future.error('falha ao obter a lista de estados');
    }
  }

  Future<List<City>> getCityListFromAPI(UF uf) async {
    final String endpoint =
        'http://servicodados.ibge.gov.br/api/v1/localidades/estados/${uf.id}/municipios';

    try {
      final response = await Dio().get(endpoint);
      final cityList =
          response.data.map<City>((c) => City.fromJson(c)).toList();
      return cityList;
    } on DioException {
      return Future.error('nao foi possivel carregar as cidades');
    }
  }
}
