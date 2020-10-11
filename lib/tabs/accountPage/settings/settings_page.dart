import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:doremi/router.gr.dart';
import 'package:doremi/tabs/accountPage/custom_background.dart';
import 'package:doremi/tabs/accountPage/settings/change_country.dart';
import 'package:doremi/tabs/accountPage/settings/change_password_page.dart';
import 'package:doremi/tabs/accountPage/settings/legal_about_page.dart';
import 'package:doremi/tabs/accountPage/settings/change_account.dart';
import 'package:doremi/tabs/accountPage/settings/notifications_settings_page.dart';
import 'package:doremi/app_properties.dart';
import 'package:doremi/tabs/auth/welcome_back_page.dart';

import 'change_language_page.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MainBackground(),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          brightness: Brightness.light,
          backgroundColor: Colors.transparent,
          title: Text(
            'Pengaturan',
            style: TextStyle(color: darkGrey),
          ),
          elevation: 0,
        ),
        body: SafeArea(
          bottom: true,
          child: LayoutBuilder(
              builder: (builder, constraints) => SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints(minHeight: constraints.maxHeight),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 24.0, left: 24.0, right: 24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                'General',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                            ),
                            ListTile(
                              title: Text('Akun'),
                              leading: Icon(Icons.account_circle),
                              onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (_) => changeAccountPage())),
                            ),
                            ListTile(
                              title: Text('Notifikasi'),
                              leading:
                                  Image.asset('assets/icons/notifications.png'),
                              onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          NotificationSettingsPage())),
                            ),
                            ListTile(
                              title: Text('Untuk Musisi'),
                              leading: Image.asset(
                                'assets/images/musician.png',
                                fit: BoxFit.scaleDown,
                                width: 25,
                                height: 25,
                              ),
                              onTap: () {
                                ExtendedNavigator.of(context).push(
                                  Routes.inginKonser,
                                );
                              },
                            ),
                            ListTile(
                              title: Text('Tentang Kami'),
                              leading: Image.asset('assets/icons/about_us.png'),
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
        ),
      ),
    );
  }
}
