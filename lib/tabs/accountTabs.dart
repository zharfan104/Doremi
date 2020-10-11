import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:doremi/router.gr.dart';
import 'package:doremi/settings/HexColor.dart';

class AccountTabsPage extends StatefulWidget {
  AccountTabsPage({Key key}) : super(key: key);

  _AccountTabsPageState createState() => _AccountTabsPageState();
}

class _AccountTabsPageState extends State<AccountTabsPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 10;
    double height = MediaQuery.of(context).size.height;
    TextStyle defaultStyle = TextStyle(color: Colors.white, fontSize: 20.0);
    TextStyle linkStyle = TextStyle(color: Colors.blue);
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Column(
          children: <Widget>[
            ListTile(
                title: Text('Account',
                    style: TextStyle(
                        color: HexColor("C52127"),
                        fontSize: 18,
                        fontWeight: FontWeight.bold))),
            ListTile(
                title: Text('Push notification',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold))),
            ListTile(
                title: Text('Profile Setting',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)))
          ],
        ),
        Column(
          children: <Widget>[
            ListTile(
                title: Text('About',
                    style: TextStyle(
                        color: HexColor("C52127"),
                        fontSize: 18,
                        fontWeight: FontWeight.bold))),
            ListTile(
                title: Text('Rate Us',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold))),
            ListTile(
                title: Text('FAQ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold))),
            ListTile(
                title: Text('doremi',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)))
          ],
        ),
        Column(
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width - 50,
                padding: EdgeInsets.all(25),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(34),
                  ),
                  onPressed: () async {
                    ExtendedNavigator.of(context).push(
                      Routes.homePage(isLogin: 'true'),
                    );
                  },
                  padding: EdgeInsets.all(15),
                  color: HexColor("C52127"),
                  child: Text('Logouts', style: TextStyle(color: Colors.white)),
                ))
          ],
        ),
        Column(
          children: <Widget>[
            RichText(
              text: TextSpan(
                style: defaultStyle,
                children: <TextSpan>[
                  TextSpan(text: 'By clicking Sign Up, you agree to our '),
                  TextSpan(
                      text: 'Terms of Service',
                      style: linkStyle,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('Terms of Service"');
                        }),
                  TextSpan(text: ' and that you have read our '),
                  TextSpan(
                      text: 'Privacy Policy',
                      style: linkStyle,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('Privacy Policy"');
                        }),
                ],
              ),
            ),
          ],
        )
      ],
    ));
  }
}
