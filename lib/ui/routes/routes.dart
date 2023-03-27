import 'package:flutter/material.dart';
import 'package:store/ui/screens/home/home.dart';
import 'package:store/ui/screens/login/login.dart';
import 'package:store/ui/screens/products/detail/detail.dart';
import 'package:store/ui/screens/products/list/list.dart';
import 'package:store/ui/screens/splash/splash.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String productList = '/products/list';
  static const String productDetail = '/products/detail';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => const SplashScreen(),
    login: (BuildContext context) => const LoginScreen(),
    home: (BuildContext context) => const HomeScreen(),
    productList: (BuildContext context) => const ProductListScreen(),
    productDetail: (BuildContext context) => const ProductDetailScreen(),
  };
}
