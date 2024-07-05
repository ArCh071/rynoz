import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
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
import 'package:rynoz/helper/appconfig.dart';
import 'package:rynoz/helper/extension.dart';
import 'package:rynoz/helper/helpers.dart';
import 'package:rynoz/helper/providerhelperclass.dart';
import 'package:rynoz/main.dart';
import 'package:rynoz/repositories/network/base_service.dart';
import 'package:rynoz/repositories/sharedprefs/shared_prefs.dart';
import 'package:rynoz/view/initialslider.dart';

class HomeProvider extends ProviderHelperClass with ChangeNotifier {
  final services = GetIt.instance<BaseServices>();
  final sharedPrefs = GetIt.instance<SharedPrefs>();

  @override
  void updateLoadState(LoaderState state) {
    loaderState = state;
    notifyListeners();
  }

  int? stockselected;
  getstockselected(int val) {
    stockselected = val;
    notifyListeners();
  }

  int? baseonselected;
  getbaseonselected(int val) {
    baseonselected = val;
    notifyListeners();
  }

  int? selectedmode;
  int? selectedsub;
  String? selectedmodename;
  String? selectedsubname;
  getselectedmode(int val) {
    selectedmode = val;
    selectedmodename = paymentmode?.data![val].paymentModeName;
    notifyListeners();
  }

  getselectedsub(int val) {
    selectedsub = val;
    selectedsubname = paymentsub?.data![val].paymentSubName;
    notifyListeners();
  }

  String? startdate;
  getstartdate(DateTime date) {
    startdate = DateFormat('dd MMMyy').format(date);
    notifyListeners();
  }

  String? endate;
  getenddate(DateTime date) {
    endate = DateFormat('dd MMMyy').format(date);
    notifyListeners();
  }

  String? transstartdate;
  gettransstartdate(DateTime date) {
    transstartdate = DateFormat('dd MMMyy').format(date);
    notifyListeners();
  }

  String? transendate;
  gettransenddate(DateTime date) {
    transendate = DateFormat('dd MMMyy').format(date);
    notifyListeners();
  }

  String? misstartdate;
  getmisstartdate(DateTime date) {
    misstartdate = DateFormat('dd MMMyy').format(date);
    notifyListeners();
  }

  String? misendate;
  getmisenddate(DateTime date) {
    misendate = DateFormat('dd MMMyy').format(date);
    notifyListeners();
  }

  int? purselectedmode;
  String? purselectedmodename;

  getpurselectedmode(int val) {
    purselectedmode = val;
    purselectedmodename = paymentmode?.data![val].paymentModeName;
    notifyListeners();
  }

  String? purstartdate;
  getpurstartdate(DateTime date) {
    purstartdate = DateFormat('dd MMMyy').format(date);
    notifyListeners();
  }

  String? purendate;
  getpurenddate(DateTime date) {
    purendate = DateFormat('dd MMMyy').format(date);
    notifyListeners();
  }

  String? vatstartdate;
  getvatstartdate(DateTime date) {
    vatstartdate = DateFormat('dd MMMyy').format(date);
    notifyListeners();
  }

  String? vatendate;
  getvatenddate(DateTime date) {
    vatendate = DateFormat('dd MMMyy').format(date);
    notifyListeners();
  }

  getdata() async {
    AppConfig.id = await sharedPrefs.getid();
    AppConfig.name = await sharedPrefs.getname();
    AppConfig.phone = await sharedPrefs.getphone();
    AppConfig.pin = await sharedPrefs.getpin();
    AppConfig.email = await sharedPrefs.getemail();
    AppConfig.address = await sharedPrefs.getaddress();
    AppConfig.nation = await sharedPrefs.getnation();
    AppConfig.state = await sharedPrefs.getstate();
    AppConfig.icon = await sharedPrefs.geticon();
  }

  LoaderState branchLoaderState = LoaderState.loaded;
  void updatebranchLoaderState(LoaderState state) {
    branchLoaderState = state;
    notifyListeners();
  }

  LoaderState categoryLoaderState = LoaderState.loaded;
  void updatecategoryLoaderState(LoaderState state) {
    categoryLoaderState = state;
    notifyListeners();
  }

  LoaderState paymentmodeLoaderState = LoaderState.loaded;
  void updatepaymentmodeLoaderState(LoaderState state) {
    paymentmodeLoaderState = state;
    notifyListeners();
  }

  LoaderState paymentsubLoaderState = LoaderState.loaded;
  void updatepaymentsubLoaderState(LoaderState state) {
    paymentsubLoaderState = state;
    notifyListeners();
  }

  LoaderState purchasereportdataLoaderState = LoaderState.loaded;
  void updatepurchasereportdataLoaderState(LoaderState state) {
    purchasereportdataLoaderState = state;
    notifyListeners();
  }

  LoaderState stockportdataLoaderState = LoaderState.loaded;
  void updatestockereportdataLoaderState(LoaderState state) {
    stockportdataLoaderState = state;
    notifyListeners();
  }

  LoaderState productdataLoaderState = LoaderState.loaded;
  void updateproductdataLoaderState(LoaderState state) {
    productdataLoaderState = state;
    notifyListeners();
  }

  LoaderState minimumstockdataLoaderState = LoaderState.loaded;
  void updateminimumstockdataLoaderState(LoaderState state) {
    minimumstockdataLoaderState = state;
    notifyListeners();
  }

  LoaderState expirystockdataLoaderState = LoaderState.loaded;
  void updateexpirystockdataLoaderState(LoaderState state) {
    expirystockdataLoaderState = state;
    notifyListeners();
  }

  bool showToastFlag = false;

  GetBranchdatamodel? branchdata;
  GetCategorydatamodel? categorydata;
  Getpaymentmodedatamodel? paymentmode;
  Getpaymentsubdatamodel? paymentsub;
  GetPurchasereportdatamodel? purchasereportdata;
  SalesreportDatamodel? salesreportdata;
  StockreportDatamodel? stockreportdata;
  MisreportDatamodel? misreportdata;
  GetVATreportDatamodel? vatreportdata;
  GetminimumstockDatamodel? minimumstockdata;
  GetExpirystockDatamodel? expirystockdata;
  Logindatamodel? logindata;
  ProductDatamodel? getproducts;
  MonthwisegraphDatamodel? getmonthwisegraph;
  TransactionDatamodel? gettransactiondata;
  CompanyDatamodel? company;
  Future<void> login({String? username, String? password}) async {
    updateLoadState(LoaderState.loading);
    // updateVehicleTypeLoaderState(LoaderState.loading);
    final network = await Helpers.isInternetAvailable();
    if (network) {
      await services.login(password: password, username: username).fold(
        (left) {
          logindata = null;
          print(left.message);
          Helpers.showToast("${left.message}");
          // updateVehicleTypeLoaderState(LoaderState.error);
        },
        (right) {
          print(right);
          if (right.status == 200 && right.data != null) {
            logindata = right;
            sharedPrefs.saveid(id: "${logindata?.data![0].userId}");
            sharedPrefs.savename(name: "${logindata?.data![0].userName}");
            sharedPrefs.saveaddress(address: "${logindata?.data![0].adress}");
            sharedPrefs.saveemmail(email: "${logindata?.data![0].emailId}");
            sharedPrefs.savephone(phone: "${logindata?.data![0].phone}");
            sharedPrefs.saveicon(icon: "${logindata?.data![0].icon}");
            sharedPrefs.savenation(
                nation: "${logindata?.data![0].nationality}");
            sharedPrefs.savepin(pin: "${logindata?.data![0].pin}");
            sharedPrefs.savestate(state: "${logindata?.data![0].state}");
            getdata();
          } else {
            Helpers.showToast("${right.message}");
            logindata = null;
          }
          notifyListeners();
        },
      ).catchError((error) {
        logindata = null;
        debugPrint(error.toString());
      });
    } else {
      logindata = null;
      // updateVehicleTypeLoaderState(LoaderState.networkError);
    }
  }

  Future<void> getbranch() async {
    updatebranchLoaderState(LoaderState.loading);
    final network = await Helpers.isInternetAvailable();
    if (network) {
      await services.getbranch().fold(
        (left) {
          branchdata = null;
          Helpers.showToast("${left.message}");
          updatebranchLoaderState(LoaderState.error);
        },
        (right) {
          if (right.status == 200) {
            branchdata = right;
            updatebranchLoaderState(LoaderState.loaded);
          } else if (right.status == 500) {
            branchdata = null;

            sharedPrefs.clearall();
            navigatorKey.currentState?.pushReplacement(MaterialPageRoute(
              builder: (context) => const FinalSlider(),
            ));
            if (showToastFlag == false) {
              // Helpers.showToast("${right.message}");
              showToastFlag = true;
              Helpers.showToast("Please sign in");
            }
            updatebranchLoaderState(LoaderState.error);
          } else {
            branchdata = null;
            // Helpers.showToast("${right.message}");
            updatebranchLoaderState(LoaderState.error);
          }

          notifyListeners();
        },
      ).catchError((error) {
        branchdata = null;
        updatebranchLoaderState(LoaderState.error);
        debugPrint(error.toString());
      });
    } else {
      branchdata = null;
      updatebranchLoaderState(LoaderState.networkError);
    }
  }

  Future<void> getcompany() async {
    updatebranchLoaderState(LoaderState.loading);
    final network = await Helpers.isInternetAvailable();
    if (network) {
      await services.getcompany().fold(
        (left) {
          company = null;
          Helpers.showToast("${left.message}");
          updatebranchLoaderState(LoaderState.error);
        },
        (right) {
          if (right.status == 200) {
            company = right;
            updatebranchLoaderState(LoaderState.loaded);
          } else if (right.status == 500) {
            company = null;

            sharedPrefs.clearall();
            navigatorKey.currentState?.pushReplacement(MaterialPageRoute(
              builder: (context) => const FinalSlider(),
            ));
            if (showToastFlag == false) {
              // Helpers.showToast("${right.message}");
              showToastFlag = true;
              Helpers.showToast("Please sign in");
            }
            updatebranchLoaderState(LoaderState.error);
          } else {
            branchdata = null;
            // Helpers.showToast("${right.message}");
            updatebranchLoaderState(LoaderState.error);
          }

          notifyListeners();
        },
      ).catchError((error) {
        company = null;
        updatebranchLoaderState(LoaderState.error);
        debugPrint(error.toString());
      });
    } else {
      branchdata = null;
      updatebranchLoaderState(LoaderState.networkError);
    }
  }

  Future<void> getcategory() async {
    updateLoadState(LoaderState.loading);
    updatecategoryLoaderState(LoaderState.loading);
    final network = await Helpers.isInternetAvailable();
    if (network) {
      await services.getcategory().fold(
        (left) {
          categorydata = null;
          Helpers.showToast("${left.message}");
          updatecategoryLoaderState(LoaderState.error);
          updateLoadState(LoaderState.error);
        },
        (right) {
          if (right.status == 200) {
            categorydata = right;

            updatecategoryLoaderState(LoaderState.loaded);
            updateLoadState(LoaderState.loaded);
          } else if (right.status == 500) {
            categorydata = null;
            sharedPrefs.clearall();
            navigatorKey.currentState?.pushReplacement(MaterialPageRoute(
              builder: (context) => const FinalSlider(),
            ));
            if (showToastFlag == false) {
              // Helpers.showToast("${right.message}");
              showToastFlag = true;
              Helpers.showToast("Please sign in");
            }
            updatecategoryLoaderState(LoaderState.error);
            updateLoadState(LoaderState.error);
          } else {
            categorydata = null;
            // Helpers.showToast("${right.message}");
            updatecategoryLoaderState(LoaderState.error);
            updateLoadState(LoaderState.error);
          }

          notifyListeners();
        },
      ).catchError((error) {
        categorydata = null;
        updatecategoryLoaderState(LoaderState.error);
        updateLoadState(LoaderState.error);

        debugPrint(error.toString());
      });
    } else {
      categorydata = null;
      updatecategoryLoaderState(LoaderState.networkError);
      updateLoadState(LoaderState.networkError);
    }
  }

  Future<void> getpaymentsub() async {
    updatepaymentsubLoaderState(LoaderState.loading);
    final network = await Helpers.isInternetAvailable();
    if (network) {
      await services.getpaymentsub().fold(
        (left) {
          paymentsub = null;
          Helpers.showToast("${left.message}");
          updatepaymentsubLoaderState(LoaderState.error);
        },
        (right) {
          if (right.status == 200) {
            paymentsub = right;
            updatepaymentsubLoaderState(LoaderState.loaded);
          } else if (right.status == 500) {
            paymentsub = null;
            sharedPrefs.clearall();
            navigatorKey.currentState?.pushReplacement(MaterialPageRoute(
              builder: (context) => const FinalSlider(),
            ));
            if (showToastFlag == false) {
              // Helpers.showToast("${right.message}");
              showToastFlag = true;
              Helpers.showToast("Please sign in");
            }
            updatepaymentsubLoaderState(LoaderState.error);
          } else {
            paymentsub = null;
            // Helpers.showToast("${right.message}");
            updatepaymentsubLoaderState(LoaderState.error);
          }

          notifyListeners();
        },
      ).catchError((error) {
        paymentsub = null;
        updatepaymentsubLoaderState(LoaderState.error);
        debugPrint(error.toString());
      });
    } else {
      paymentsub = null;
      updatepaymentsubLoaderState(LoaderState.networkError);
    }
  }

  Future<void> getpaymentmode() async {
    updatepaymentmodeLoaderState(LoaderState.loading);
    final network = await Helpers.isInternetAvailable();
    if (network) {
      await services.getpaymentmode().fold(
        (left) {
          paymentmode = null;
          Helpers.showToast("${left.message}");
          updatepaymentmodeLoaderState(LoaderState.error);
        },
        (right) {
          if (right.status == 200) {
            paymentmode = right;
            updatepaymentmodeLoaderState(LoaderState.loaded);
          } else if (right.status == 500) {
            paymentmode = null;
            sharedPrefs.clearall();
            navigatorKey.currentState?.pushReplacement(MaterialPageRoute(
              builder: (context) => const FinalSlider(),
            ));
            if (showToastFlag == false) {
              // Helpers.showToast("${right.message}");
              showToastFlag = true;
              Helpers.showToast("Please sign in");
            }
            updatepaymentmodeLoaderState(LoaderState.error);
          } else {
            paymentmode = null;
            // Helpers.showToast("${right.message}");
            updatepaymentmodeLoaderState(LoaderState.error);
          }
          notifyListeners();
        },
      ).catchError((error) {
        paymentmode = null;
        updatepaymentmodeLoaderState(LoaderState.error);
        debugPrint(error.toString());
      });
    } else {
      paymentmode = null;
      updatepaymentmodeLoaderState(LoaderState.networkError);
    }
  }

  Future<void> getpurchasereport(
      {String? startdate, String? endate, int? modeid}) async {
    updatepurchasereportdataLoaderState(LoaderState.loading);
    final network = await Helpers.isInternetAvailable();
    if (network) {
      await services
          .purchasereportwithdate(
              startdate: startdate, enddate: endate, modeid: modeid)
          .fold(
        (left) {
          purchasereportdata = null;
          Helpers.showToast("${left.message}");
          updatepurchasereportdataLoaderState(LoaderState.error);
        },
        (right) {
          if (right.status == 200) {
            purchasereportdata = right;

            updatepurchasereportdataLoaderState(LoaderState.loaded);
          } else if (right.status == 500) {
            purchasereportdata = null;
            sharedPrefs.clearall();
            navigatorKey.currentState?.pushReplacement(MaterialPageRoute(
              builder: (context) => const FinalSlider(),
            ));
            if (showToastFlag == false) {
              // Helpers.showToast("${right.message}");
              showToastFlag = true;
              Helpers.showToast("Please sign in");
            }
            updatepurchasereportdataLoaderState(LoaderState.error);
          } else {
            purchasereportdata = null;
            // Helpers.showToast("${right.message}");
            updatepurchasereportdataLoaderState(LoaderState.error);
          }
          notifyListeners();
        },
      ).catchError((error) {
        purchasereportdata = null;
        updatepurchasereportdataLoaderState(LoaderState.error);
        debugPrint(error.toString());
      });
    } else {
      purchasereportdata = null;
      updatepurchasereportdataLoaderState(LoaderState.networkError);
    }
  }

  Future<void> getminimumstock() async {
    updateminimumstockdataLoaderState(LoaderState.loading);
    final network = await Helpers.isInternetAvailable();
    if (network) {
      await services.getminimumstock().fold(
        (left) {
          minimumstockdata = null;
          Helpers.showToast("${left.message}");
          updateminimumstockdataLoaderState(LoaderState.error);
        },
        (right) {
          if (right.status == 200) {
            minimumstockdata = right;
            updateminimumstockdataLoaderState(LoaderState.loaded);
          } else if (right.status == 500) {
            minimumstockdata = null;
            sharedPrefs.clearall();
            navigatorKey.currentState?.pushReplacement(MaterialPageRoute(
              builder: (context) => const FinalSlider(),
            ));
            if (showToastFlag == false) {
              // Helpers.showToast("${right.message}");
              showToastFlag = true;
              Helpers.showToast("Please sign in");
            }
            updateminimumstockdataLoaderState(LoaderState.error);
          } else {
            minimumstockdata = null;
            // Helpers.showToast("${right.message}");
            updateminimumstockdataLoaderState(LoaderState.error);
          }
          notifyListeners();
        },
      ).catchError((error) {
        minimumstockdata = null;
        updateminimumstockdataLoaderState(LoaderState.error);
        debugPrint(error.toString());
      });
    } else {
      minimumstockdata = null;
      updateminimumstockdataLoaderState(LoaderState.networkError);
    }
  }

  Future<void> getexpirystock() async {
    updateexpirystockdataLoaderState(LoaderState.loading);
    final network = await Helpers.isInternetAvailable();
    if (network) {
      await services.getexpirystock().fold(
        (left) {
          expirystockdata = null;
          Helpers.showToast("${left.message}");
          updateexpirystockdataLoaderState(LoaderState.error);
        },
        (right) {
          if (right.status == 200) {
            expirystockdata = right;
            updateexpirystockdataLoaderState(LoaderState.loaded);
          } else if (right.status == 500) {
            expirystockdata = null;
            sharedPrefs.clearall();
            navigatorKey.currentState?.pushReplacement(MaterialPageRoute(
              builder: (context) => const FinalSlider(),
            ));
            if (showToastFlag == false) {
              // Helpers.showToast("${right.message}");
              showToastFlag = true;
              Helpers.showToast("Please sign in");
            }
            updateexpirystockdataLoaderState(LoaderState.error);
          } else {
            expirystockdata = null;
            // Helpers.showToast("${right.message}");
            updateexpirystockdataLoaderState(LoaderState.error);
          }
          notifyListeners();
        },
      ).catchError((error) {
        expirystockdata = null;
        updateexpirystockdataLoaderState(LoaderState.error);
        debugPrint(error.toString());
      });
    } else {
      expirystockdata = null;
      updateexpirystockdataLoaderState(LoaderState.networkError);
    }
  }

  Future<void> getsalesreport(
      {String? startdate, String? endate, int? modeid, int? subid}) async {
    updatepurchasereportdataLoaderState(LoaderState.loading);
    final network = await Helpers.isInternetAvailable();
    if (network) {
      await services
          .salesreport(
              startdate: startdate,
              enddate: endate,
              modeid: modeid,
              subid: subid)
          .fold(
        (left) {
          salesreportdata = null;
          Helpers.showToast("${left.message}");
          updatepurchasereportdataLoaderState(LoaderState.error);
        },
        (right) {
          if (right.status == 200) {
            salesreportdata = right;

            updatepurchasereportdataLoaderState(LoaderState.loaded);
          } else if (right.status == 500) {
            salesreportdata = null;
            sharedPrefs.clearall();
            navigatorKey.currentState?.pushReplacement(MaterialPageRoute(
              builder: (context) => const FinalSlider(),
            ));
            if (showToastFlag == false) {
              // Helpers.showToast("${right.message}");
              showToastFlag = true;
              Helpers.showToast("Please sign in");
            }
            updatepaymentsubLoaderState(LoaderState.error);
          } else {
            salesreportdata = null;
            // Helpers.showToast("${right.message}");
            updatepaymentsubLoaderState(LoaderState.error);
          }
          notifyListeners();
        },
      ).catchError((error) {
        salesreportdata = null;
        updatepurchasereportdataLoaderState(LoaderState.error);
        debugPrint(error.toString());
      });
    } else {
      salesreportdata = null;
      updatepurchasereportdataLoaderState(LoaderState.networkError);
    }
  }

  Future<void> getvatreport({String? startdate, String? endate}) async {
    updatepurchasereportdataLoaderState(LoaderState.loading);
    final network = await Helpers.isInternetAvailable();
    if (network) {
      await services
          .vatreport(
        startdate: startdate,
        enddate: endate,
      )
          .fold(
        (left) {
          vatreportdata = null;
          Helpers.showToast("${left.message}");
          updatepurchasereportdataLoaderState(LoaderState.error);
        },
        (right) {
          if (right.status == 200) {
            vatreportdata = right;

            updatepurchasereportdataLoaderState(LoaderState.loaded);
          } else if (right.status == 500) {
            vatreportdata = null;
            sharedPrefs.clearall();
            navigatorKey.currentState?.pushReplacement(MaterialPageRoute(
              builder: (context) => const FinalSlider(),
            ));
            if (showToastFlag == false) {
              // Helpers.showToast("${right.message}");
              showToastFlag = true;
              Helpers.showToast("Please sign in");
            }
            updatepurchasereportdataLoaderState(LoaderState.error);
          } else {
            vatreportdata = null;
            // Helpers.showToast("${right.message}");
            updatepurchasereportdataLoaderState(LoaderState.error);
          }
          notifyListeners();
        },
      ).catchError((error) {
        vatreportdata = null;
        updatepurchasereportdataLoaderState(LoaderState.error);
        debugPrint(error.toString());
      });
    } else {
      vatreportdata = null;
      updatepurchasereportdataLoaderState(LoaderState.networkError);
    }
  }

  Future<void> getstockreport(
      {String? barcode, String? productname, int? baseon, int? type}) async {
    updatestockereportdataLoaderState(LoaderState.loading);
    final network = await Helpers.isInternetAvailable();
    if (network) {
      await services
          .stockreport(
              barcode: barcode,
              baseon: baseon,
              productname: productname,
              type: type)
          .fold(
        (left) {
          salesreportdata = null;
          Helpers.showToast("${left.message}");
          updatestockereportdataLoaderState(LoaderState.error);
        },
        (right) {
          if (right.status == 200) {
            stockreportdata = right;
            // salesreportdata!.data!.isEmpty
            //     ? Helpers.showToast("No data found")
            //     : null;
            updatestockereportdataLoaderState(LoaderState.loaded);
          } else if (right.status == 500) {
            stockreportdata = null;
            sharedPrefs.clearall();
            navigatorKey.currentState?.pushReplacement(MaterialPageRoute(
              builder: (context) => const FinalSlider(),
            ));
            if (showToastFlag == false) {
              // Helpers.showToast("${right.message}");
              showToastFlag = true;
              Helpers.showToast("Please sign in");
            }
            updatestockereportdataLoaderState(LoaderState.error);
          } else {
            stockreportdata = null;
            // Helpers.showToast("${right.message}");
            updatestockereportdataLoaderState(LoaderState.error);
          }
          notifyListeners();
        },
      ).catchError((error) {
        stockreportdata = null;
        updatestockereportdataLoaderState(LoaderState.error);
        debugPrint(error.toString());
      });
    } else {
      stockreportdata = null;
      updatestockereportdataLoaderState(LoaderState.networkError);
    }
  }

  Future<void> getmisreport({String? startdate, String? endate}) async {
    updatepurchasereportdataLoaderState(LoaderState.loading);
    final network = await Helpers.isInternetAvailable();
    if (network) {
      await services
          .misreportwithdate(startdate: startdate, enddate: endate)
          .fold(
        (left) {
          misreportdata = null;
          Helpers.showToast("${left.message}");
          updatepurchasereportdataLoaderState(LoaderState.error);
        },
        (right) {
          if (right.status == 200) {
            misreportdata = right;

            updatepurchasereportdataLoaderState(LoaderState.loaded);
          } else if (right.status == 500) {
            misreportdata = null;
            sharedPrefs.clearall();
            navigatorKey.currentState?.pushReplacement(MaterialPageRoute(
              builder: (context) => const FinalSlider(),
            ));
            if (showToastFlag == false) {
              // Helpers.showToast("${right.message}");
              showToastFlag = true;
              Helpers.showToast("Please sign in");
            }
            updatepurchasereportdataLoaderState(LoaderState.error);
          } else {
            misreportdata = null;
            // Helpers.showToast("${right.message}");
            updatepurchasereportdataLoaderState(LoaderState.error);
          }
          notifyListeners();
        },
      ).catchError((error) {
        misreportdata = null;
        updatepurchasereportdataLoaderState(LoaderState.error);
        debugPrint(error.toString());
      });
    } else {
      misreportdata = null;
      updatepurchasereportdataLoaderState(LoaderState.networkError);
    }
  }

  Future<void> getproduct({int? count, int? categoryid}) async {
    updateproductdataLoaderState(LoaderState.loading);
    final network = await Helpers.isInternetAvailable();
    if (network) {
      await services.getproduct(count: count, categoryid: categoryid).fold(
        (left) {
          getproducts = null;
          Helpers.showToast("${left.message}");
          updateproductdataLoaderState(LoaderState.error);
        },
        (right) {
          if (right.status == 200) {
            getproducts = right;
            updateproductdataLoaderState(LoaderState.loaded);
          } else if (right.status == 500) {
            getproducts = null;
            sharedPrefs.clearall();
            navigatorKey.currentState?.pushReplacement(MaterialPageRoute(
              builder: (context) => const FinalSlider(),
            ));
            if (showToastFlag == false) {
              // Helpers.showToast("${right.message}");
              showToastFlag = true;
              Helpers.showToast("Please sign in");
            }
            updateproductdataLoaderState(LoaderState.error);
          } else {
            getproducts = null;
            // Helpers.showToast("${right.message}");
            updateproductdataLoaderState(LoaderState.error);
          }
          notifyListeners();
        },
      ).catchError((error) {
        getproducts = null;
        updateproductdataLoaderState(LoaderState.error);
        debugPrint(error.toString());
      });
    } else {
      getproducts = null;
      updateproductdataLoaderState(LoaderState.networkError);
    }
  }

  Future<void> getmonthwisegraphs({int? branchid}) async {
    updateproductdataLoaderState(LoaderState.loading);
    final network = await Helpers.isInternetAvailable();
    if (network) {
      await services.getmonthwisegraph(branchid: branchid).fold(
        (left) {
          getmonthwisegraph = null;
          Helpers.showToast("${left.message}");
          updateproductdataLoaderState(LoaderState.error);
        },
        (right) {
          if (right.status == 200) {
            getmonthwisegraph = right;
            updateproductdataLoaderState(LoaderState.loaded);
          } else if (right.status == 500) {
            getmonthwisegraph = null;
            sharedPrefs.clearall();
            navigatorKey.currentState?.pushReplacement(MaterialPageRoute(
              builder: (context) => const FinalSlider(),
            ));
            if (showToastFlag == false) {
              // Helpers.showToast("${right.message}");
              showToastFlag = true;
              Helpers.showToast("Please sign in");
            }
            updateproductdataLoaderState(LoaderState.error);
          } else {
            getmonthwisegraph = null;
            // Helpers.showToast("${right.message}");
            updateproductdataLoaderState(LoaderState.error);
          }
          notifyListeners();
        },
      ).catchError((error) {
        getmonthwisegraph = null;
        updateproductdataLoaderState(LoaderState.error);
        debugPrint(error.toString());
      });
    } else {
      getmonthwisegraph = null;
      updateproductdataLoaderState(LoaderState.networkError);
    }
  }

  Future<void> gettransaction(
      {String? startdate, String? endate, int? branchid}) async {
    updatepurchasereportdataLoaderState(LoaderState.loading);
    final network = await Helpers.isInternetAvailable();
    if (network) {
      await services
          .gettransaction(
        branchid: branchid,
        startdate: startdate,
        enddate: endate,
      )
          .fold(
        (left) {
          gettransactiondata = null;
          Helpers.showToast("${left.message}");
          updatepurchasereportdataLoaderState(LoaderState.error);
        },
        (right) {
          if (right.status == 200) {
            gettransactiondata = right;

            updatepurchasereportdataLoaderState(LoaderState.loaded);
          } else if (right.status == 500) {
            gettransactiondata = null;
            sharedPrefs.clearall();
            navigatorKey.currentState?.pushReplacement(MaterialPageRoute(
              builder: (context) => const FinalSlider(),
            ));
            if (showToastFlag == false) {
              // Helpers.showToast("${right.message}");
              showToastFlag = true;
              Helpers.showToast("Please sign in");
            }
            updatepurchasereportdataLoaderState(LoaderState.error);
          } else {
            gettransactiondata = null;
            // Helpers.showToast("${right.message}");
            updatepurchasereportdataLoaderState(LoaderState.error);
          }
          notifyListeners();
        },
      ).catchError((error) {
        gettransactiondata = null;
        updatepurchasereportdataLoaderState(LoaderState.error);
        debugPrint(error.toString());
      });
    } else {
      gettransactiondata = null;
      updatepurchasereportdataLoaderState(LoaderState.networkError);
    }
  }
}
