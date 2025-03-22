class UpdatePasswordRequest {
  String? oldPassword;
  String? newPassword;

  UpdatePasswordRequest({this.oldPassword, this.newPassword});

  UpdatePasswordRequest.fromJson(Map<String, dynamic> json) {
    oldPassword = json['old_password'];
    newPassword = json['new_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['old_password'] = oldPassword;
    data['new_password'] = newPassword;
    return data;
  }
}