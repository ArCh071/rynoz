class Logindatamodel {
  int? status;
  String? message;
  List<Data>? data;

  Logindatamodel({this.status, this.message, this.data});

  Logindatamodel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? userId;
  String? userName;
  String? emailId;
  String? password;
  String? connectionString;
  String? phone;
  String? adress;
  String? nationality;
  String? state;
  int? pin;
  String? createdDate;
  String? icon;
  bool? isActive;

  Data(
      {this.userId,
      this.userName,
      this.emailId,
      this.password,
      this.connectionString,
      this.phone,
      this.adress,
      this.nationality,
      this.state,
      this.pin,
      this.createdDate,
      this.icon,
      this.isActive});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_Id'];
    userName = json['user_Name'];
    emailId = json['email_Id'];
    password = json['password'];
    connectionString = json['connection_String'];
    phone = json['phone'];
    adress = json['adress'];
    nationality = json['nationality'];
    state = json['state'];
    pin = json['pin'];
    createdDate = json['created_Date'];
    icon = json['icon'];
    isActive = json['is_Active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_Id'] = userId;
    data['user_Name'] = userName;
    data['email_Id'] = emailId;
    data['password'] = password;
    data['connection_String'] = connectionString;
    data['phone'] = phone;
    data['adress'] = adress;
    data['nationality'] = nationality;
    data['state'] = state;
    data['pin'] = pin;
    data['created_Date'] = createdDate;
    data['icon'] = icon;
    data['is_Active'] = isActive;
    return data;
  }
}
