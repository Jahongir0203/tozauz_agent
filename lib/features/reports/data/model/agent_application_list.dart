class AgentApplicationList {
  int? count;
  dynamic next;
  dynamic previous;
  List<Results>? results;

  AgentApplicationList({this.count, this.next, this.previous, this.results});

  AgentApplicationList.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['next'] = next;
    data['previous'] = previous;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  int? id;
  Box? box;
  int? amount;
  String? rejectedReason;
  String? comment;
  String? paymentType;
  int? containersCount;
  String? createdAt;
  String? updatedAt;
  String? status;
  int? agent;
  Null? employee;
  Null? rejectedBy;

  Results(
      {this.id,
      this.box,
      this.amount,
      this.rejectedReason,
      this.comment,
      this.paymentType,
      this.containersCount,
      this.createdAt,
      this.updatedAt,
      this.status,
      this.agent,
      this.employee,
      this.rejectedBy});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    box = json['box'] != null ? Box.fromJson(json['box']) : null;
    amount = json['amount'];
    rejectedReason = json['rejected_reason'];
    comment = json['comment'];
    paymentType = json['payment_type'];
    containersCount = json['containers_count'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
    agent = json['agent'];
    employee = json['employee'];
    rejectedBy = json['rejected_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (box != null) {
      data['box'] = box!.toJson();
    }
    data['amount'] = amount;
    data['rejected_reason'] = rejectedReason;
    data['comment'] = comment;
    data['payment_type'] = paymentType;
    data['containers_count'] = containersCount;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['status'] = status;
    data['agent'] = agent;
    data['employee'] = employee;
    data['rejected_by'] = rejectedBy;
    return data;
  }
}

class Box {
  int? id;
  String? name;

  Box({this.id, this.name});

  Box.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
