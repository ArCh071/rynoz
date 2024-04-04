import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:rynoz/repositories/auth_service.dart';
import 'package:rynoz/repositories/network/base_service.dart';
import 'package:rynoz/repositories/network/service.dart';
import 'package:rynoz/repositories/sharedprefs/shared_prefs.dart';
import 'package:rynoz/view/splash.dart';

void setUp() async {
  GetIt.instance.registerSingleton<BaseServices>(Services());
  GetIt.instance.registerSingleton<SharedPrefs>(SharedPrefs());
  GetIt.instance.registerFactory<AuthServices>(() => AuthServices());
  // GetIt.instance.registerFactory<HomeServices>(() => HomeServices());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await ScreenUtil.ensureScreenSize();
  setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (context, child) {
          return MaterialApp(
            title: 'Rynoz',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
          );
        });
  }
}
