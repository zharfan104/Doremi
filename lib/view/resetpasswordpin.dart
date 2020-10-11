import 'package:flutter/material.dart';
import 'package:doremi/settings/HexColor.dart';
import 'package:doremi/view/login.dart';
import 'package:doremi/view/passwordsuccess.dart';
import 'package:pinput/pin_put/pin_put.dart';

class ResetPasswordPinPage extends StatefulWidget {
  ResetPasswordPinPage({Key key}) : super(key: key);

  _ResetPasswordPinPageState createState() => _ResetPasswordPinPageState();
}

class _ResetPasswordPinPageState extends State<ResetPasswordPinPage> {
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
                  'Enter 4 digits',
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
                'recover pin',
                style: TextStyle(
                    fontSize: 39,
                    fontWeight: FontWeight.bold,
                    color: HexColor("C52127")),
              ),
            )),
            SizedBox(height: 5),
            Container(
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  "Recovery code is sent to your via sms no. *********455. Please enter code here",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: HexColor("676767")),
                ),
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: Builder(
                builder: (context) => Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: PinPut(
                      spaceBetween: 5,
                      fieldsCount: 4,
                      onSubmit: (String pin) => _success(pin, context),
                    ),
                  ),
                ),
              ),
            ),
            Center(
                child: FlatButton(
              onPressed: () {
                Navigator.of(context).pop(context);
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                    color: HexColor("676767"),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            )),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(left: 50, right: 50),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(34),
                ),
                onPressed: () async {
                  //await _login({'email' : emailController.text, 'password' : passwordController.text});
                },
                padding: EdgeInsets.all(15),
                color: HexColor("C52127"),
                child: Text('Reset Password',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ));
  }

  void _success(String pin, BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => PasswordSuccessPage()));
    // final snackBar = SnackBar(
    //   duration: Duration(seconds: 5),
    //   content: Container(
    //       height: 80.0,
    //       child: Center(
    //         child: Text(
    //           'Pin Submitted. Value: $pin',
    //           style: TextStyle(fontSize: 25.0),
    //         ),
    //       )),
    //   backgroundColor: Colors.greenAccent,
    // );
    // Scaffold.of(context).showSnackBar(snackBar);
  }
}
