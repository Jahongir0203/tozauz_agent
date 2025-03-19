class EarningFilterModel{
  final String? box,tarrif, startDate, endDate, minAmount, maxAmount;
  final int? page, pageSize, id;

  EarningFilterModel({
    this.box,
    this.tarrif,
    this.startDate,
    this.endDate,
    this.minAmount,
    this.maxAmount,
    this.page,
    this.pageSize,
    this.id,
  });

  Map<String, dynamic> toJson() {
    return {
      'box': box,
      'tarrif': tarrif,
      'start_date': startDate,
      'end_date': endDate,
      'min_amount': minAmount,
      'max_amount': maxAmount,
      'page': page,
      'page_size': pageSize,
      'id': id,
    };
  }

  EarningFilterModel copyWith({
    String? box,
    String? tarrif,
    String? startDate,
    String? endDate,
    String? minAmount,
    String? maxAmount,
    int? page,
    int? pageSize,
    int? id,
  }) {
    return EarningFilterModel(
      box: box ?? this.box,
      tarrif: tarrif ?? this.tarrif,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      minAmount: minAmount ?? this.minAmount,
      maxAmount: maxAmount ?? this.maxAmount,
      page: page ?? this.page,
      pageSize: pageSize ?? this.pageSize,
      id: id ?? this.id,
    );
  }
}