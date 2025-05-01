class City {
  City({this.id, this.name});
  factory City.fromJson(Map<String, dynamic> map) =>
      City(id: map['id'], name: map['nome']);

  int? id;
  String? name;

  @override
  String toString() {
    return 'City{id: $id, name: $name}';
  }
}
