class AgentApplicationResponse {
  int? box;
  String? comment;
  int? containersCount;
  String? paymentType;

  AgentApplicationResponse(
      {this.box, this.comment, this.containersCount, this.paymentType});

  AgentApplicationResponse.fromJson(Map<String, dynamic> json) {
    box = json['box'];
    comment = json['comment'];
    containersCount = json['containers_count'];
    paymentType = json['payment_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['box'] = box;
    data['comment'] = comment;
    data['containers_count'] = containersCount;
    data['payment_type'] = paymentType;
    return data;
  }
}