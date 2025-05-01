import 'package:dio/dio.dart';
import 'package:xlo/models/adress.dart';
import 'package:xlo/models/city.dart';

import 'ibge_repository.dart';

class CepRepository {
  Future<Address?> getAdressFromApi(String? cep) async {
    if (cep == null || cep.isEmpty) {
      return Future.error('cep invalido vazio ou nulo');
    }
    final clearCep = cep.replaceAll(RegExp('[^0-9]'), '');
    if (clearCep.length != 8) {
      return Future.error('cep invalido sem numeros suficiente');
    }
    final enpoint = 'https://viacep.com.br/ws/$clearCep/json/';
    try {
      final response = await Dio().get(enpoint);
      if (response.data['erro'] != null) {
        return Future.error('cep invalido tem erro');
      }
      final ufList = await IBGERepository().getUFListFromAPI();
      return Address(
        cep: response.data['cep'],
        district: response.data['bairro'],
        city: City(name: response.data['localidade']),
        rua: response.data['logradouro'],
        uf: ufList?.firstWhere((uf) => uf.initials == response.data['uf']),
        state: response.data['estado'],
      );
    } on DioException {
      return Future.error('erro ao buscar o cep');
    } catch (e) {
      print(e);
      Future.error('falha ao buscar cep');
    }
    return null;
  }
}
