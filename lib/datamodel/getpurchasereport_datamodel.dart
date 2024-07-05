class GetPurchasereportdatamodel {
  int? status;
  String? message;
  List<Data>? data;

  GetPurchasereportdatamodel({this.status, this.message, this.data});

  GetPurchasereportdatamodel.fromJson(Map<String, dynamic> json) {
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
  int? purchaseMasterId;
  int? purchaseType;
  int? voucherNo;
  String? voucherDate;
  String? voucherTime;
  String? voucherDateTime;
  String? invoiceNo;
  String? invoiceDate;
  int? supplierId;
  String? supplierName;
  // Null? status;
  String? nationality;
  String? phone;
  int? paymentModeId;
  String? paymentModeName;
  int? paymentSubId;
  int? paymentSubName;
  int? bankId;
  int? storeId;
  int? branchId;
  int? godownId;
  int? counterId;
  String? counterName;
  int? salesmanId;
  String? salesmanName;
  int? userId;
  String? userName;
  String? deliveryNo;
  String? deliveryDate;
  double? totalGrossAmount;
  double? totalItemDiscAmount;
  double? totalNetAmount;
  double? totalTaxAmount;
  double? totalAmount;
  double? paidAmount;
  double? discountAmount;
  double? freightCharge;
  int? additionalExpence;
  String? customsClearance;
  double? transportationCharge;
  double? cgsTTotal;
  double? sgsTTotal;
  double? igsTTotal;
  double? roundOff;
  double? grandTotal;
  String? remarks;
  int? companyId;
  bool? isSaved;
  bool? isCancelled;
  // Null? isReturned;
  int? purchaseOrderId;
  int? modifiedBy;
  String? modifiedDate;
  // Null? trNNo;
  // Null? year;
  // Null? month;
  // Null? monthNumber;
  // Null? totalCount;
  // Null? rackId;
  // Null? rackName;
  int? purchaseDetailId;
  // Null? productId;
  // Null? productCode;
  // Null? productName;
  // Null? colorId;
  // Null? colorName;
  // Null? sizeId;
  // Null? sizeName;
  // Null? colorHex;
  // Null? productDetailId;
  // Null? productDetailName;
  // Null? taxInclusive;
  // Null? barcode;
  // Null? quantity;
  // Null? freeQuantity;
  // Null? baseUnitId;
  // Null? baseUnitName;
  // Null? baseFactor;
  int? unitId;
  // Null? unitName;
  // Null? isPrimaryUnit;
  // Null? convertionFactor;
  // Null? purchaseRate;
  // Null? purchaseCost;
  // Null? exchangeRate;
  int? exchangePurchaseRate;
  int? exchangeTotal;
  // Null? retailRate;
  // Null? wholesaleRate;
  // Null? mrp;
  // Null? taxPercentage;
  // Null? discPercentage;
  // Null? grossAmount;
  // Null? itemDiscount;
  // Null? netAmount;
  // Null? taxAmount;
  // Null? amount;
  // Null? unitPriceInclusive;
  // Null? unitPriceExclusive;
  // Null? manufacturingDate;
  // Null? expireDate;
  // Null? batchNo;
  // Null? sgsTPercentage;
  // Null? cgsTPercentage;
  // Null? igsTPercentage;
  // Null? decimal;
  // Null? categoryName;
  // Null? convertionType;

  Data({
    this.purchaseMasterId,
    this.purchaseType,
    this.voucherNo,
    this.voucherDate,
    this.voucherTime,
    this.voucherDateTime,
    this.invoiceNo,
    this.invoiceDate,
    this.supplierId,
    this.supplierName,
    // this.status,
    this.nationality,
    this.phone,
    this.paymentModeId,
    this.paymentModeName,
    this.paymentSubId,
    this.paymentSubName,
    this.bankId,
    this.storeId,
    this.branchId,
    this.godownId,
    this.counterId,
    this.counterName,
    this.salesmanId,
    this.salesmanName,
    this.userId,
    this.userName,
    this.deliveryNo,
    this.deliveryDate,
    this.totalGrossAmount,
    this.totalItemDiscAmount,
    this.totalNetAmount,
    this.totalTaxAmount,
    this.totalAmount,
    this.paidAmount,
    this.discountAmount,
    this.freightCharge,
    this.additionalExpence,
    this.customsClearance,
    this.transportationCharge,
    this.cgsTTotal,
    this.sgsTTotal,
    this.igsTTotal,
    this.roundOff,
    this.grandTotal,
    this.remarks,
    this.companyId,
    this.isSaved,
    this.isCancelled,
    // this.isReturned,
    this.purchaseOrderId,
    this.modifiedBy,
    this.modifiedDate,
    // this.trNNo,
    // this.year,
    // this.month,
    // this.monthNumber,
    // this.totalCount,
    // this.rackId,
    // this.rackName,
    this.purchaseDetailId,
    // this.productId,
    // this.productCode,
    // this.productName,
    // this.colorId,
    // this.colorName,
    // this.sizeId,
    // this.sizeName,
    // this.colorHex,
    // this.productDetailId,
    // this.productDetailName,
    // this.taxInclusive,
    // this.barcode,
    // this.quantity,
    // this.freeQuantity,
    // this.baseUnitId,
    // this.baseUnitName,
    // this.baseFactor,
    this.unitId,
    // this.unitName,
    // this.isPrimaryUnit,
    // this.convertionFactor,
    // this.purchaseRate,
    // this.purchaseCost,
    // this.exchangeRate,
    this.exchangePurchaseRate,
    this.exchangeTotal,
    // this.retailRate,
    // this.wholesaleRate,
    // this.mrp,
    // this.taxPercentage,
    // this.discPercentage,
    // this.grossAmount,
    // this.itemDiscount,
    // this.netAmount,
    // this.taxAmount,
    // this.amount,
    // this.unitPriceInclusive,
    // this.unitPriceExclusive,
    // this.manufacturingDate,
    // this.expireDate,
    // this.batchNo,
    // this.sgsTPercentage,
    // this.cgsTPercentage,
    // this.igsTPercentage,
    // this.decimal,
    // this.categoryName,
    // this.convertionType
  });

  Data.fromJson(Map<String, dynamic> json) {
    purchaseMasterId = json['purchase_Master_Id'];
    purchaseType = json['purchase_Type'];
    voucherNo = json['voucher_No'];
    voucherDate = json['voucher_Date'];
    voucherTime = json['voucher_Time'];
    voucherDateTime = json['voucherDateTime'];
    invoiceNo = json['invoice_No'];
    invoiceDate = json['invoice_Date'];
    supplierId = json['supplier_Id'];
    supplierName = json['supplier_Name'];
    // status = json['status'];
    nationality = json['nationality'];
    phone = json['phone'];
    paymentModeId = json['paymentMode_Id'];
    paymentModeName = json['paymentMode_Name'];
    paymentSubId = json['paymentSub_Id'];
    paymentSubName = json['paymentSub_Name'];
    bankId = json['bank_Id'];
    storeId = json['store_Id'];
    branchId = json['branch_Id'];
    godownId = json['godown_Id'];
    counterId = json['counter_Id'];
    counterName = json['counter_Name'];
    salesmanId = json['salesman_Id'];
    salesmanName = json['salesman_Name'];
    userId = json['user_Id'];
    userName = json['user_Name'];
    deliveryNo = json['delivery_No'];
    deliveryDate = json['delivery_Date'];
    totalGrossAmount = json['total_Gross_Amount'];
    totalItemDiscAmount = json['total_ItemDisc_Amount'];
    totalNetAmount = json['total_Net_Amount'];
    totalTaxAmount = json['total_Tax_Amount'];
    totalAmount = json['total_Amount'];
    paidAmount = json['paid_Amount'];
    discountAmount = json['discount_Amount'];
    freightCharge = json['freight_Charge'];
    additionalExpence = json['additional_Expence'];
    customsClearance = json['customs_Clearance'];
    transportationCharge = json['transportation_Charge'];
    cgsTTotal = json['cgsT_Total'];
    sgsTTotal = json['sgsT_Total'];
    igsTTotal = json['igsT_Total'];
    roundOff = json['round_Off'];
    grandTotal = json['grand_Total'];
    remarks = json['remarks'];
    companyId = json['company_Id'];
    isSaved = json['is_Saved'];
    isCancelled = json['is_Cancelled'];
    // isReturned = json['is_Returned'];
    purchaseOrderId = json['purchase_Order_Id'];
    modifiedBy = json['modified_By'];
    modifiedDate = json['modified_Date'];
    // trNNo = json['trN_No'];
    // year = json['year'];
    // month = json['month'];
    // monthNumber = json['monthNumber'];
    // totalCount = json['totalCount'];
    // rackId = json['rack_Id'];
    // rackName = json['rackName'];
    purchaseDetailId = json['purchase_Detail_Id'];
    // productId = json['product_Id'];
    // productCode = json['product_Code'];
    // productName = json['product_name'];
    // colorId = json['color_Id'];
    // colorName = json['color_Name'];
    // sizeId = json['size_Id'];
    // sizeName = json['size_Name'];
    // colorHex = json['colorHex'];
    // productDetailId = json['product_Detail_Id'];
    // productDetailName = json['product_Detail_Name'];
    // taxInclusive = json['taxInclusive'];
    // barcode = json['barcode'];
    // quantity = json['quantity'];
    // freeQuantity = json['free_Quantity'];
    // baseUnitId = json['base_Unit_Id'];
    // baseUnitName = json['base_Unit_Name'];
    // baseFactor = json['base_Factor'];
    unitId = json['unit_Id'];
    // unitName = json['unit_Name'];
    // isPrimaryUnit = json['is_Primary_Unit'];
    // convertionFactor = json['convertion_Factor'];
    // purchaseRate = json['purchase_Rate'];
    // purchaseCost = json['purchase_Cost'];
    // exchangeRate = json['exchange_Rate'];
    exchangePurchaseRate = json['exchange_PurchaseRate'];
    exchangeTotal = json['exchange_Total'];
    // retailRate = json['retail_Rate'];
    // wholesaleRate = json['wholesale_Rate'];
    // mrp = json['mrp'];
    // taxPercentage = json['tax_Percentage'];
    // discPercentage = json['disc_Percentage'];
    // grossAmount = json['gross_Amount'];
    // itemDiscount = json['item_Discount'];
    // netAmount = json['net_Amount'];
    // taxAmount = json['tax_Amount'];
    // amount = json['amount'];
    // unitPriceInclusive = json['unit_Price_Inclusive'];
    // unitPriceExclusive = json['unit_Price_Exclusive'];
    // manufacturingDate = json['manufacturing_Date'];
    // expireDate = json['expire_Date'];
    // batchNo = json['batch_No'];
    // sgsTPercentage = json['sgsT_Percentage'];
    // cgsTPercentage = json['cgsT_Percentage'];
    // igsTPercentage = json['igsT_Percentage'];
    // decimal = json['decimal'];
    // categoryName = json['category_Name'];
    // convertionType = json['convertion_Type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['purchase_Master_Id'] = purchaseMasterId;
    data['purchase_Type'] = purchaseType;
    data['voucher_No'] = voucherNo;
    data['voucher_Date'] = voucherDate;
    data['voucher_Time'] = voucherTime;
    data['voucherDateTime'] = voucherDateTime;
    data['invoice_No'] = invoiceNo;
    data['invoice_Date'] = invoiceDate;
    data['supplier_Id'] = supplierId;
    data['supplier_Name'] = supplierName;
    // data['status'] = status;
    data['nationality'] = nationality;
    data['phone'] = phone;
    data['paymentMode_Id'] = paymentModeId;
    data['paymentMode_Name'] = paymentModeName;
    data['paymentSub_Id'] = paymentSubId;
    data['paymentSub_Name'] = paymentSubName;
    data['bank_Id'] = bankId;
    data['store_Id'] = storeId;
    data['branch_Id'] = branchId;
    data['godown_Id'] = godownId;
    data['counter_Id'] = counterId;
    data['counter_Name'] = counterName;
    data['salesman_Id'] = salesmanId;
    data['salesman_Name'] = salesmanName;
    data['user_Id'] = userId;
    data['user_Name'] = userName;
    data['delivery_No'] = deliveryNo;
    data['delivery_Date'] = deliveryDate;
    data['total_Gross_Amount'] = totalGrossAmount;
    data['total_ItemDisc_Amount'] = totalItemDiscAmount;
    data['total_Net_Amount'] = totalNetAmount;
    data['total_Tax_Amount'] = totalTaxAmount;
    data['total_Amount'] = totalAmount;
    data['paid_Amount'] = paidAmount;
    data['discount_Amount'] = discountAmount;
    data['freight_Charge'] = freightCharge;
    data['additional_Expence'] = additionalExpence;
    data['customs_Clearance'] = customsClearance;
    data['transportation_Charge'] = transportationCharge;
    data['cgsT_Total'] = cgsTTotal;
    data['sgsT_Total'] = sgsTTotal;
    data['igsT_Total'] = igsTTotal;
    data['round_Off'] = roundOff;
    data['grand_Total'] = grandTotal;
    data['remarks'] = remarks;
    data['company_Id'] = companyId;
    data['is_Saved'] = isSaved;
    data['is_Cancelled'] = isCancelled;
    // data['is_Returned'] = isReturned;
    data['purchase_Order_Id'] = purchaseOrderId;
    data['modified_By'] = modifiedBy;
    data['modified_Date'] = modifiedDate;
    // data['trN_No'] = trNNo;
    // data['year'] = year;
    // data['month'] = month;
    // data['monthNumber'] = monthNumber;
    // data['totalCount'] = totalCount;
    // data['rack_Id'] = rackId;
    // data['rackName'] = rackName;
    data['purchase_Detail_Id'] = purchaseDetailId;
    // data['product_Id'] = productId;
    // data['product_Code'] = productCode;
    // data['product_name'] = productName;
    // data['color_Id'] = colorId;
    // data['color_Name'] = colorName;
    // data['size_Id'] = sizeId;
    // data['size_Name'] = sizeName;
    // data['colorHex'] = colorHex;
    // data['product_Detail_Id'] = productDetailId;
    // data['product_Detail_Name'] = productDetailName;
    // data['taxInclusive'] = taxInclusive;
    // data['barcode'] = barcode;
    // data['quantity'] = quantity;
    // data['free_Quantity'] = freeQuantity;
    // data['base_Unit_Id'] = baseUnitId;
    // data['base_Unit_Name'] = baseUnitName;
    // data['base_Factor'] = baseFactor;
    data['unit_Id'] = unitId;
    // data['unit_Name'] = unitName;
    // data['is_Primary_Unit'] = isPrimaryUnit;
    // data['convertion_Factor'] = convertionFactor;
    // data['purchase_Rate'] = purchaseRate;
    // data['purchase_Cost'] = purchaseCost;
    // data['exchange_Rate'] = exchangeRate;
    data['exchange_PurchaseRate'] = exchangePurchaseRate;
    data['exchange_Total'] = exchangeTotal;
    // data['retail_Rate'] = retailRate;
    // data['wholesale_Rate'] = wholesaleRate;
    // data['mrp'] = mrp;
    // data['tax_Percentage'] = taxPercentage;
    // data['disc_Percentage'] = discPercentage;
    // data['gross_Amount'] = grossAmount;
    // data['item_Discount'] = itemDiscount;
    // data['net_Amount'] = netAmount;
    // data['tax_Amount'] = taxAmount;
    // data['amount'] = amount;
    // data['unit_Price_Inclusive'] = unitPriceInclusive;
    // data['unit_Price_Exclusive'] = unitPriceExclusive;
    // data['manufacturing_Date'] = manufacturingDate;
    // data['expire_Date'] = expireDate;
    // data['batch_No'] = batchNo;
    // data['sgsT_Percentage'] = sgsTPercentage;
    // data['cgsT_Percentage'] = cgsTPercentage;
    // data['igsT_Percentage'] = igsTPercentage;
    // data['decimal'] = decimal;
    // data['category_Name'] = categoryName;
    // data['convertion_Type'] = convertionType;
    return data;
  }
}
