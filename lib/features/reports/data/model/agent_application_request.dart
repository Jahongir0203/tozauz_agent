class AgentApplicationListRequest {
  final int? page;
  final int? pageSize;
  final String? status;
  final String? employee;
  final String? box;
  final String? paymentType;

  AgentApplicationListRequest({
    this.page,
    this.pageSize,
    this.status,
    this.employee,
    this.box,
    this.paymentType,
  });

  factory AgentApplicationListRequest.fromJson(Map<String, dynamic> json) {
    return AgentApplicationListRequest(
      page: json['page'] as int?,
      pageSize: json['pageSize'] as int?,
      status: json['status'] as String?,
      employee: json['employee'] as String?,
      box: json['box'] as String?,
      paymentType: json['paymentType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'pageSize': pageSize,
      'status': status,
      'employee': employee,
      'box': box,
      'paymentType': paymentType,
    };
  }
}
