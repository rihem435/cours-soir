class UserModel {
  User? user;
  Tokens? tokens;

  UserModel({this.user, this.tokens});

  UserModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    tokens =
        json['tokens'] != null ? new Tokens.fromJson(json['tokens']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.tokens != null) {
      data['tokens'] = this.tokens!.toJson();
    }
    return data;
  }
}

class User {
  String? sId;
  String? fullname;
  String? email;
  String? password;
  int? phone;
  String? items;
  int? iV;
  String? refreshToken;

  User(
      {this.sId,
      this.fullname,
      this.email,
      this.password,
      this.phone,
      this.items,
      this.iV,
      this.refreshToken});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullname = json['fullname'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    items = json['items'];
    iV = json['__v'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['fullname'] = this.fullname;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['items'] = this.items;
    data['__v'] = this.iV;
    data['refreshToken'] = this.refreshToken;
    return data;
  }
}

class Tokens {
  String? accessToken;
  String? refreshToken;

  Tokens({this.accessToken, this.refreshToken});

  Tokens.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;
    return data;
  }
}
