import 'package:firebase_auth/firebase_auth.dart';

class AccountEntity {
  String? name;
  String? email;
  String? password;
  String? phoneNumber;
  String? location;
  AccountEntity({
    this.phoneNumber,
    this.name,
    this.location,
    this.password,
    this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'location': location,
    };
  }

  AccountEntity.fromMap(Map map)
      : name = map['name'],
        email = map['email'],
        password = map['password'],
        phoneNumber = map['phoneNumber'],
        location = map['location'];
}
