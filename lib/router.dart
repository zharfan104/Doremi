import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:doremi/tabs/accountPage/payment/payment_page.dart';
import 'package:doremi/tabs/accountPage/settings/settings_page.dart';
import 'package:doremi/tabs/musisi/addEvent.dart';
import 'package:doremi/tabs/musisi/homeMusisi.dart';
import 'package:doremi/tabs/accountPage/settings/change_account.dart';
import 'package:doremi/tabs/accountPage/settings/notifications_settings_page.dart';
import 'package:doremi/tabs/musisi/inginKonser.dart';
import 'package:doremi/tabs/shop/check_out_page.dart';
import 'package:doremi/tabs/shop/order_berhasil.dart';
import 'package:doremi/view/detailsevent.dart';
import 'package:doremi/view/home.dart';
import 'package:doremi/view/intro.dart';
import 'package:doremi/view/login.dart';
import 'package:doremi/view/splash.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: SplashScreenPage, initial: true, name: "InitialRoute"),
    //This route returns result of type [bool]
    CustomRoute<bool>(
        page: LoginPage, transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute<bool>(
        page: IntroPage, transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute<bool>(
        path: "/home/:isLogin?",
        page: HomePage,
        transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute<bool>(
        page: DetailsEvent, transitionsBuilder: TransitionsBuilders.zoomIn),

    CustomRoute<bool>(
        page: PaymentPage, transitionsBuilder: TransitionsBuilders.zoomIn),
    CustomRoute<bool>(
        page: CheckOutPage, transitionsBuilder: TransitionsBuilders.zoomIn),
    CustomRoute<bool>(
        page: OrderBerhasil, transitionsBuilder: TransitionsBuilders.slideLeft),
    CustomRoute<bool>(
        page: HomeMusisi, transitionsBuilder: TransitionsBuilders.slideLeft),
    CustomRoute<bool>(
        page: InginKonser, transitionsBuilder: TransitionsBuilders.slideLeft),
    CustomRoute<bool>(
        page: SettingsPage, transitionsBuilder: TransitionsBuilders.slideLeft),
    CustomRoute<bool>(
        page: NotificationSettingsPage,
        transitionsBuilder: TransitionsBuilders.slideLeft),
    CustomRoute<bool>(
        page: changeAccountPage,
        transitionsBuilder: TransitionsBuilders.slideLeft),
    CustomRoute<bool>(
        page: AddEvent, transitionsBuilder: TransitionsBuilders.fadeIn),
    // MaterialRoute(path: "*", page: HomePage)
  ],
)
class $Router {}
