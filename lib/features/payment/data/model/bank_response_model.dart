import 'dart:convert';

class BankResponseModel {
  final int? id;
  final UserBankModel? user;
  final int? capital;

  BankResponseModel({
    this.id,
    this.user,
    this.capital,
  });

  BankResponseModel copyWith({
    int? id,
    UserBankModel? user,
    int? capital,
  }) =>
      BankResponseModel(
        id: id ?? this.id,
        user: user ?? this.user,
        capital: capital ?? this.capital,
      );

  factory BankResponseModel.fromRawJson(String str) => BankResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BankResponseModel.fromJson(Map<String, dynamic> json) => BankResponseModel(
    id: json["id"],
    user: json["user"] == null ? null : UserBankModel.fromJson(json["user"]),
    capital: json["capital"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user": user?.toJson(),
    "capital": capital,
  };
}

class UserBankModel {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? role;
  final bool? isActive;
  final List<dynamic>? categories;
  final dynamic carNumber;
  final bool? isAdmin;
  final dynamic inn;
  final dynamic bankReceipt;

  UserBankModel({
    this.id,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.role,
    this.isActive,
    this.categories,
    this.carNumber,
    this.isAdmin,
    this.inn,
    this.bankReceipt,
  });

  UserBankModel copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? role,
    bool? isActive,
    List<dynamic>? categories,
    dynamic carNumber,
    bool? isAdmin,
    dynamic inn,
    dynamic bankReceipt,
  }) =>
      UserBankModel(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        role: role ?? this.role,
        isActive: isActive ?? this.isActive,
        categories: categories ?? this.categories,
        carNumber: carNumber ?? this.carNumber,
        isAdmin: isAdmin ?? this.isAdmin,
        inn: inn ?? this.inn,
        bankReceipt: bankReceipt ?? this.bankReceipt,
      );

  factory UserBankModel.fromRawJson(String str) => UserBankModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserBankModel.fromJson(Map<String, dynamic> json) => UserBankModel(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    phoneNumber: json["phone_number"],
    role: json["role"],
    isActive: json["is_active"],
    categories: json["categories"] == null ? [] : List<dynamic>.from(json["categories"]!.map((x) => x)),
    carNumber: json["car_number"],
    isAdmin: json["is_admin"],
    inn: json["inn"],
    bankReceipt: json["bank_receipt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "phone_number": phoneNumber,
    "role": role,
    "is_active": isActive,
    "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x)),
    "car_number": carNumber,
    "is_admin": isAdmin,
    "inn": inn,
    "bank_receipt": bankReceipt,
  };
}
