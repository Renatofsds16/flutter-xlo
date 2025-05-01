import 'package:xlo/models/city.dart';
import 'package:xlo/models/uf.dart';

class Address {
  Address({
    this.uf,
    this.city,
    this.cep,
    this.district,
    this.rua,
    this.number,
    this.state,
  });
  UF? uf;
  City? city;
  String? cep;
  String? number;
  String? state;
  String? district;
  String? rua;

  @override
  String toString() {
    return 'Address{uf: $uf, city: $city, cep: $cep, number: $number, state: $state, district: $district, rua: $rua}';
  }
}
