import 'package:either_dart/either.dart';
import 'package:rynoz/datamodel/companydatamodel.dart';
import 'package:rynoz/datamodel/expirystock_datamodel.dart';
import 'package:rynoz/datamodel/getbranch_datamodel.dart';
import 'package:rynoz/datamodel/getcategory_datamodel.dart';
import 'package:rynoz/datamodel/getproduct.dart';
import 'package:rynoz/datamodel/getvatreport_datamodel.dart';
import 'package:rynoz/datamodel/login_datamodel.dart';
import 'package:rynoz/datamodel/minimumstock_datamodel.dart';
import 'package:rynoz/datamodel/misreport_datamodel.dart';
import 'package:rynoz/datamodel/monthwise_datamodel.dart';
import 'package:rynoz/datamodel/paymentmode_datamodel.dart';
import 'package:rynoz/datamodel/paymentsub_datamodel.dart';
import 'package:rynoz/datamodel/salesreport_datamodel.dart';
import 'package:rynoz/datamodel/stockreport_datamodel.dart';
import 'package:rynoz/datamodel/transactiondatamodel.dart';
import 'package:rynoz/repositories/network/api_request.dart';
import 'package:rynoz/repositories/network/base_service.dart';
import 'package:rynoz/repositories/network/response_error.dart';

import '../../datamodel/getpurchasereport_datamodel.dart';

class Services implements BaseServices {
  // @override
  // Future<Either<ResponseError, dynamic>> verifyOtp(
  //     {String? phone, String? otp}) {
  //   final body = {"mobile_number": phone, "otp": otp};
  //   return safe(postRequest(endPoint: "customer/api/v2/verify-otp", body: body))
  //       .thenRight(checkHttpStatus)
  //       .thenRight(parseJson)
  //       .mapRight((right) => right);
  // }

  @override
  Future<Either<ResponseError, Logindatamodel>> login(
      {String? username, String? password}) {
    return safe(getRequest(endPoint: "User/$username,$password"))
        .thenRight(checkHttpStatus)
        .thenRight(parseJson)
        .mapRight((right) {
      return Logindatamodel.fromJson(right);
    });
  }

  @override
  Future<Either<ResponseError, GetBranchdatamodel>> getbranch() {
    return safe(getRequest(endPoint: "Branch"))
        .thenRight(checkHttpStatus)
        .thenRight(parseJson)
        .mapRight((right) {
      return GetBranchdatamodel.fromJson(right);
    });
  }

  @override
  Future<Either<ResponseError, GetCategorydatamodel>> getcategory() {
    return safe(getRequest(endPoint: "Category"))
        .thenRight(checkHttpStatus)
        .thenRight(parseJson)
        .mapRight((right) {
      return GetCategorydatamodel.fromJson(right);
    });
  }

  @override
  Future<Either<ResponseError, Getpaymentmodedatamodel>> getpaymentmode() {
    return safe(getRequest(endPoint: "PaymentMode"))
        .thenRight(checkHttpStatus)
        .thenRight(parseJson)
        .mapRight((right) {
      return Getpaymentmodedatamodel.fromJson(right);
    });
  }

  @override
  Future<Either<ResponseError, Getpaymentsubdatamodel>> getpaymentsub() {
    return safe(getRequest(endPoint: "PaymentSub"))
        .thenRight(checkHttpStatus)
        .thenRight(parseJson)
        .mapRight((right) {
      return Getpaymentsubdatamodel.fromJson(right);
    });
  }

  @override
  Future<Either<ResponseError, GetPurchasereportdatamodel>>
      purchasereportwithdate(
          {String? startdate, String? enddate, int? modeid}) {
    return safe(getRequest(
            endPoint:
                "PurchaseReport/Payment?DateFrom=$startdate&DateTo=$enddate&PaymentMode_Id=${modeid == null || modeid == -1 ? '' : modeid}")) //date format 2024-04-01,2024-03-05
        .thenRight(checkHttpStatus)
        .thenRight(parseJson)
        .mapRight((right) {
      return GetPurchasereportdatamodel.fromJson(right);
    });
  }

  @override
  Future<Either<ResponseError, GetminimumstockDatamodel>> getminimumstock() {
    return safe(getRequest(endPoint: "Product/MinimumStock"))
        .thenRight(checkHttpStatus)
        .thenRight(parseJson)
        .mapRight((right) {
      return GetminimumstockDatamodel.fromJson(right);
    });
  }

  @override
  Future<Either<ResponseError, GetExpirystockDatamodel>> getexpirystock() {
    return safe(getRequest(endPoint: "Product/Expiry"))
        .thenRight(checkHttpStatus)
        .thenRight(parseJson)
        .mapRight((right) {
      return GetExpirystockDatamodel.fromJson(right);
    });
  }

  @override
  Future<Either<ResponseError, GetVATreportDatamodel>> vatreport({
    String? startdate,
    String? enddate,
  }) {
    return safe(getRequest(endPoint: "VATReport/$startdate,$enddate"))
        .thenRight(checkHttpStatus)
        .thenRight(parseJson)
        .mapRight((right) {
      return GetVATreportDatamodel.fromJson(right);
    });
  }

  @override
  Future<Either<ResponseError, MisreportDatamodel>> misreportwithdate(
      {String? startdate, String? enddate}) {
    return safe(getRequest(
            endPoint:
                "MISReport/$startdate,$enddate")) //date format 2024-04-01,2024-03-05
        .thenRight(checkHttpStatus)
        .thenRight(parseJson)
        .mapRight((right) {
      return MisreportDatamodel.fromJson(right);
    });
  }

  @override
  Future<Either<ResponseError, SalesreportDatamodel>> salesreport(
      {String? startdate, String? enddate, int? modeid, int? subid}) {
    return safe(getRequest(
            endPoint:
                "SalesReport/payment?DateFrom=$startdate&DateTo=$enddate&PaymentMode_Id=${modeid == null || modeid == -1 ? '' : modeid}&PaymentSub_Id=${subid == null || subid == -1 ? '' : subid}"))
        // date format 2024-04-01,2024-03-05

        .thenRight(checkHttpStatus)
        .thenRight(parseJson)
        .mapRight((right) {
      return SalesreportDatamodel.fromJson(right);
    });
  }

  @override
  Future<Either<ResponseError, StockreportDatamodel>> stockreport(
      {String? barcode, String? productname, int? baseon, int? type}) {
    return safe(getRequest(
            endPoint:
                "StockReport/Stock?Barcode=$barcode&Product_name=$productname&BaseOn=${baseon == null ? '' : baseon}&Type=${type == null ? '' : type}"))
        .thenRight(checkHttpStatus)
        .thenRight(parseJson)
        .mapRight((right) {
      return StockreportDatamodel.fromJson(right);
    });
  }

  @override
  Future<Either<ResponseError, ProductDatamodel>> getproduct(
      {int? count, int? categoryid}) {
    return safe(getRequest(endPoint: "Product/Top/$count,$categoryid"))
        .thenRight(checkHttpStatus)
        .thenRight(parseJson)
        .mapRight((right) {
      return ProductDatamodel.fromJson(right);
    });
  }

  @override
  Future<Either<ResponseError, MonthwisegraphDatamodel>> getmonthwisegraph(
      {int? branchid}) {
    return safe(getRequest(endPoint: "SalesMonthWiseReport/$branchid"))
        .thenRight(checkHttpStatus)
        .thenRight(parseJson)
        .mapRight((right) {
      return MonthwisegraphDatamodel.fromJson(right);
    });
  }

  @override
  Future<Either<ResponseError, TransactionDatamodel>> gettransaction(
      {int? branchid, String? startdate, String? enddate}) {
    return safe(getRequest(
            endPoint: "SalesReport/Transaction/$startdate,$enddate,$branchid"))
        .thenRight(checkHttpStatus)
        .thenRight(parseJson)
        .mapRight((right) {
      return TransactionDatamodel.fromJson(right);
    });
  }

  @override
  Future<Either<ResponseError, CompanyDatamodel>> getcompany() {
    return safe(getRequest(endPoint: "company"))
        .thenRight(checkHttpStatus)
        .thenRight(parseJson)
        .mapRight((right) {
      return CompanyDatamodel.fromJson(right);
    });
  }
}
