class MisreportDatamodel {
  int? status;
  String? message;
  List<Data>? data;

  MisreportDatamodel({this.status, this.message, this.data});

  MisreportDatamodel.fromJson(Map<String, dynamic> json) {
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
  String? invoiceDate;
  String? deliveryDate;
  String? invoiceTime;
  String? invoiceDateTime;
  // Null? combineDate;
  String? invoiceNo;
  // Null? serialNo;
  int? branchId;
  String? branchName;
  int? counterId;
  String? counterName;
  int? userId;
  String? userName;
  int? paymentModeId;
  String? paymentModeName;
  int? paymentSubId;
  String? paymentSubName;
  String? returnDate;
  String? remark;
  String? termsAndConditions;
  double? totalGrossAmount;
  double? totalItemDiscAmount;
  double? totalNetAmount;
  double? totalTaxAmount;
  double? totalAmount;
  double? paidAmount;
  double? discountAmount;
  // Null? discountPercentage;
  double? freightCharge;
  double? roundOff;
  double? grandTotal;
  bool? isSaved;
  bool? isCancelled;
  bool? isSync;
  int? modifiedBy;
  String? modifiedDate;
  // Null? year;
  // Null? month;
  // Null? monthNumber;
  // Null? totalCount;
  // Null? typeName;
  // Null? transactionCount;
  String? machineName;
  String? quantityDecimal;
  // Null? freeQuantity;
  String? freeQuantityDecimal;
  // Null? baseUnitId;
  // Null? baseFactor;
  // Null? baseUnitName;
  // Null? isPrimaryUnit;
  // Null? unitId;
  // Null? unitName;
  // Null? convertionFactor;
  // Null? taxPercentage;
  bool? taxInclusive;
  // Null? discPercentage;
  // Null? salesRate;
  // Null? retailRate;
  // Null? mrp;
  double? salesPurchaseCost;
  double? profit;
  int? currentQuantity;
  int? iCurrentQuantity;
  // Null? balnceQty;
  // Null? nBalnceQty;
  bool? isSelect;
  bool? bIsSelect;

  Data(
      {this.salesMasterId,
      this.invoiceDate,
      this.deliveryDate,
      this.invoiceTime,
      this.invoiceDateTime,
      // this.combineDate,
      this.invoiceNo,
      // this.serialNo,
      this.branchId,
      this.branchName,
      this.counterId,
      this.counterName,
      this.userId,
      this.userName,
      this.paymentModeId,
      this.paymentModeName,
      this.paymentSubId,
      this.paymentSubName,
      this.returnDate,
      this.remark,
      this.termsAndConditions,
      this.totalGrossAmount,
      this.totalItemDiscAmount,
      this.totalNetAmount,
      this.totalTaxAmount,
      this.totalAmount,
      this.paidAmount,
      this.discountAmount,
      // this.discountPercentage,
      this.freightCharge,
      this.roundOff,
      this.grandTotal,
      this.isSaved,
      this.isCancelled,
      this.isSync,
      this.modifiedBy,
      this.modifiedDate,
      // this.year,
      // this.month,
      // this.monthNumber,
      // this.totalCount,
      // this.typeName,
      // this.transactionCount,
      this.machineName,
      this.quantityDecimal,
      // this.freeQuantity,
      this.freeQuantityDecimal,
      // this.baseUnitId,
      // this.baseFactor,
      // this.baseUnitName,
      // this.isPrimaryUnit,
      // this.unitId,
      // this.unitName,
      // this.convertionFactor,
      // this.taxPercentage,
      this.taxInclusive,
      // this.discPercentage,
      // this.salesRate,
      // this.retailRate,
      // this.mrp,
      this.salesPurchaseCost,
      this.profit,
      this.currentQuantity,
      this.iCurrentQuantity,
      // this.balnceQty,
      // this.nBalnceQty,
      this.isSelect,
      this.bIsSelect});

  Data.fromJson(Map<String, dynamic> json) {
    salesMasterId = json['sales_Master_Id'];
    invoiceDate = json['invoice_Date'];
    deliveryDate = json['delivery_Date'];
    invoiceTime = json['invoice_Time'];
    invoiceDateTime = json['invoiceDateTime'];
    // combineDate = json['combineDate'];
    invoiceNo = json['invoice_No'];
    // serialNo = json['serial_No'];
    branchId = json['branch_Id'];
    branchName = json['branch_Name'];
    counterId = json['counter_Id'];
    counterName = json['counter_Name'];
    userId = json['user_Id'];
    userName = json['user_Name'];
    paymentModeId = json['paymentMode_Id'];
    paymentModeName = json['paymentMode_Name'];
    paymentSubId = json['paymentSub_Id'];
    paymentSubName = json['paymentSub_Name'];
    returnDate = json['return_Date'];
    remark = json['remark'];
    termsAndConditions = json['termsAndConditions'];
    totalGrossAmount = json['total_Gross_Amount'];
    totalItemDiscAmount = json['total_ItemDisc_Amount'];
    totalNetAmount = json['total_Net_Amount'];
    totalTaxAmount = json['total_Tax_Amount'];
    totalAmount = json['total_Amount'];
    paidAmount = json['paid_Amount'];
    discountAmount = json['discount_Amount'];
    // discountPercentage = json['discount_Percentage'];
    freightCharge = json['freight_Charge'];
    roundOff = json['round_Off'];
    grandTotal = json['grand_Total'];
    isSaved = json['is_Saved'];
    isCancelled = json['is_Cancelled'];
    isSync = json['is_Sync'];
    modifiedBy = json['modified_By'];
    modifiedDate = json['modified_Date'];
    // year = json['year'];
    // month = json['month'];
    // monthNumber = json['monthNumber'];
    // totalCount = json['totalCount'];
    // typeName = json['typeName'];
    // transactionCount = json['transactionCount'];
    machineName = json['machine_Name'];
    quantityDecimal = json['quantityDecimal'];
    // freeQuantity = json['free_Quantity'];
    freeQuantityDecimal = json['freeQuantityDecimal'];
    // baseUnitId = json['base_Unit_Id'];
    // baseFactor = json['base_Factor'];
    // baseUnitName = json['base_Unit_Name'];
    // isPrimaryUnit = json['is_Primary_Unit'];
    // unitId = json['unit_Id'];
    // unitName = json['unit_Name'];
    // convertionFactor = json['convertion_Factor'];
    // taxPercentage = json['tax_Percentage'];
    taxInclusive = json['taxInclusive'];
    // discPercentage = json['disc_Percentage'];
    // salesRate = json['sales_Rate'];
    // retailRate = json['retail_Rate'];
    // mrp = json['mrp'];
    salesPurchaseCost = json['sales_Purchase_Cost'];
    profit = json['profit'];
    currentQuantity = json['currentQuantity'];
    iCurrentQuantity = json['_CurrentQuantity'];
    // balnceQty = json['balnceQty'];
    // nBalnceQty = json['_BalnceQty'];
    isSelect = json['isSelect'];
    bIsSelect = json['_IsSelect'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sales_Master_Id'] = salesMasterId;
    data['invoice_Date'] = invoiceDate;
    data['delivery_Date'] = deliveryDate;
    data['invoice_Time'] = invoiceTime;
    data['invoiceDateTime'] = invoiceDateTime;
    // data['combineDate'] = combineDate;
    data['invoice_No'] = invoiceNo;
    // data['serial_No'] = serialNo;
    data['branch_Id'] = branchId;
    data['branch_Name'] = branchName;
    data['counter_Id'] = counterId;
    data['counter_Name'] = counterName;
    data['user_Id'] = userId;
    data['user_Name'] = userName;
    data['paymentMode_Id'] = paymentModeId;
    data['paymentMode_Name'] = paymentModeName;
    data['paymentSub_Id'] = paymentSubId;
    data['paymentSub_Name'] = paymentSubName;
    data['return_Date'] = returnDate;
    data['remark'] = remark;
    data['termsAndConditions'] = termsAndConditions;
    data['total_Gross_Amount'] = totalGrossAmount;
    data['total_ItemDisc_Amount'] = totalItemDiscAmount;
    data['total_Net_Amount'] = totalNetAmount;
    data['total_Tax_Amount'] = totalTaxAmount;
    data['total_Amount'] = totalAmount;
    data['paid_Amount'] = paidAmount;
    data['discount_Amount'] = discountAmount;
    // data['discount_Percentage'] = discountPercentage;
    data['freight_Charge'] = freightCharge;
    data['round_Off'] = roundOff;
    data['grand_Total'] = grandTotal;
    data['is_Saved'] = isSaved;
    data['is_Cancelled'] = isCancelled;
    data['is_Sync'] = isSync;
    data['modified_By'] = modifiedBy;
    data['modified_Date'] = modifiedDate;
    // data['year'] = year;
    // data['month'] = month;
    // data['monthNumber'] = monthNumber;
    // data['totalCount'] = totalCount;
    // data['typeName'] = typeName;
    // data['transactionCount'] = transactionCount;
    data['machine_Name'] = machineName;
    data['quantityDecimal'] = quantityDecimal;
    // data['free_Quantity'] = freeQuantity;
    data['freeQuantityDecimal'] = freeQuantityDecimal;
    // data['base_Unit_Id'] = baseUnitId;
    // data['base_Factor'] = baseFactor;
    // data['base_Unit_Name'] = baseUnitName;
    // data['is_Primary_Unit'] = isPrimaryUnit;
    // data['unit_Id'] = unitId;
    // data['unit_Name'] = unitName;
    // data['convertion_Factor'] = convertionFactor;
    // data['tax_Percentage'] = taxPercentage;
    data['taxInclusive'] = taxInclusive;
    // data['disc_Percentage'] = discPercentage;
    // data['sales_Rate'] = salesRate;
    // data['retail_Rate'] = retailRate;
    // data['mrp'] = mrp;
    data['sales_Purchase_Cost'] = salesPurchaseCost;
    data['profit'] = profit;
    data['currentQuantity'] = currentQuantity;
    data['_CurrentQuantity'] = iCurrentQuantity;
    // data['balnceQty'] = balnceQty;
    // data['_BalnceQty'] = nBalnceQty;
    data['isSelect'] = isSelect;
    data['_IsSelect'] = bIsSelect;
    return data;
  }
}
