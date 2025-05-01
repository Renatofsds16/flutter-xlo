class UF {
  UF({this.id, this.initials, this.name});
  int? id;
  String? initials;
  String? name;

  factory UF.fromJason(Map<String, dynamic> map) {
    return UF(id: map['id'], initials: map['sigla'], name: map['nome']);
  }

  @override
  String toString() {
    return 'UF{id: $id, initials: $initials, name: $name}';
  }
}
