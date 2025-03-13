import 'dart:convert';

import 'package:tozauz_agent/features/common/data/models/user_model.dart';

class EarningResponseModel {
  final int? id;
  final UserModel? user;
  final DateTime? createdAt;
  final dynamic packet;
  final int? amount;
  final String? tarrif;
  final bool? isPenalty;
  final int? penaltyAmount;
  final String? reason;
  final int? bankAccount;
  final int? box;

  EarningResponseModel({
    this.id,
    this.user,
    this.createdAt,
    this.packet,
    this.amount,
    this.tarrif,
    this.isPenalty,
    this.penaltyAmount,
    this.reason,
    this.bankAccount,
    this.box,
  });

  EarningResponseModel copyWith({
    int? id,
    UserModel? user,
    DateTime? createdAt,
    dynamic packet,
    int? amount,
    String? tarrif,
    bool? isPenalty,
    int? penaltyAmount,
    String? reason,
    int? bankAccount,
    int? box,
  }) =>
      EarningResponseModel(
        id: id ?? this.id,
        user: user ?? this.user,
        createdAt: createdAt ?? this.createdAt,
        packet: packet ?? this.packet,
        amount: amount ?? this.amount,
        tarrif: tarrif ?? this.tarrif,
        isPenalty: isPenalty ?? this.isPenalty,
        penaltyAmount: penaltyAmount ?? this.penaltyAmount,
        reason: reason ?? this.reason,
        bankAccount: bankAccount ?? this.bankAccount,
        box: box ?? this.box,
      );

  factory EarningResponseModel.fromRawJson(String str) => EarningResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EarningResponseModel.fromJson(Map<String, dynamic> json) => EarningResponseModel(
    id: json["id"],
    user: json["user"] == null ? null : UserModel.fromJson(json["user"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    packet: json["packet"],
    amount: json["amount"],
    tarrif: json["tarrif"],
    isPenalty: json["is_penalty"],
    penaltyAmount: json["penalty_amount"],
    reason: json["reason"],
    bankAccount: json["bank_account"],
    box: json["box"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user": user?.toJson(),
    "created_at": createdAt?.toIso8601String(),
    "packet": packet,
    "amount": amount,
    "tarrif": tarrif,
    "is_penalty": isPenalty,
    "penalty_amount": penaltyAmount,
    "reason": reason,
    "bank_account": bankAccount,
    "box": box,
  };
}


