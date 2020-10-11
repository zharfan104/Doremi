import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:doremi/router.gr.dart';
import 'package:doremi/settings/HexColor.dart';
import 'package:doremi/tabs/accountPage/faq_page.dart';
import 'package:doremi/tabs/accountPage/payment/payment_page.dart';
import 'package:doremi/tabs/accountPage/settings/settings_page.dart';
import 'package:doremi/tabs/accountPage/tracking_page.dart';
import 'package:doremi/tabs/accountPage/wallet/wallet_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:doremi/app_properties.dart';

class MusicianProfilePage extends StatelessWidget {
  TextStyle defaultStyle = TextStyle(color: Colors.white, fontSize: 8.0);
  TextStyle linkStyle = TextStyle(color: Colors.blue);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 8.0, right: 16.0, top: 4),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 8.0),
                child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    'Pengaturan',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: HexColor("ffffff")),
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'Zharfan104',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle:
                    Text('Lihat Profil', style: TextStyle(color: Colors.white)),
                leading: CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        NetworkImage('https://via.placeholder.com/140x100')),
                // trailing: Icon(Icons.chevron_right, color: Colors.white),
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => SettingsPage())),
              ),
              ListTile(
                title: Text(
                  'Pengaturan',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text('Privasi dan pengaturan akun',
                    style: TextStyle(color: Colors.white)),
                leading: Image.asset(
                  'assets/images/setting.png',
                  fit: BoxFit.scaleDown,
                  width: 25,
                  height: 25,
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                  size: 24.0,
                ),
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => SettingsPage())),
              ),
              Divider(),
              ListTile(
                title: Text('FAQ', style: TextStyle(color: Colors.white)),
                subtitle: Text('Questions and Answer',
                    style: TextStyle(color: Colors.white)),
                leading: Image.asset(
                  'assets/images/faq.png',
                  fit: BoxFit.scaleDown,
                  width: 25,
                  height: 25,
                ),
                trailing: Icon(Icons.chevron_right, color: Colors.white),
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => FaqPage())),
              ),
              Divider(),
              ListTile(
                title: Text('Bantuan', style: TextStyle(color: Colors.white)),
                subtitle: Text('Bantuan dan Support',
                    style: TextStyle(color: Colors.white)),
                leading: Image.asset(
                  'assets/images/help.png',
                  fit: BoxFit.scaleDown,
                  width: 25,
                  height: 25,
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                ),
              ),
              Divider(),
              Column(
                children: <Widget>[
                  Container(
                      width: MediaQuery.of(context).size.width - 25,
                      padding: EdgeInsets.all(25),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(34),
                        ),
                        onPressed: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.setBool(Teks.isIntroDone, false);
                          ExtendedNavigator.of(context)
                              .push(Routes.InitialRoute);
                        },
                        padding: EdgeInsets.all(15),
                        color: HexColor("C52127"),
                        child: Text(
                          'Keluar dari Dashboard',
                          style: TextStyle(color: Colors.white),
                        ),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
