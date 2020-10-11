import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:doremi/app_properties.dart';
import 'package:flutter/material.dart';
import 'package:doremi/router.gr.dart';
import 'package:doremi/settings/HexColor.dart';
import 'package:doremi/view/home.dart';
import 'package:doremi/view/intro.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  bool isIntroDone = false;
  SharedPreferences prefs;
  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs.getBool(Teks.isIntroDone) != null) {
      isIntroDone = prefs.getBool(Teks.isIntroDone);
      print(isIntroDone);
    }
    goTo();
  }

  @override
  dispose() {
    super.dispose();
  }

  goTo() async {
    print(isIntroDone);
    Timer(Duration(seconds: 2), () {
      if (isIntroDone) {
        ExtendedNavigator.of(context).push(
          Routes.homePage(isLogin: true),
        );
      } else {
        {
          ExtendedNavigator.of(context).push(
            Routes.introPage,
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor("FFF2F2"),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/logo app.png'),
        ),
      ),
    );
  }
}
