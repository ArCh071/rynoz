class MonthwisegraphDatamodel {
  int? status;
  String? message;
  List<Data>? data;

  MonthwisegraphDatamodel({this.status, this.message, this.data});

  MonthwisegraphDatamodel.fromJson(Map<String, dynamic> json) {
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
  int? salesMasterId;
  double? totalGrossAmount;
  // Null? totalItemDiscAmount;
  double? totalNetAmount;
  double? totalTaxAmount;
  double? totalAmount;
  double? paidAmount;
  double? discountAmount;
  double? discountPercentage;
  double? freightCharge;
  double? roundOff;
  double? grandTotal;
  String? year;
  String? month;
  int? monthNumber;
  int? totalCount;
  // Null? typeName;
  // Null? transactionCount;
  String? machineName;

  Data(
      {this.salesMasterId,
      this.totalGrossAmount,
      // this.totalItemDiscAmount,
      this.totalNetAmount,
      this.totalTaxAmount,
      this.totalAmount,
      this.paidAmount,
      this.discountAmount,
      this.discountPercentage,
      this.freightCharge,
      this.roundOff,
      this.grandTotal,
      this.year,
      this.month,
      this.monthNumber,
      this.totalCount,
      // this.typeName,
      // this.transactionCount,
      this.machineName});

  Data.fromJson(Map<String, dynamic> json) {
    salesMasterId = json['sales_Master_Id'];
    totalGrossAmount = json['total_Gross_Amount'];
    // totalItemDiscAmount = json['total_ItemDisc_Amount'];
    totalNetAmount = json['total_Net_Amount'];
    totalTaxAmount = json['total_Tax_Amount'];
    totalAmount = json['total_Amount'];
    paidAmount = json['paid_Amount'];
    discountAmount = json['discount_Amount'];
    discountPercentage = json['discount_Percentage'];
    freightCharge = json['freight_Charge'];
    roundOff = json['round_Off'];
    grandTotal = json['grand_Total'];
    year = json['year'];
    month = json['month'];
    monthNumber = json['monthNumber'];
    totalCount = json['totalCount'];
    // typeName = json['typeName'];
    // transactionCount = json['transactionCount'];
    machineName = json['machine_Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sales_Master_Id'] = salesMasterId;
    data['total_Gross_Amount'] = totalGrossAmount;
    // data['total_ItemDisc_Amount'] = totalItemDiscAmount;
    data['total_Net_Amount'] = totalNetAmount;
    data['total_Tax_Amount'] = totalTaxAmount;
    data['total_Amount'] = totalAmount;
    data['paid_Amount'] = paidAmount;
    data['discount_Amount'] = discountAmount;
    data['discount_Percentage'] = discountPercentage;
    data['freight_Charge'] = freightCharge;
    data['round_Off'] = roundOff;
    data['grand_Total'] = grandTotal;
    data['year'] = year;
    data['month'] = month;
    data['monthNumber'] = monthNumber;
    data['totalCount'] = totalCount;
    // data['typeName'] = typeName;
    // data['transactionCount'] = transactionCount;
    data['machine_Name'] = machineName;
    return data;
  }
}
