import 'dart:convert';

class User {
  final String id;
  final String fullName;
  final String email;
  final String provinsi;
  final String kabKot;
  final String kodepos;
  final String password;

  User(
      {required this.id,
      required this.fullName,
      required this.email,
      required this.provinsi,
      required this.kabKot,
      required this.kodepos,
      required this.password});

  //serialization: convert user object to a map
  //map: is a collection of key-value pairs
  //why?: converting to a map is intermidiate step that make it easier to serialize object

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "fullName": fullName,
      "email": email,
      "provinsi": provinsi,
      "kabKot": kabKot,
      "kodepos": kodepos,
      "password": password
    };
  }

  //serialization: convert map to a json string
  //this method directly encodes the data from the map
  //into json string

  //json encode converts dart object into json string
  String toJson() => json.encode(toMap());

  //deserialization convert Map into User object
  //factory constructor takes Map and converts to user object if a firls is
  //not present and the default is empty string

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        id: map['id'] as String? ?? "",
        fullName: map['fullName'] as String? ?? "",
        email: map['email'] as String? ?? "",
        provinsi: map['provinsi'] as String? ?? "",
        kabKot: map['kabKot'] as String? ?? "",
        kodepos: map['kodepos'] as String? ?? "",
        password: map['password'] as String? ?? "");
  }

  //fromJson takes json string and decode into a map then uses fromMap
  //to convert that map into user object

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
