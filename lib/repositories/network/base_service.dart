import 'package:either_dart/either.dart';
import 'package:rynoz/datamodel/companydatamodel.dart';
import 'package:rynoz/datamodel/expirystock_datamodel.dart';
import 'package:rynoz/datamodel/getbranch_datamodel.dart';
import 'package:rynoz/datamodel/getcategory_datamodel.dart';
import 'package:rynoz/datamodel/getproduct.dart';
import 'package:rynoz/datamodel/getpurchasereport_datamodel.dart';
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
import 'package:rynoz/repositories/network/response_error.dart';

abstract class BaseServices {
  // Future<Either<ResponseError, dynamic>> verifyOtp(
  //     {String? phone, String? otp});
  Future<Either<ResponseError, Logindatamodel>> login(
      {String? username, String? password});
  Future<Either<ResponseError, GetBranchdatamodel>> getbranch();
  Future<Either<ResponseError, Getpaymentmodedatamodel>> getpaymentmode();
  Future<Either<ResponseError, Getpaymentsubdatamodel>> getpaymentsub();
  Future<Either<ResponseError, GetCategorydatamodel>> getcategory();
  Future<Either<ResponseError, MisreportDatamodel>> misreportwithdate(
      {String? startdate, String? enddate});
  Future<Either<ResponseError, GetPurchasereportdatamodel>>
      purchasereportwithdate({String? startdate, String? enddate, int? modeid});
  Future<Either<ResponseError, StockreportDatamodel>> stockreport(
      {String? barcode, String? productname, int? baseon, int? type});
  Future<Either<ResponseError, GetVATreportDatamodel>> vatreport({
    String? startdate,
    String? enddate,
  });
  Future<Either<ResponseError, GetminimumstockDatamodel>> getminimumstock();
  Future<Either<ResponseError, GetExpirystockDatamodel>> getexpirystock();
  Future<Either<ResponseError, ProductDatamodel>> getproduct(
      {int? count, int? categoryid});
  Future<Either<ResponseError, TransactionDatamodel>> gettransaction(
      {String? startdate, String? enddate, int? branchid});
  Future<Either<ResponseError, CompanyDatamodel>> getcompany();

  Future<Either<ResponseError, MonthwisegraphDatamodel>> getmonthwisegraph(
      {int? branchid});

  Future<Either<ResponseError, SalesreportDatamodel>> salesreport(
      {String? startdate, String? enddate, int? modeid, int? subid});
}
