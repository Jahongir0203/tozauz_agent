import 'dart:convert';

import 'package:tozauz_agent/features/home/data/models/earning_response_model.dart';

class AgentEarningResponse {
  final int? count;
  final String? next;
  final dynamic previous;
  final List<EarningResponseModel>? results;
  final int? totalAmount;
  final int? totalPenalty;

  AgentEarningResponse({
    this.count,
    this.next,
    this.previous,
    this.results,
    this.totalAmount,
    this.totalPenalty,
  });

  AgentEarningResponse copyWith({
    int? count,
    String? next,
    dynamic previous,
    List<EarningResponseModel>? results,
    int? totalAmount,
    int? totalPenalty,
  }) =>
      AgentEarningResponse(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results,
        totalAmount: totalAmount ?? this.totalAmount,
        totalPenalty: totalPenalty ?? this.totalPenalty,
      );

  factory AgentEarningResponse.fromRawJson(String str) => AgentEarningResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AgentEarningResponse.fromJson(Map<String, dynamic> json) => AgentEarningResponse(
    count: json["count"],
    next: json["next"],
    previous: json["previous"],
    results: json["results"] == null ? [] : List<EarningResponseModel>.from(json["results"]!.map((x) => EarningResponseModel.fromJson(x))),
    totalAmount: json["total_amount"],
    totalPenalty: json["total_penalty"],
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
    "total_amount": totalAmount,
    "total_penalty": totalPenalty,
  };
}





