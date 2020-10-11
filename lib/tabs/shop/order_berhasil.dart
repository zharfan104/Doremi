import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:doremi/app_properties.dart';
import 'package:doremi/router.gr.dart';

class OrderBerhasil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 100,
            width: 100,
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Image.asset('assets/icons/tiket-2.png'),
            ),
          ),
          Container(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
              child: Text(
                "Pembayaran Berhasil, kamu sudah memiliki tiket.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 60.0,
          ),
          RaisedButton(
            color: darkBlack,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Text(
              'Kembali Ke Menu Utama',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            onPressed: () {
              ExtendedNavigator.of(context).pushAndRemoveUntil(
                  Routes.homePage(isLogin: true), (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
