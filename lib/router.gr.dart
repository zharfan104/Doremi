// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'tabs/accountPage/payment/payment_page.dart';
import 'tabs/accountPage/settings/change_account.dart';
import 'tabs/accountPage/settings/notifications_settings_page.dart';
import 'tabs/accountPage/settings/settings_page.dart';
import 'tabs/category/models/konser.dart';
import 'tabs/musisi/addEvent.dart';
import 'tabs/musisi/homeMusisi.dart';
import 'tabs/musisi/inginKonser.dart';
import 'tabs/musisi/live_concert/live_concert_page.dart';
import 'tabs/shop/check_out_page.dart';
import 'tabs/shop/order_berhasil.dart';
import 'view/detailsevent.dart';
import 'view/home.dart';
import 'view/intro.dart';
import 'view/login.dart';
import 'view/splash.dart';

class Routes {
  static const String InitialRoute = '/';
  static const String loginPage = '/login-page';
  static const String introPage = '/intro-page';
  static const String _homePage = '/home/:isLogin?';
  static String homePage({dynamic isLogin = ''}) => '/home/$isLogin';
  static const String detailsEvent = '/details-event';
  static const String paymentPage = '/payment-page';
  static const String checkOutPage = '/check-out-page';
  static const String orderBerhasil = '/order-berhasil';
  static const String homeMusisi = '/home-musisi';
  static const String inginKonser = '/ingin-konser';
  static const String settingsPage = '/settings-page';
  static const String notificationSettingsPage = '/notification-settings-page';
  static const String changeAccountPage = '/change-account-page';
  static const String addEvent = '/add-event';
  static const String liveConcertPage = '/live-concert-page';
  static const all = <String>{
    InitialRoute,
    loginPage,
    introPage,
    _homePage,
    detailsEvent,
    paymentPage,
    checkOutPage,
    orderBerhasil,
    homeMusisi,
    inginKonser,
    settingsPage,
    notificationSettingsPage,
    changeAccountPage,
    addEvent,
    liveConcertPage,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.InitialRoute, page: SplashScreenPage),
    RouteDef(Routes.loginPage, page: LoginPage),
    RouteDef(Routes.introPage, page: IntroPage),
    RouteDef(Routes._homePage, page: HomePage),
    RouteDef(Routes.detailsEvent, page: DetailsEvent),
    RouteDef(Routes.paymentPage, page: PaymentPage),
    RouteDef(Routes.checkOutPage, page: CheckOutPage),
    RouteDef(Routes.orderBerhasil, page: OrderBerhasil),
    RouteDef(Routes.homeMusisi, page: HomeMusisi),
    RouteDef(Routes.inginKonser, page: InginKonser),
    RouteDef(Routes.settingsPage, page: SettingsPage),
    RouteDef(Routes.notificationSettingsPage, page: NotificationSettingsPage),
    RouteDef(Routes.changeAccountPage, page: changeAccountPage),
    RouteDef(Routes.addEvent, page: AddEvent),
    RouteDef(Routes.liveConcertPage, page: LiveConcertPage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashScreenPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SplashScreenPage(),
        settings: data,
      );
    },
    LoginPage: (data) {
      final args = data.getArgs<LoginPageArguments>(
        orElse: () => LoginPageArguments(),
      );
      return PageRouteBuilder<bool>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            LoginPage(key: args.key),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideBottom,
      );
    },
    IntroPage: (data) {
      return PageRouteBuilder<bool>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const IntroPage(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    HomePage: (data) {
      final args = data.getArgs<HomePageArguments>(
        orElse: () => HomePageArguments(),
      );
      return PageRouteBuilder<bool>(
        pageBuilder: (context, animation, secondaryAnimation) => HomePage(
          key: args.key,
          isLogin: data.pathParams['isLogin'].intValue,
          index: args.index,
        ),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    DetailsEvent: (data) {
      final args = data.getArgs<DetailsEventArguments>(
        orElse: () => DetailsEventArguments(),
      );
      return PageRouteBuilder<bool>(
        pageBuilder: (context, animation, secondaryAnimation) => DetailsEvent(
          key: args.key,
          konser: args.konser,
        ),
        settings: data,
        transitionsBuilder: TransitionsBuilders.zoomIn,
      );
    },
    PaymentPage: (data) {
      return PageRouteBuilder<bool>(
        pageBuilder: (context, animation, secondaryAnimation) => PaymentPage(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.zoomIn,
      );
    },
    CheckOutPage: (data) {
      return PageRouteBuilder<bool>(
        pageBuilder: (context, animation, secondaryAnimation) => CheckOutPage(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.zoomIn,
      );
    },
    OrderBerhasil: (data) {
      return PageRouteBuilder<bool>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            OrderBerhasil(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeft,
      );
    },
    HomeMusisi: (data) {
      final args = data.getArgs<HomeMusisiArguments>(
        orElse: () => HomeMusisiArguments(),
      );
      return PageRouteBuilder<bool>(
        pageBuilder: (context, animation, secondaryAnimation) => HomeMusisi(
          key: args.key,
          isLogin: data.pathParams['isLogin'].intValue,
          index: args.index,
        ),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeft,
      );
    },
    InginKonser: (data) {
      return PageRouteBuilder<bool>(
        pageBuilder: (context, animation, secondaryAnimation) => InginKonser(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeft,
      );
    },
    SettingsPage: (data) {
      return PageRouteBuilder<bool>(
        pageBuilder: (context, animation, secondaryAnimation) => SettingsPage(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeft,
      );
    },
    NotificationSettingsPage: (data) {
      return PageRouteBuilder<bool>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            NotificationSettingsPage(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeft,
      );
    },
    changeAccountPage: (data) {
      return PageRouteBuilder<bool>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            changeAccountPage(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeft,
      );
    },
    AddEvent: (data) {
      return PageRouteBuilder<bool>(
        pageBuilder: (context, animation, secondaryAnimation) => AddEvent(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    LiveConcertPage: (data) {
      final args = data.getArgs<LiveConcertPageArguments>(
        orElse: () => LiveConcertPageArguments(),
      );
      return PageRouteBuilder<bool>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            LiveConcertPage(
          key: args.key,
          role: args.role,
          namaUsers: args.namaUsers,
        ),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// LoginPage arguments holder class
class LoginPageArguments {
  final Key key;
  LoginPageArguments({this.key});
}

/// HomePage arguments holder class
class HomePageArguments {
  final Key key;
  final int index;
  HomePageArguments({this.key, this.index});
}

/// DetailsEvent arguments holder class
class DetailsEventArguments {
  final Key key;
  final Konser konser;
  DetailsEventArguments({this.key, this.konser});
}

/// HomeMusisi arguments holder class
class HomeMusisiArguments {
  final Key key;
  final int index;
  HomeMusisiArguments({this.key, this.index});
}

/// LiveConcertPage arguments holder class
class LiveConcertPageArguments {
  final Key key;
  final ClientRole role;
  final String namaUsers;
  LiveConcertPageArguments({this.key, this.role, this.namaUsers});
}
