class GetVATreportDatamodel {
  int? status;
  String? message;
  List<Data>? data;

  GetVATreportDatamodel({this.status, this.message, this.data});

  GetVATreportDatamodel.fromJson(Map<String, dynamic> json) {
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
  // Null serialNo;
  int? branchId;
  String? branchName;
  int? counterId;
  String? counterName;
  int? customerId;
  // Null customerCode;
  String? customerName;
  String? registrationNo;
  String? contactPerson;
  String? phone;
  String? address;
  // Null totalPoint;
  // Null shippingAddress;
  // Null shipDate;
  // Null salesmanId;
  // Null salesmanCode;
  // Null salesmanName;
  int? userId;
  String? userName;
  int? paymentModeId;
  String? paymentModeName;
  int? paymentSubId;
  String? paymentSubName;
  // Null bankId;
  // Null bankName;
  // Null cardId;
  // Null cardNo;
  // Null vehicleId;
  String? destination;
  // Null driverName;
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
  double? discountPercentage;
  double? freightCharge;
  double? roundOff;
  double? grandTotal;
  // Null cgsTTotal;
  // Null sgsTTotal;
  // Null igsTTotal;
  double? multiCash;
  double? multiCard;
  bool? isSaved;
  bool? isCancelled;
  bool? isSync;
  // Null isHold;
  // Null isReturned;
  // Null companyId;
  // Null advance;
  // Null salesmanCommission;
  // Null managerCommission;
  // Null managerId;
  // Null projectName;
  // Null pONO;
  // Null dONO;
  // Null creditDuration;
  double? deliveryCharge;
  String? locationName;
  String? vehicleNo;
  // Null pointAmount;
  // Null pointEarned;
  // Null projectId;
  // Null deliveryNoteId;
  // Null quotationId;
  // Null salesOrderId;
  int? modifiedBy;
  String? modifiedDate;
  // Null year;
  // Null month;
  // Null monthNumber;
  // Null totalCount;
  // Null typeName;
  // Null transactionCount;
  String? machineName;
  // Null cancelledAmount;
  // Null cancelledCount;
  // Null agentId;
  // Null agentCommision;
  // Null openingCash;
  // Null cashIn;
  // Null cashOut;
  // Null closingCash;
  // Null doctorId;
  // Null doctorName;
  // Null nationalityName;
  // Null gsTNo;
  // Null regionName;
  // Null districtName;
  // Null stateCode;
  int? salesDetailId;
  // Null productId;
  // Null productDetailId;
  // Null productName;
  // Null productDetailName;
  // Null productDescription;
  // Null productCode;
  // Null colorName;
  // Null sizeName;
  // Null modelName;
  // Null colorHex;
  // Null regionalName;
  // Null categoryId;
  // Null categoryName;
  // Null brandId;
  // Null brandName;
  // Null barcode;
  // Null alterNateBarcode;
  // Null quantity;
  String? quantityDecimal;
  // Null freeQuantity;
  String? freeQuantityDecimal;
  // Null baseUnitId;
  // Null baseFactor;
  // Null baseUnitName;
  // Null isPrimaryUnit;
  // Null unitId;
  // Null unitName;
  // Null convertionFactor;
  // Null taxPercentage;
  bool? taxInclusive;
  // Null discPercentage;
  // Null salesRate;
  // Null retailRate;
  // Null mrp;
  double? salesPurchaseCost;
  // Null rateType;
  // Null grossAmount;
  // Null itemDiscount;
  // Null categoryDiscount;
  // Null netAmount;
  // Null taxAmount;
  // Null amount;
  // Null unitPriceInclusive;
  // Null unitPriceExclusive;
  // Null sgsTPercentage;
  // Null cgsTPercentage;
  // Null igsTPercentage;
  // Null packageId;
  // Null supplierId;
  // Null commissionPercentage;
  // Null servicePercentage;
  // Null salesReturnQuantity;
  bool? isProductReturned;
  // Null comment;
  // Null alterProductName;
  // Null alterProductRegName;
  String? appendName;
  // Null serviceCharge;
  bool? decimal;
  // Null isCombo;
  int? youSaved;
  String? expiryDate;
  // Null batchNo;
  // Null partNo;
  // Null isLens;
  double? profit;
  int? currentQuantity;
  int? iCurrentQuantity;
  // Null balnceQty;
  // Null nBalnceQty;
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
      this.customerId,
      // this.customerCode,
      this.customerName,
      this.registrationNo,
      this.contactPerson,
      this.phone,
      this.address,
      // this.totalPoint,
      // this.shippingAddress,
      // this.shipDate,
      // this.salesmanId,
      // this.salesmanCode,
      // this.salesmanName,
      this.userId,
      this.userName,
      this.paymentModeId,
      this.paymentModeName,
      this.paymentSubId,
      this.paymentSubName,
      // this.bankId,
      // this.bankName,
      // this.cardId,
      // this.cardNo,
      // this.vehicleId,
      this.destination,
      // this.driverName,
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
      this.discountPercentage,
      this.freightCharge,
      this.roundOff,
      this.grandTotal,
      // this.cgsTTotal,
      // this.sgsTTotal,
      // this.igsTTotal,
      this.multiCash,
      this.multiCard,
      this.isSaved,
      this.isCancelled,
      this.isSync,
      // this.isHold,
      // this.isReturned,
      // this.companyId,
      // this.advance,
      // this.salesmanCommission,
      // this.managerCommission,
      // this.managerId,
      // this.projectName,
      // this.pONO,
      // this.dONO,
      // this.creditDuration,
      this.deliveryCharge,
      this.locationName,
      this.vehicleNo,
      // this.pointAmount,
      // this.pointEarned,
      // this.projectId,
      // this.deliveryNoteId,
      // this.quotationId,
      // this.salesOrderId,
      this.modifiedBy,
      this.modifiedDate,
      // this.year,
      // this.month,
      // this.monthNumber,
      // this.totalCount,
      // this.typeName,
      // this.transactionCount,
      this.machineName,
      // this.cancelledAmount,
      // this.cancelledCount,
      // this.agentId,
      // this.agentCommision,
      // this.openingCash,
      // this.cashIn,
      // this.cashOut,
      // this.closingCash,
      // this.doctorId,
      // this.doctorName,
      // this.nationalityName,
      // this.gsTNo,
      // this.regionName,
      // this.districtName,
      // this.stateCode,
      this.salesDetailId,
      // this.productId,
      // this.productDetailId,
      // this.productName,
      // this.productDetailName,
      // this.productDescription,
      // this.productCode,
      // this.colorName,
      // this.sizeName,
      // this.modelName,
      // this.colorHex,
      // this.regionalName,
      // this.categoryId,
      // this.categoryName,
      // this.brandId,
      // this.brandName,
      // this.barcode,
      // this.alterNateBarcode,
      // this.quantity,
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
      // this.rateType,
      // this.grossAmount,
      // this.itemDiscount,
      // this.categoryDiscount,
      // this.netAmount,
      // this.taxAmount,
      // this.amount,
      // this.unitPriceInclusive,
      // this.unitPriceExclusive,
      // this.sgsTPercentage,
      // this.cgsTPercentage,
      // this.igsTPercentage,
      // this.packageId,
      // this.supplierId,
      // this.commissionPercentage,
      // this.servicePercentage,
      // this.salesReturnQuantity,
      this.isProductReturned,
      // this.comment,
      // this.alterProductName,
      // this.alterProductRegName,
      this.appendName,
      // this.serviceCharge,
      this.decimal,
      // this.isCombo,
      this.youSaved,
      this.expiryDate,
      // this.batchNo,
      // this.partNo,
      // this.isLens,
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
    customerId = json['customer_Id'];
    // customerCode = json['customer_Code'];
    customerName = json['customer_Name'];
    registrationNo = json['registration_No'];
    contactPerson = json['contact_Person'];
    phone = json['phone'];
    address = json['address'];
    // totalPoint = json['totalPoint'];
    // shippingAddress = json['shipping_Address'];
    // shipDate = json['ship_Date'];
    // salesmanId = json['salesman_Id'];
    // salesmanCode = json['salesman_Code'];
    // salesmanName = json['salesman_Name'];
    userId = json['user_Id'];
    userName = json['user_Name'];
    paymentModeId = json['paymentMode_Id'];
    paymentModeName = json['paymentMode_Name'];
    paymentSubId = json['paymentSub_Id'];
    paymentSubName = json['paymentSub_Name'];
    // bankId = json['bank_Id'];
    // bankName = json['bank_Name'];
    // cardId = json['card_Id'];
    // cardNo = json['card_No'];
    // vehicleId = json['vehicle_Id'];
    destination = json['destination'];
    // driverName = json['driver_Name'];
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
    discountPercentage = json['discount_Percentage'];
    freightCharge = json['freight_Charge'];
    roundOff = json['round_Off'];
    grandTotal = json['grand_Total'];
    // cgsTTotal = json['cgsT_Total'];
    // sgsTTotal = json['sgsT_Total'];
    // igsTTotal = json['igsT_Total'];
    multiCash = json['multiCash'];
    multiCard = json['multiCard'];
    isSaved = json['is_Saved'];
    isCancelled = json['is_Cancelled'];
    isSync = json['is_Sync'];
    // isHold = json['is_Hold'];
    // isReturned = json['is_Returned'];
    // companyId = json['company_Id'];
    // advance = json['advance'];
    // salesmanCommission = json['salesman_Commission'];
    // managerCommission = json['manager_Commission'];
    // managerId = json['manager_Id'];
    // projectName = json['project_Name'];
    // pONO = json['p_O_NO'];
    // dONO = json['d_O_NO'];
    // creditDuration = json['credit_Duration'];
    deliveryCharge = json['delivery_Charge'];
    locationName = json['location_Name'];
    vehicleNo = json['vehicle_No'];
    // pointAmount = json['point_Amount'];
    // pointEarned = json['point_Earned'];
    // projectId = json['project_Id'];
    // deliveryNoteId = json['deliveryNote_Id'];
    // quotationId = json['quotation_Id'];
    // salesOrderId = json['sales_Order_Id'];
    modifiedBy = json['modified_By'];
    modifiedDate = json['modified_Date'];
    // year = json['year'];
    // month = json['month'];
    // monthNumber = json['monthNumber'];
    // totalCount = json['totalCount'];
    // typeName = json['typeName'];
    // transactionCount = json['transactionCount'];
    machineName = json['machine_Name'];
    // cancelledAmount = json['cancelled_Amount'];
    // cancelledCount = json['cancelled_Count'];
    // agentId = json['agent_Id'];
    // agentCommision = json['agent_Commision'];
    // openingCash = json['openingCash'];
    // cashIn = json['cashIn'];
    // cashOut = json['cashOut'];
    // closingCash = json['closingCash'];
    // doctorId = json['doctor_Id'];
    // doctorName = json['doctor_Name'];
    // nationalityName = json['nationality_Name'];
    // gsTNo = json['gsT_No'];
    // regionName = json['region_Name'];
    // districtName = json['district_Name'];
    // stateCode = json['state_Code'];
    salesDetailId = json['sales_Detail_Id'];
    // productId = json['product_Id'];
    // productDetailId = json['product_Detail_Id'];
    // productName = json['product_Name'];
    // productDetailName = json['product_Detail_Name'];
    // productDescription = json['product_Description'];
    // productCode = json['product_Code'];
    // colorName = json['color_Name'];
    // sizeName = json['size_Name'];
    // modelName = json['model_Name'];
    // colorHex = json['colorHex'];
    // regionalName = json['regional_Name'];
    // categoryId = json['category_Id'];
    // categoryName = json['category_Name'];
    // brandId = json['brand_Id'];
    // brandName = json['brand_Name'];
    // barcode = json['barcode'];
    // alterNateBarcode = json['alterNate_Barcode'];
    // quantity = json['quantity'];
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
    // rateType = json['rate_Type'];
    // grossAmount = json['gross_Amount'];
    // itemDiscount = json['item_Discount'];
    // categoryDiscount = json['category_Discount'];
    // netAmount = json['net_Amount'];
    // taxAmount = json['tax_Amount'];
    // amount = json['amount'];
    // unitPriceInclusive = json['unit_Price_Inclusive'];
    // unitPriceExclusive = json['unit_Price_Exclusive'];
    // sgsTPercentage = json['sgsT_Percentage'];
    // cgsTPercentage = json['cgsT_Percentage'];
    // igsTPercentage = json['igsT_Percentage'];
    // packageId = json['package_Id'];
    // supplierId = json['supplier_Id'];
    // commissionPercentage = json['commission_Percentage'];
    // servicePercentage = json['service_Percentage'];
    // salesReturnQuantity = json['salesReturn_Quantity'];
    isProductReturned = json['isProduct_Returned'];
    // comment = json['comment'];
    // alterProductName = json['alter_ProductName'];
    // alterProductRegName = json['alter_ProductRegName'];
    appendName = json['append_Name'];
    // serviceCharge = json['service_Charge'];
    decimal = json['decimal'];
    // isCombo = json['is_Combo'];
    youSaved = json['youSaved'];
    expiryDate = json['expiry_Date'];
    // batchNo = json['batch_No'];
    // partNo = json['part_No'];
    // isLens = json['is_Lens'];
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
    data['customer_Id'] = customerId;
    // data['customer_Code'] = customerCode;
    data['customer_Name'] = customerName;
    data['registration_No'] = registrationNo;
    data['contact_Person'] = contactPerson;
    data['phone'] = phone;
    data['address'] = address;
    // data['totalPoint'] = totalPoint;
    // data['shipping_Address'] = shippingAddress;
    // data['ship_Date'] = shipDate;
    // data['salesman_Id'] = salesmanId;
    // data['salesman_Code'] = salesmanCode;
    // data['salesman_Name'] = salesmanName;
    data['user_Id'] = userId;
    data['user_Name'] = userName;
    data['paymentMode_Id'] = paymentModeId;
    data['paymentMode_Name'] = paymentModeName;
    data['paymentSub_Id'] = paymentSubId;
    data['paymentSub_Name'] = paymentSubName;
    // data['bank_Id'] = bankId;
    // data['bank_Name'] = bankName;
    // data['card_Id'] = cardId;
    // data['card_No'] = cardNo;
    // data['vehicle_Id'] = vehicleId;
    data['destination'] = destination;
    // data['driver_Name'] = driverName;
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
    data['discount_Percentage'] = discountPercentage;
    data['freight_Charge'] = freightCharge;
    data['round_Off'] = roundOff;
    data['grand_Total'] = grandTotal;
    // data['cgsT_Total'] = cgsTTotal;
    // data['sgsT_Total'] = sgsTTotal;
    // data['igsT_Total'] = igsTTotal;
    data['multiCash'] = multiCash;
    data['multiCard'] = multiCard;
    data['is_Saved'] = isSaved;
    data['is_Cancelled'] = isCancelled;
    data['is_Sync'] = isSync;
    // data['is_Hold'] = isHold;
    // data['is_Returned'] = isReturned;
    // data['company_Id'] = companyId;
    // data['advance'] = advance;
    // data['salesman_Commission'] = salesmanCommission;
    // data['manager_Commission'] = managerCommission;
    // data['manager_Id'] = managerId;
    // data['project_Name'] = projectName;
    // data['p_O_NO'] = pONO;
    // data['d_O_NO'] = dONO;
    // data['credit_Duration'] = creditDuration;
    data['delivery_Charge'] = deliveryCharge;
    data['location_Name'] = locationName;
    data['vehicle_No'] = vehicleNo;
    // data['point_Amount'] = pointAmount;
    // data['point_Earned'] = pointEarned;
    // data['project_Id'] = projectId;
    // data['deliveryNote_Id'] = deliveryNoteId;
    // data['quotation_Id'] = quotationId;
    // data['sales_Order_Id'] = salesOrderId;
    data['modified_By'] = modifiedBy;
    data['modified_Date'] = modifiedDate;
    // data['year'] = year;
    // data['month'] = month;
    // data['monthNumber'] = monthNumber;
    // data['totalCount'] = totalCount;
    // data['typeName'] = typeName;
    // data['transactionCount'] = transactionCount;
    data['machine_Name'] = machineName;
    // data['cancelled_Amount'] = cancelledAmount;
    // data['cancelled_Count'] = cancelledCount;
    // data['agent_Id'] = agentId;
    // data['agent_Commision'] = agentCommision;
    // data['openingCash'] = openingCash;
    // data['cashIn'] = cashIn;
    // data['cashOut'] = cashOut;
    // data['closingCash'] = closingCash;
    // data['doctor_Id'] = doctorId;
    // data['doctor_Name'] = doctorName;
    // data['nationality_Name'] = nationalityName;
    // data['gsT_No'] = gsTNo;
    // data['region_Name'] = regionName;
    // data['district_Name'] = districtName;
    // data['state_Code'] = stateCode;
    data['sales_Detail_Id'] = salesDetailId;
    // data['product_Id'] = productId;
    // data['product_Detail_Id'] = productDetailId;
    // data['product_Name'] = productName;
    // data['product_Detail_Name'] = productDetailName;
    // data['product_Description'] = productDescription;
    // data['product_Code'] = productCode;
    // data['color_Name'] = colorName;
    // data['size_Name'] = sizeName;
    // data['model_Name'] = modelName;
    // data['colorHex'] = colorHex;
    // data['regional_Name'] = regionalName;
    // data['category_Id'] = categoryId;
    // data['category_Name'] = categoryName;
    // data['brand_Id'] = brandId;
    // data['brand_Name'] = brandName;
    // data['barcode'] = barcode;
    // data['alterNate_Barcode'] = alterNateBarcode;
    // data['quantity'] = quantity;
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
    // data['rate_Type'] = rateType;
    // data['gross_Amount'] = grossAmount;
    // data['item_Discount'] = itemDiscount;
    // data['category_Discount'] = categoryDiscount;
    // data['net_Amount'] = netAmount;
    // data['tax_Amount'] = taxAmount;
    // data['amount'] = amount;
    // data['unit_Price_Inclusive'] = unitPriceInclusive;
    // data['unit_Price_Exclusive'] = unitPriceExclusive;
    // data['sgsT_Percentage'] = sgsTPercentage;
    // data['cgsT_Percentage'] = cgsTPercentage;
    // data['igsT_Percentage'] = igsTPercentage;
    // data['package_Id'] = packageId;
    // data['supplier_Id'] = supplierId;
    // data['commission_Percentage'] = commissionPercentage;
    // data['service_Percentage'] = servicePercentage;
    // data['salesReturn_Quantity'] = salesReturnQuantity;
    data['isProduct_Returned'] = isProductReturned;
    // data['comment'] = comment;
    // data['alter_ProductName'] = alterProductName;
    // data['alter_ProductRegName'] = alterProductRegName;
    data['append_Name'] = appendName;
    // data['service_Charge'] = serviceCharge;
    data['decimal'] = decimal;
    // data['is_Combo'] = isCombo;
    data['youSaved'] = youSaved;
    data['expiry_Date'] = expiryDate;
    // data['batch_No'] = batchNo;
    // data['part_No'] = partNo;
    // data['is_Lens'] = isLens;
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
