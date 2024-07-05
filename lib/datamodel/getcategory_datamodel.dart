class GetCategorydatamodel {
  int? status;
  String? message;
  List<Data>? data;

  GetCategorydatamodel({this.status, this.message, this.data});

  GetCategorydatamodel.fromJson(Map<String, dynamic> json) {
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
  int? categoryID;
  String? categoryCode;
  String? categoryName;
  String? categoryImage;
  String? regionalName;
  double? categoryDiscount;
  int? companyId;
  int? modifiedBy;
  String? modifiedDate;

  Data(
      {this.categoryID,
      this.categoryCode,
      this.categoryName,
      this.categoryImage,
      this.regionalName,
      this.categoryDiscount,
      this.companyId,
      this.modifiedBy,
      this.modifiedDate});

  Data.fromJson(Map<String, dynamic> json) {
    categoryID = json['category_ID'];
    categoryCode = json['category_Code'];
    categoryName = json['category_Name'];
    categoryImage = json['categoryImage'];
    regionalName = json['regional_Name'];
    categoryDiscount = json['category_Discount'];
    companyId = json['company_Id'];
    modifiedBy = json['modified_By'];
    modifiedDate = json['modified_Date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_ID'] = categoryID;
    data['category_Code'] = categoryCode;
    data['category_Name'] = categoryName;
    data['categoryImage'] = categoryImage;
    data['regional_Name'] = regionalName;
    data['category_Discount'] = categoryDiscount;
    data['company_Id'] = companyId;
    data['modified_By'] = modifiedBy;
    data['modified_Date'] = modifiedDate;
    return data;
  }
}
