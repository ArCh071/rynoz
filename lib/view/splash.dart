import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:rynoz/repositories/sharedprefs/shared_prefs.dart';
import 'package:rynoz/view/home.dart';
import 'package:rynoz/view/initialslider.dart';
import 'package:rynoz/view_model/home_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final sharedPrefs = GetIt.instance<SharedPrefs>();

  @override
  void initState() {
    final home = context.read<HomeProvider>();
    Future.delayed(const Duration(seconds: 1), () async {
      String? id = await sharedPrefs.getid();
      if (id != null) {
        home.getdata();
        await home.getcategory();
        await home.getcompany();
        home.getpaymentsub();
        home.getpaymentmode();
        await home.getbranch();
        home.getminimumstock();
        home.getexpirystock();
        await home.getmonthwisegraphs(
            branchid: home.branchdata?.data![0].branchId);
        await home.gettransaction(
            startdate:
                "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}",
            endate:
                "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}",
            branchid: home.branchdata?.data![0].branchId);
        await home.getproduct(
            count: 5, categoryid: home.categorydata?.data![0].categoryID);
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const Home1(),
        ));
      } else {
        final prefs = await SharedPreferences.getInstance();
        bool? check = prefs.getBool("check");
        if (check == true) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const FinalSlider(),
          ));
        } else {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const InitialSliderScreen(),
          ));
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            color: Colors.black,
            image: DecorationImage(image: AssetImage('assets/splash.png'))),
      ),
    );
  }
}
