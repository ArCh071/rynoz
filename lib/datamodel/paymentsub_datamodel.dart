class Getpaymentsubdatamodel {
  int? status;
  String? message;
  List<Data>? data;

  Getpaymentsubdatamodel({this.status, this.message, this.data});

  Getpaymentsubdatamodel.fromJson(Map<String, dynamic> json) {
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
  int? paymentSubId;
  int? paymentModeId;
  String? paymentSubName;
  String? icon;
  bool? isActive;

  Data(
      {this.paymentSubId,
      this.paymentModeId,
      this.paymentSubName,
      this.icon,
      this.isActive});

  Data.fromJson(Map<String, dynamic> json) {
    paymentSubId = json['paymentSub_Id'];
    paymentModeId = json['paymentMode_Id'];
    paymentSubName = json['paymentSub_Name'];
    icon = json['icon'];
    isActive = json['is_Active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['paymentSub_Id'] = paymentSubId;
    data['paymentMode_Id'] = paymentModeId;
    data['paymentSub_Name'] = paymentSubName;
    data['icon'] = icon;
    data['is_Active'] = isActive;
    return data;
  }
}
