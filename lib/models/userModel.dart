class UserModel {
  String? status;
  String? message;
  UserData? user;
  UserModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    user = json['user'];
  }
}

class UserData {
  String? name;
  String? email;
  String? phone;
  String? nationalID;
  String? gender;
  String? token;
  String? profileImage;

  UserData.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    nationalID = json['nationalID'];
    gender = json['gender'];
    token = json['token'];
    profileImage = json['profileImage'];
  }
}
