class GetminimumstockDatamodel {
  int? status;
  String? message;
  List<Data>? data;

  GetminimumstockDatamodel({this.status, this.message, this.data});

  GetminimumstockDatamodel.fromJson(Map<String, dynamic> json) {
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
  int? rowNumber;
  int? productDetailId;
  String? productDetailName;
  // Null? productDetailSupplierId;
  // Null? productDetailSupplierName;
  // Null? opStock;
  double? stock;
  // Null? batchNo;
  // Null? manufactoringDate;
  // Null? colorId;
  // Null? colorName;
  // Null? colorHex;
  // Null? sizeId;
  // Null? sizeName;
  // Null? modelId;
  // Null? modelName;
  // Null? plUNo;
  // Null? lotFrom;
  bool? isdelete;
  // Null? purchaseDetailId;
  // Null? godownId;
  // Null? godownName;
  // Null? wholesaleRatePercentage;
  // Null? retailRatePercentage;
  // Null? sellingUnitId;
  // Null? purchaseUnitId;
  // Null? unitDetailId;
  // Null? unitDetailId;
  int? branchId;
  String? branchName;
  // Null? supplierName;
  // Null? spRateFrom;
  // Null? specialRate;
  // Null? spRateTo;
  // Null? productDetailDescription;
  // Null? productDetailDiscount;
  // Null? productDetailDiscAmount;
  double? discRate;
  // Null? altQuantity;
  // Null? lastSalesRate;
  // Null? daysLeft;
  // Null? quantity;
  // Null? maxQuantity;
  // Null? minQuantity;
  int? productId;
  String? productName;
  String? shortName;
  String? productCode;
  String? partNo;
  // Null? subCategoryId;
  // Null? subCategoryName;
  int? categoryID;
  String? categoryName;
  int? categoryDiscount;
  int? brandID;
  String? brandName;
  double? openingStock;
  double? currentStock;
  double? minimumStock;
  double? maximumStock;
  double? taxPercentage;
  double? cessPercentage;
  double? discount;
  int? discountPercentage;
  int? purchaseRate;
  double? purchaseCost;
  double? wholeSalePercentage;
  double? retailPercentage;
  double? wholesaleRate;
  double? retailRate;
  // Null? unitRate;
  double? mrp;
  double? quotationRate;
  bool? taxInclusive;
  double? taxInclusiveRate;
  int? baseUnitId;
  String? baseUnitName;
  String? unitName;
  // Null? baseFactor;
  // Null? conversionFactor;
  // Null? salesunitId;
  // Null? purchaseunitId;
  // Null? packMode;
  String? image64;
  String? hsNCODE;
  // Null? remarks;
  // Null? plUNumber;
  String? regionalName;
  // Null? compensationCess;
  int? rackId;
  // Null? rackName;
  int? barcode;
  // Null? expiryDate;
  // Null? expiryDays;
  // Null? manufacturingDate;
  String? createdDate;
  // Null? companyId;
  bool? isActive;
  bool? decimal;
  int? productType;
  // Null? servicePercetage;
  // Null? codeTOPrint;
  // Null? supplierId;
  // Null? modifiedDate;
  // Null? modifiedBy;
  // Null? onlineStatus;
  // Null? commissionPercentage;
  // Null? countryId;
  // Null? countryName;
  // Null? sPPrice;
  // Null? productDescription;
  double? shortage;
  double? short;
  // Null? groupCartItem;
  // Null? totalRow;
  // bool? isCombo;
  // Null? subitemNewBarcode;
  // Null? reason;
  // Null? isLens;

  Data({
    this.rowNumber,
    this.productDetailId,
    this.productDetailName,
    // this.productDetailSupplierId,
    // this.productDetailSupplierName,
    // this.opStock,
    this.stock,
    // this.batchNo,
    // this.manufactoringDate,
    // this.colorId,
    // this.colorName,
    // this.colorHex,
    // this.sizeId,
    // this.sizeName,
    // this.modelId,
    // this.modelName,
    // this.plUNo,
    // this.lotFrom,
    this.isdelete,
    // this.purchaseDetailId,
    // this.godownId,
    // this.godownName,
    // this.wholesaleRatePercentage,
    // this.retailRatePercentage,
    // this.sellingUnitId,
    // this.purchaseUnitId,
    // this.unitDetailId,
    // this.unitDetailId,
    this.branchId,
    this.branchName,
    // this.supplierName,
    // this.spRateFrom,
    // this.specialRate,
    // this.spRateTo,
    // this.productDetailDescription,
    // this.productDetailDiscount,
    // this.productDetailDiscAmount,
    this.discRate,
    // this.altQuantity,
    // this.lastSalesRate,
    // this.daysLeft,
    // this.quantity,
    // this.maxQuantity,
    // this.minQuantity,
    this.productId,
    this.productName,
    this.shortName,
    this.productCode,
    this.partNo,
    // this.subCategoryId,
    // this.subCategoryName,
    this.categoryID,
    this.categoryName,
    this.categoryDiscount,
    this.brandID,
    this.brandName,
    this.openingStock,
    this.currentStock,
    this.minimumStock,
    this.maximumStock,
    this.taxPercentage,
    this.cessPercentage,
    this.discount,
    this.discountPercentage,
    this.purchaseRate,
    this.purchaseCost,
    this.wholeSalePercentage,
    this.retailPercentage,
    this.wholesaleRate,
    this.retailRate,
    // this.unitRate,
    this.mrp,
    this.quotationRate,
    this.taxInclusive,
    this.taxInclusiveRate,
    this.baseUnitId,
    this.baseUnitName,
    this.unitName,
    // this.baseFactor,
    // this.conversionFactor,
    // this.salesunitId,
    // this.purchaseunitId,
    // this.packMode,
    this.image64,
    this.hsNCODE,
    // this.remarks,
    // this.plUNumber,
    this.regionalName,
    // this.compensationCess,
    this.rackId,
    // this.rackName,
    this.barcode,
    // this.expiryDate,
    // this.expiryDays,
    // this.manufacturingDate,
    this.createdDate,
    // this.companyId,
    this.isActive,
    this.decimal,
    this.productType,
    // this.servicePercetage,
    // this.codeTOPrint,
    // this.supplierId,
    // this.modifiedDate,
    // this.modifiedBy,
    // this.onlineStatus,
    // this.commissionPercentage,
    // this.countryId,
    // this.countryName,
    // this.sPPrice,
    // this.productDescription,
    this.shortage,
    this.short,
    // this.groupCartItem,
    // this.totalRow,
    // this.isCombo,
    // this.subitemNewBarcode,
    // this.reason,
    // this.isLens
  });

  Data.fromJson(Map<String, dynamic> json) {
    rowNumber = json['rowNumber'];
    productDetailId = json['product_Detail_Id'];
    productDetailName = json['product_Detail_Name'];
    // productDetailSupplierId = json['productDetail_Supplier_Id'];
    // productDetailSupplierName = json['productDetail_Supplier_Name'];
    // opStock = json['op_Stock'];
    stock = json['stock'];
    // batchNo = json['batch_No'];
    // manufactoringDate = json['manufactoring_Date'];
    // colorId = json['color_Id'];
    // colorName = json['color_Name'];
    // colorHex = json['colorHex'];
    // sizeId = json['size_Id'];
    // sizeName = json['size_Name'];
    // modelId = json['model_Id'];
    // modelName = json['model_Name'];
    // plUNo = json['plU_No'];
    // lotFrom = json['lotFrom'];
    isdelete = json['isdelete'];
    // purchaseDetailId = json['purchase_Detail_Id'];
    // godownId = json['godown_Id'];
    // godownName = json['godown_Name'];
    // wholesaleRatePercentage = json['wholesale_Rate_Percentage'];
    // retailRatePercentage = json['retail_Rate_Percentage'];
    // sellingUnitId = json['selling_Unit_Id'];
    // purchaseUnitId = json['purchase_Unit_Id'];
    // unitDetailId = json['unitDetail_Id'];
    // unitDetailId = json['unit_Detail_Id'];
    branchId = json['branch_Id'];
    branchName = json['branch_Name'];
    // supplierName = json['supplier_Name'];
    // spRateFrom = json['sp_RateFrom'];
    // specialRate = json['special_Rate'];
    // spRateTo = json['sp_RateTo'];
    // productDetailDescription = json['product_Detail_Description'];
    // productDetailDiscount = json['product_Detail_Discount'];
    // productDetailDiscAmount = json['product_Detail_Disc_Amount'];
    discRate = json['disc_Rate'];
    // altQuantity = json['altQuantity'];
    // lastSalesRate = json['last_Sales_Rate'];
    // daysLeft = json['daysLeft'];
    // quantity = json['quantity'];
    // maxQuantity = json['maxQuantity'];
    // minQuantity = json['minQuantity'];
    productId = json['product_Id'];
    productName = json['product_Name'];
    shortName = json['short_Name'];
    productCode = json['product_Code'];
    partNo = json['part_No'];
    // subCategoryId = json['subCategory_Id'];
    // subCategoryName = json['subCategory_Name'];
    categoryID = json['category_ID'];
    categoryName = json['category_Name'];
    categoryDiscount = json['category_Discount'];
    brandID = json['brand_ID'];
    brandName = json['brand_Name'];
    openingStock = json['opening_Stock'];
    currentStock = json['current_Stock'];
    minimumStock = json['minimum_Stock'];
    maximumStock = json['maximum_Stock'];
    taxPercentage = json['tax_Percentage'];
    cessPercentage = json['cess_Percentage'];
    discount = json['discount'];
    discountPercentage = json['discount_Percentage'];
    purchaseRate = json['purchase_Rate'];
    purchaseCost = json['purchase_Cost'];
    wholeSalePercentage = json['wholeSalePercentage'];
    retailPercentage = json['retailPercentage'];
    wholesaleRate = json['wholesale_Rate'];
    retailRate = json['retail_Rate'];
    // unitRate = json['unitRate'];
    mrp = json['mrp'];
    quotationRate = json['quotation_Rate'];
    taxInclusive = json['taxInclusive'];
    taxInclusiveRate = json['tax_Inclusive_Rate'];
    baseUnitId = json['base_Unit_Id'];
    baseUnitName = json['base_Unit_Name'];
    unitName = json['unit_Name'];
    // baseFactor = json['baseFactor'];
    // conversionFactor = json['conversion_Factor'];
    // salesunitId = json['salesunit_Id'];
    // purchaseunitId = json['purchaseunit_Id'];
    // packMode = json['pack_Mode'];
    image64 = json['image64'];
    hsNCODE = json['hsN_CODE'];
    // remarks = json['remarks'];
    // plUNumber = json['plU_Number'];
    regionalName = json['regional_Name'];
    // compensationCess = json['compensation_Cess'];
    rackId = json['rack_Id'];
    // rackName = json['rack_Name'];
    barcode = json['barcode'];
    // expiryDate = json['expiry_Date'];
    // expiryDays = json['expiry_Days'];
    // manufacturingDate = json['manufacturing_Date'];
    createdDate = json['created_Date'];
    // companyId = json['company_Id'];
    isActive = json['is_Active'];
    decimal = json['decimal'];
    productType = json['product_Type'];
    // servicePercetage = json['service_Percetage'];
    // codeTOPrint = json['codeTOPrint'];
    // supplierId = json['supplier_Id'];
    // modifiedDate = json['modified_Date'];
    // modifiedBy = json['modified_By'];
    // onlineStatus = json['online_Status'];
    // commissionPercentage = json['commission_Percentage'];
    // countryId = json['country_Id'];
    // countryName = json['country_Name'];
    // sPPrice = json['sP_Price'];
    // productDescription = json['product_Description'];
    shortage = json['shortage'];
    short = json['short'];
    // groupCartItem = json['groupCartItem'];
    // totalRow = json['totalRow'];
    // isCombo = json['is_Combo'];
    // subitemNewBarcode = json['subitem_NewBarcode'];
    // reason = json['reason'];
    // isLens = json['is_Lens'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rowNumber'] = rowNumber;
    data['product_Detail_Id'] = productDetailId;
    data['product_Detail_Name'] = productDetailName;
    // data['productDetail_Supplier_Id'] = productDetailSupplierId;
    // data['productDetail_Supplier_Name'] = productDetailSupplierName;
    // data['op_Stock'] = opStock;
    data['stock'] = stock;
    // data['batch_No'] = batchNo;
    // data['manufactoring_Date'] = manufactoringDate;
    // data['color_Id'] = colorId;
    // data['color_Name'] = colorName;
    // data['colorHex'] = colorHex;
    // data['size_Id'] = sizeId;
    // data['size_Name'] = sizeName;
    // data['model_Id'] = modelId;
    // data['model_Name'] = modelName;
    // data['plU_No'] = plUNo;
    // data['lotFrom'] = lotFrom;
    // data['isdelete'] = isdelete;
    // data['purchase_Detail_Id'] = purchaseDetailId;
    // data['godown_Id'] = godownId;
    // data['godown_Name'] = godownName;
    // data['wholesale_Rate_Percentage'] = wholesaleRatePercentage;
    // data['retail_Rate_Percentage'] = retailRatePercentage;
    // data['selling_Unit_Id'] = sellingUnitId;
    // data['purchase_Unit_Id'] = purchaseUnitId;
    // data['unitDetail_Id'] = unitDetailId;
    // data['unit_Detail_Id'] = unitDetailId;
    data['branch_Id'] = branchId;
    data['branch_Name'] = branchName;
    // data['supplier_Name'] = supplierName;
    // data['sp_RateFrom'] = spRateFrom;
    // data['special_Rate'] = specialRate;
    // data['sp_RateTo'] = spRateTo;
    // data['product_Detail_Description'] = productDetailDescription;
    // data['product_Detail_Discount'] = productDetailDiscount;
    // data['product_Detail_Disc_Amount'] = productDetailDiscAmount;
    data['disc_Rate'] = discRate;
    // data['altQuantity'] = altQuantity;
    // data['last_Sales_Rate'] = lastSalesRate;
    // data['daysLeft'] = daysLeft;
    // data['quantity'] = quantity;
    // data['maxQuantity'] = maxQuantity;
    // data['minQuantity'] = minQuantity;
    data['product_Id'] = productId;
    data['product_Name'] = productName;
    data['short_Name'] = shortName;
    data['product_Code'] = productCode;
    data['part_No'] = partNo;
    // data['subCategory_Id'] = subCategoryId;
    // data['subCategory_Name'] = subCategoryName;
    data['category_ID'] = categoryID;
    data['category_Name'] = categoryName;
    data['category_Discount'] = categoryDiscount;
    data['brand_ID'] = brandID;
    data['brand_Name'] = brandName;
    data['opening_Stock'] = openingStock;
    data['current_Stock'] = currentStock;
    data['minimum_Stock'] = minimumStock;
    data['maximum_Stock'] = maximumStock;
    data['tax_Percentage'] = taxPercentage;
    data['cess_Percentage'] = cessPercentage;
    data['discount'] = discount;
    data['discount_Percentage'] = discountPercentage;
    data['purchase_Rate'] = purchaseRate;
    data['purchase_Cost'] = purchaseCost;
    data['wholeSalePercentage'] = wholeSalePercentage;
    data['retailPercentage'] = retailPercentage;
    data['wholesale_Rate'] = wholesaleRate;
    data['retail_Rate'] = retailRate;
    // data['unitRate'] = unitRate;
    data['mrp'] = mrp;
    data['quotation_Rate'] = quotationRate;
    data['taxInclusive'] = taxInclusive;
    data['tax_Inclusive_Rate'] = taxInclusiveRate;
    data['base_Unit_Id'] = baseUnitId;
    data['base_Unit_Name'] = baseUnitName;
    data['unit_Name'] = unitName;
    // data['baseFactor'] = baseFactor;
    // data['conversion_Factor'] = conversionFactor;
    // data['salesunit_Id'] = salesunitId;
    // data['purchaseunit_Id'] = purchaseunitId;
    // data['pack_Mode'] = packMode;
    data['image64'] = image64;
    data['hsN_CODE'] = hsNCODE;
    // data['remarks'] = remarks;
    // data['plU_Number'] = plUNumber;
    data['regional_Name'] = regionalName;
    // data['compensation_Cess'] = compensationCess;
    data['rack_Id'] = rackId;
    // data['rack_Name'] = rackName;
    data['barcode'] = barcode;
    // data['expiry_Date'] = expiryDate;
    // data['expiry_Days'] = expiryDays;
    // data['manufacturing_Date'] = manufacturingDate;
    data['created_Date'] = createdDate;
    // data['company_Id'] = companyId;
    data['is_Active'] = isActive;
    data['decimal'] = decimal;
    data['product_Type'] = productType;
    // data['service_Percetage'] = servicePercetage;
    // data['codeTOPrint'] = codeTOPrint;
    // data['supplier_Id'] = supplierId;
    // data['modified_Date'] = modifiedDate;
    // data['modified_By'] = modifiedBy;
    // data['online_Status'] = onlineStatus;
    // data['commission_Percentage'] = commissionPercentage;
    // data['country_Id'] = countryId;
    // data['country_Name'] = countryName;
    // data['sP_Price'] = sPPrice;
    // data['product_Description'] = productDescription;
    data['shortage'] = shortage;
    data['short'] = short;
    // data['groupCartItem'] = groupCartItem;
    // data['totalRow'] = totalRow;
    // data['is_Combo'] = isCombo;
    // data['subitem_NewBarcode'] = subitemNewBarcode;
    // data['reason'] = reason;
    // data['is_Lens'] = isLens;
    return data;
  }
}
