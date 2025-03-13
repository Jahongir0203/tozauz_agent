import 'dart:convert';

class BoxResponseModel {
  final int? id;
  final BoxCategory? category;
  final String? name;
  final String? simModule;
  final dynamic address;
  final dynamic location;
  final dynamic datetimeOfDelivery;
  final int? unloadingPrice;
  final int? containersCount;
  final String? qrCode;
  final DateTime? createdAt;
  final bool? isActive;
  final String? sellerShare;
  final String? sellerPercentage;
  final int? seller;

  BoxResponseModel({
    this.id,
    this.category,
    this.name,
    this.simModule,
    this.address,
    this.location,
    this.datetimeOfDelivery,
    this.unloadingPrice,
    this.containersCount,
    this.qrCode,
    this.createdAt,
    this.isActive,
    this.sellerShare,
    this.sellerPercentage,
    this.seller,
  });

  BoxResponseModel copyWith({
    int? id,
    BoxCategory? category,
    String? name,
    String? simModule,
    dynamic address,
    dynamic location,
    dynamic datetimeOfDelivery,
    int? unloadingPrice,
    int? containersCount,
    String? qrCode,
    DateTime? createdAt,
    bool? isActive,
    String? sellerShare,
    String? sellerPercentage,
    int? seller,
  }) =>
      BoxResponseModel(
        id: id ?? this.id,
        category: category ?? this.category,
        name: name ?? this.name,
        simModule: simModule ?? this.simModule,
        address: address ?? this.address,
        location: location ?? this.location,
        datetimeOfDelivery: datetimeOfDelivery ?? this.datetimeOfDelivery,
        unloadingPrice: unloadingPrice ?? this.unloadingPrice,
        containersCount: containersCount ?? this.containersCount,
        qrCode: qrCode ?? this.qrCode,
        createdAt: createdAt ?? this.createdAt,
        isActive: isActive ?? this.isActive,
        sellerShare: sellerShare ?? this.sellerShare,
        sellerPercentage: sellerPercentage ?? this.sellerPercentage,
        seller: seller ?? this.seller,
      );

  factory BoxResponseModel.fromRawJson(String str) => BoxResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BoxResponseModel.fromJson(Map<String, dynamic> json) => BoxResponseModel(
    id: json["id"],
    category: json["category"] == null ? null : BoxCategory.fromJson(json["category"]),
    name: json["name"],
    simModule: json["sim_module"],
    address: json["address"],
    location: json["location"],
    datetimeOfDelivery: json["datetime_of_delivery"],
    unloadingPrice: json["unloading_price"],
    containersCount: json["containers_count"],
    qrCode: json["qr_code"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    isActive: json["is_active"],
    sellerShare: json["seller_share"],
    sellerPercentage: json["seller_percentage"],
    seller: json["seller"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category": category?.toJson(),
    "name": name,
    "sim_module": simModule,
    "address": address,
    "location": location,
    "datetime_of_delivery": datetimeOfDelivery,
    "unloading_price": unloadingPrice,
    "containers_count": containersCount,
    "qr_code": qrCode,
    "created_at": createdAt?.toIso8601String(),
    "is_active": isActive,
    "seller_share": sellerShare,
    "seller_percentage": sellerPercentage,
    "seller": seller,
  };
}

class BoxCategory {
  final int? id;
  final String? name;
  final int? summa;

  BoxCategory({
    this.id,
    this.name,
    this.summa,
  });

  BoxCategory copyWith({
    int? id,
    String? name,
    int? summa,
  }) =>
      BoxCategory(
        id: id ?? this.id,
        name: name ?? this.name,
        summa: summa ?? this.summa,
      );

  factory BoxCategory.fromRawJson(String str) => BoxCategory.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BoxCategory.fromJson(Map<String, dynamic> json) => BoxCategory(
    id: json["id"],
    name: json["name"],
    summa: json["summa"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "summa": summa,
  };
}
