import 'dart:convert';

class UserModel {
  final String? token;
  final int? id;
  final String? phoneNumber;
  final String? firstName;
  final String? role;

  UserModel({
    this.token,
    this.id,
    this.phoneNumber,
    this.firstName,
    this.role,
  });

  UserModel copyWith({
    String? token,
    int? id,
    String? phoneNumber,
    String? firstName,
    String? role,
  }) =>
      UserModel(
        token: token ?? this.token,
        id: id ?? this.id,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        firstName: firstName ?? this.firstName,
        role: role ?? this.role,
      );

  factory UserModel.fromRawJson(String str) => UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    token: json["token"],
    id: json["id"],
    phoneNumber: json["phone_number"],
    firstName: json["first_name"],
    role: json["role"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "id": id,
    "phone_number": phoneNumber,
    "first_name": firstName,
    "role": role,
  };
}
