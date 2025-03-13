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
    };
  }
}