class AccountModel {
  String? status;
  String? message;
  AccountData? user;
  AccountModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    user = json['user'];
  }
}

class AccountData {
  String? name;
  String? email;
  String? phone;
  String? nationalID;
  String? gender;
  String? token;
  String? profileImage;

  AccountData.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    nationalID = json['nationalId'];
    gender = json['gender'];
    token = json['token'];
    profileImage = json['profileImage'];
  }
}