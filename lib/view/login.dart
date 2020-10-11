import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:doremi/app_properties.dart';
import 'package:doremi/settings/HexColor.dart';

import 'package:doremi/view/register.dart';
import 'package:doremi/view/resetpassword.dart';

import '../router.gr.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey();
  final _user = Map();
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: darkBlack,
        appBar: AppBar(
            elevation: 0,
            leading: Icon(null),
            // iconTheme: IconThemeData(color: HexColor("C52127")),
            backgroundColor: darkBlack),
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
                  child: Image.asset('assets/images/app logo.png')),
            ),
            SizedBox(height: 20),
            Container(
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  "Ingin menonton konser tiket? Mulai buat akunmu sekarang!",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
              ),
            ),
            Column(
              children: <Widget>[
                FormBuilder(
                  key: _fbKey,
                  initialValue: {
                    'date': DateTime.now(),
                    'accept_terms': false,
                  },
                  autovalidate: true,
                  child: Column(
                    children: <Widget>[
                      FormBuilderTextField(
                        style: TextStyle(color: lightAqua),
                        attribute: "Email",
                        decoration: InputDecoration(labelText: "Email",),
                        cursorColor: Colors.white,
                        
                        validators: [
                          FormBuilderValidators.required(),
                        ],
                      ),
                      FormBuilderTextField(
                        style: TextStyle(color: lightAqua),
                        attribute: "Password",
                        decoration: InputDecoration(labelText: "Password"),
                        obscureText: true,
                        maxLines: 1,
                        validators: [
                          FormBuilderValidators.required(),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(top: 20, left: 50, right: 50),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(34),
                          ),
                          onPressed: () async {
                            if (_fbKey.currentState.saveAndValidate()) {
                              print(_fbKey.currentState.value);
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  '/home', (Route<dynamic> route) => false);
                            }
                          },
                          padding: EdgeInsets.all(15),
                          color: darkGrey,
                          child: Text('Login',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
              ],
            ),
            Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                child: Builder(
                    builder: (context) => Form(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                              SizedBox(
                                height: 15,
                              ),
                              RaisedButton(
                                color: HexColor("5574D8"),
                                padding: EdgeInsets.all(5),
                                onPressed: () {},
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Image.asset("assets/images/fbk.png"),
                                    Text(
                                      'connect with Facebook',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                              RaisedButton(
                                color: Colors.white,
                                padding: EdgeInsets.all(5),
                                onPressed: () {},
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Image.asset(
                                        "assets/images/google_logo.png"),
                                    Text('connect with Google')
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Center(
                                  child: FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RegisterPage()));
                                },
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                              Container(
                                child: Center(
                                    child: FlatButton(
                                  child: Text(
                                    'Skip',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10),
                                  ),
                                  onPressed: () {
                                    ExtendedNavigator.of(context).push(
                                        Routes.homePage(isLogin: 'false'));
                                  },
                                )),
                              ),
                            ]))))
          ],
        ));
  }
}
