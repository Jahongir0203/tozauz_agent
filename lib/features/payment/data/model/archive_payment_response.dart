import 'dart:convert';

class ArchivePaymentResponse {
  final int? amount;
  final String? card;
  final String? cardName;

  ArchivePaymentResponse({
    this.amount,
    this.card,
    this.cardName,
  });

  ArchivePaymentResponse copyWith({
    int? amount,
    String? card,
    String? cardName,
  }) =>
      ArchivePaymentResponse(
        amount: amount ?? this.amount,
        card: card ?? this.card,
        cardName: cardName ?? this.cardName,
      );

  factory ArchivePaymentResponse.fromRawJson(String str) => ArchivePaymentResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ArchivePaymentResponse.fromJson(Map<String, dynamic> json) => ArchivePaymentResponse(
    amount: json["amount"],
    card: json["card"],
    cardName: json["card_name"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "card": card,
    "card_name": cardName,
  };
}
