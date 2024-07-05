class ProductDatamodel {
  int? status;
  String? message;
  List<Data>? data;

  ProductDatamodel({this.status, this.message, this.data});

  ProductDatamodel.fromJson(Map<String, dynamic> json) {
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
  double? quantity;
  // Null? maxQuantity;
  // Null? minQuantity;
  int? productId;
  // Null? productName;
  // Null? shortName;
  String? productCode;
  // Null? partNo;
  // Null? subCategoryId;
  // Null? subCategoryName;
  // Null? categoryID;
  // Null? categoryName;
  int? categoryDiscount;
  // Null? brandID;
  // Null? brandName;
  int? openingStock;
  int? currentStock;
  int? minimumStock;
  int? maximumStock;
  int? taxPercentage;
  int? cessPercentage;
  int? discount;
  int? discountPercentage;
  int? purchaseRate;
  int? purchaseCost;
  int? wholeSalePercentage;
  int? retailPercentage;
  int? wholesaleRate;
  int? retailRate;
  // Null? unitRate;
  // Null? mrp;
  int? quotationRate;
  bool? taxInclusive;
  int? taxInclusiveRate;
  int? barcode;

  Data(
      {this.rowNumber,
      this.productDetailId,
      this.productDetailName,
      this.quantity,
      // this.maxQuantity,
      // this.minQuantity,
      this.productId,
      // this.productName,
      // this.shortName,
      this.productCode,
      // this.partNo,
      // this.subCategoryId,
      // this.subCategoryName,
      // this.categoryID,
      // this.categoryName,
      this.categoryDiscount,
      // this.brandID,
      // this.brandName,
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
      // this.mrp,
      this.quotationRate,
      this.taxInclusive,
      this.taxInclusiveRate,
      this.barcode});

  Data.fromJson(Map<String, dynamic> json) {
    rowNumber = json['rowNumber'];
    productDetailId = json['product_Detail_Id'];
    productDetailName = json['product_Detail_Name'];
    quantity = json['quantity'];
    // maxQuantity = json['maxQuantity'];
    // minQuantity = json['minQuantity'];
    productId = json['product_Id'];
    // productName = json['product_Name'];
    // shortName = json['short_Name'];
    productCode = json['product_Code'];
    // partNo = json['part_No'];
    // subCategoryId = json['subCategory_Id'];
    // subCategoryName = json['subCategory_Name'];
    // categoryID = json['category_ID'];
    // categoryName = json['category_Name'];
    categoryDiscount = json['category_Discount'];
    // brandID = json['brand_ID'];
    // brandName = json['brand_Name'];
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
    // mrp = json['mrp'];
    quotationRate = json['quotation_Rate'];
    taxInclusive = json['taxInclusive'];
    taxInclusiveRate = json['tax_Inclusive_Rate'];
    barcode = json['barcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rowNumber'] = rowNumber;
    data['product_Detail_Id'] = productDetailId;
    data['product_Detail_Name'] = productDetailName;
    data['quantity'] = quantity;
    // data['maxQuantity'] = maxQuantity;
    // data['minQuantity'] = minQuantity;
    data['product_Id'] = productId;
    // data['product_Name'] = productName;
    // data['short_Name'] = shortName;
    data['product_Code'] = productCode;
    // data['part_No'] = partNo;
    // data['subCategory_Id'] = subCategoryId;
    // data['subCategory_Name'] = subCategoryName;
    // data['category_ID'] = categoryID;
    // data['category_Name'] = categoryName;
    data['category_Discount'] = categoryDiscount;
    // data['brand_ID'] = brandID;
    // data['brand_Name'] = brandName;
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
    // data['mrp'] = mrp;
    data['quotation_Rate'] = quotationRate;
    data['taxInclusive'] = taxInclusive;
    data['tax_Inclusive_Rate'] = taxInclusiveRate;
    data['barcode'] = barcode;
    return data;
  }
}
