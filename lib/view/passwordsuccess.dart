import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:doremi/settings/HexColor.dart';
import 'package:doremi/view/login.dart';
import 'package:pinput/pin_put/pin_put.dart';

class PasswordSuccessPage extends StatefulWidget {
  PasswordSuccessPage({Key key}) : super(key: key);

  _PasswordSuccessPageState createState() => _PasswordSuccessPageState();
}

class _PasswordSuccessPageState extends State<PasswordSuccessPage> {
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
        body: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Container(
                child: Align(
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    'Password Reset',
                    style: TextStyle(
                        fontSize: 39,
                        fontWeight: FontWeight.bold,
                        color: HexColor("C52127")),
                  ),
                ),
              ),
              Container(
                  child: Align(
                alignment: AlignmentDirectional.center,
                child: Text(
                  'Successfully',
                  style: TextStyle(
                      fontSize: 39,
                      fontWeight: FontWeight.bold,
                      color: HexColor("C52127")),
                ),
              )),
              SizedBox(height: 20),
              Container(
                child: Align(
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    "You have successfully reset your password. Please use new password to login.",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: HexColor("676767")),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(top: 20, left: 60, right: 60),
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(34),
                  ),
                  onPressed: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  padding: EdgeInsets.all(15),
                  color: HexColor("C52127"),
                  child: Text('Login', style: TextStyle(color: Colors.white)),
                ),
              )
            ],
          ),
        ));
  }
}
