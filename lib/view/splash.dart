import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rynoz/helper/appconfig.dart';
import 'package:rynoz/repositories/sharedprefs/shared_prefs.dart';
import 'package:rynoz/view/home.dart';
import 'package:rynoz/view/initialslider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final sharedPrefs = GetIt.instance<SharedPrefs>();

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () async {
      String? token = await sharedPrefs.getAuthToken();
      if (token != null) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ));
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const InitialSliderScreen(),
        ));
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
