import 'package:flutter/material.dart';
import 'package:doremi/settings/HexColor.dart';
import 'package:doremi/view/login.dart';
import 'package:doremi/view/resetpasswordpin.dart';

class ResetPasswordPage extends StatefulWidget {
  ResetPasswordPage({Key key}) : super(key: key);

  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _formKey = GlobalKey();
  final _user = Map();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: HexColor("FFF2F2"),
          iconTheme: IconThemeData(color: HexColor("C52127")),
        ),
        body: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(left: 20, right: 20),
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  'Reset',
                  style: TextStyle(
                      fontSize: 39,
                      fontWeight: FontWeight.bold,
                      color: HexColor("C52127")),
                ),
              ),
            ),
            Container(
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  'Password',
                  style: TextStyle(
                      fontSize: 39,
                      fontWeight: FontWeight.bold,
                      color: HexColor("C52127")),
                ),
              ),
            ),
            SizedBox(height: 5),
            Container(
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  "Select which contact details should we use to reset your password",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: HexColor("676767")),
                ),
              ),
            ),
            Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 16.0),
                child: Builder(
                    builder: (context) => Form(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                              GestureDetector(
                                child: Container(
                                    padding: EdgeInsets.only(left: 50),
                                    color: HexColor("FFF2F2"),
                                    height: 112,
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Icon(
                                          Icons.phone_android,
                                          size: 50,
                                          color: HexColor("C52127"),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              'Via SMS',
                                              style: TextStyle(
                                                  color: HexColor("C52127")),
                                            ),
                                            Text(
                                              '08 ** ** 91',
                                              style: TextStyle(
                                                  color: HexColor("676767")),
                                            ),
                                          ],
                                        )
                                      ],
                                    )),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ResetPasswordPinPage()));
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                child: Container(
                                  padding: EdgeInsets.only(left: 50),
                                  color: HexColor("FFF2F2"),
                                  height: 112,
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(
                                        Icons.email,
                                        size: 50,
                                        color: HexColor("C52127"),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            'Via Email',
                                            style: TextStyle(
                                                color: HexColor("C52127")),
                                          ),
                                          Text(
                                            '******joel@gmail.com',
                                            style: TextStyle(
                                                color: HexColor("676767")),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ResetPasswordPinPage()));
                                },
                              ),
                            ]))))
          ],
        ));
  }
}
