import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp/pages/get_started_page.dart';
import 'package:groceryapp/pages/login_page.dart';
import 'package:groceryapp/pages/splash_page.dart';
import 'package:groceryapp/utils/theme.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
      ),
      initialRoute: '$SplashPage',
      routes: {
        '$SplashPage': (_) => const SplashPage(),
        '$GetStartedPage': (_) => const GetStartedPage(),
        '$LoginPage': (_) => const LoginPage(),
      },
    );
  }
}
