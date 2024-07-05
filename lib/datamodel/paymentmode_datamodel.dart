class Getpaymentmodedatamodel {
  int? status;
  String? message;
  List<Data>? data;

  Getpaymentmodedatamodel({this.status, this.message, this.data});

  Getpaymentmodedatamodel.fromJson(Map<String, dynamic> json) {
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
  int? paymentModeId;
  String? paymentModeName;
  String? regionalName;
  bool? isActive;
  String? icon;

  Data(
      {this.paymentModeId,
      this.paymentModeName,
      this.regionalName,
      this.isActive,
      this.icon});

  Data.fromJson(Map<String, dynamic> json) {
    paymentModeId = json['paymentMode_Id'];
    paymentModeName = json['paymentMode_Name'];
    regionalName = json['regional_Name'];
    isActive = json['is_Active'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['paymentMode_Id'] = paymentModeId;
    data['paymentMode_Name'] = paymentModeName;
    data['regional_Name'] = regionalName;
    data['is_Active'] = isActive;
    data['icon'] = icon;
    return data;
  }
}
