import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceryapp/models/auth_model.dart';
import 'package:groceryapp/pages/category_page.dart';
import 'package:groceryapp/pages/mainpage/main_page_binding.dart';
import 'package:groceryapp/pages/get_started_page.dart';
import 'package:groceryapp/pages/history_order_page.dart';
import 'package:groceryapp/pages/home/home_page.dart';
import 'package:groceryapp/pages/mainpage/main_page.dart';
import 'package:groceryapp/pages/login_page.dart';
import 'package:groceryapp/pages/profile_account_page.dart';
import 'package:groceryapp/pages/signup_page.dart';
import 'package:groceryapp/pages/splash_page.dart';
import 'package:groceryapp/route/app_page.dart';
import 'package:groceryapp/route/app_route.dart';
import 'package:groceryapp/utils/theme.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => AuthModel(),
        ),
      ],
      child: Consumer<AuthModel>(
        builder: (ctx, auth, _) => GetMaterialApp(
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primaryColor: kPrimaryColor,
          ),
          getPages: AppPage.list,
          initialRoute: AppRoute.dashboard,
          // auth.isAuthentication ? '$MainPage' : '$SplashPage',
          routes: {
            '$SplashPage': (_) => const SplashPage(),
            '$GetStartedPage': (_) => const GetStartedPage(),
            '$LoginPage': (_) => const LoginPage(),
            '$SignupPage': (_) => const SignupPage(),
            '$MainPage': (_) => const MainPage(),
            '$HomePage': (_) => const HomePage(),
            '$CategoryPage': (_) => const CategoryPage(),
            '$HistoryOrderPage': (_) => const HistoryOrderPage(),
            '$ProfileAccountPage': (_) => const ProfileAccountPage(),
          },
        ),
      ),
    );
  }
}
