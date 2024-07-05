class GetBranchdatamodel {
  int? status;
  String? message;
  List<Data>? data;

  GetBranchdatamodel({this.status, this.message, this.data});

  GetBranchdatamodel.fromJson(Map<String, dynamic> json) {
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
  int? branchId;
  String? branchName;
  String? branchCode;
  String? branchDescription;
  int? companyId;
  int? modifiedBy;
  bool? isMain;
  String? prefix;
  bool? isChecked;
  String? address;
  String? phone;
  String? mobile;
  String? email;
  String? logo;
  String? trNNO;
  String? termsCondition;
  int? type;
  double? opDebit;
  double? opCredit;
  double? balance;

  Data(
      {this.branchId,
      this.branchName,
      this.branchCode,
      this.branchDescription,
      this.companyId,
      this.modifiedBy,
      this.isMain,
      this.prefix,
      this.isChecked,
      this.address,
      this.phone,
      this.mobile,
      this.email,
      this.logo,
      this.trNNO,
      this.termsCondition,
      this.type,
      this.opDebit,
      this.opCredit,
      this.balance});

  Data.fromJson(Map<String, dynamic> json) {
    branchId = json['branch_Id'];
    branchName = json['branch_Name'];
    branchCode = json['branch_Code'];
    branchDescription = json['branch_Description'];
    companyId = json['company_Id'];
    modifiedBy = json['modified_By'];
    isMain = json['is_Main'];
    prefix = json['prefix'];
    isChecked = json['is_Checked'];
    address = json['address'];
    phone = json['phone'];
    mobile = json['mobile'];
    email = json['email'];
    logo = json['logo'];
    trNNO = json['trN_NO'];
    termsCondition = json['terms_Condition'];
    type = json['type'];
    opDebit = json['op_Debit'];
    opCredit = json['op_Credit'];
    balance = json['balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['branch_Id'] = branchId;
    data['branch_Name'] = branchName;
    data['branch_Code'] = branchCode;
    data['branch_Description'] = branchDescription;
    data['company_Id'] = companyId;
    data['modified_By'] = modifiedBy;
    data['is_Main'] = isMain;
    data['prefix'] = prefix;
    data['is_Checked'] = isChecked;
    data['address'] = address;
    data['phone'] = phone;
    data['mobile'] = mobile;
    data['email'] = email;
    data['logo'] = logo;
    data['trN_NO'] = trNNO;
    data['terms_Condition'] = termsCondition;
    data['type'] = type;
    data['op_Debit'] = opDebit;
    data['op_Credit'] = opCredit;
    data['balance'] = balance;
    return data;
  }
}
