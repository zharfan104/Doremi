import 'package:flutter/material.dart';
import 'package:doremi/settings/HexColor.dart';
import 'package:doremi/view/login.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                  'Sign Up',
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
                  "Lets Get Started to see what's events are happening around the World!",
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
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Email or Phone',
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your first name';
                                  }
                                },
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Full Name',
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Enter email address or phone number';
                                    }
                                  }),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Enter email address or phone number';
                                    }
                                  }),
                              Container(
                                padding: EdgeInsets.only(
                                    top: 20, left: 50, right: 50),
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(34),
                                  ),
                                  onPressed: () async {
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil('/filter',
                                            (Route<dynamic> route) => false);
                                  },
                                  padding: EdgeInsets.all(15),
                                  color: HexColor("C52127"),
                                  child: Text('Get Started',
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Center(
                                child: Text('or'),
                              ),
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
                                height: 15,
                              ),
                              Center(
                                  child: FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()));
                                },
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      color: HexColor("C52127"),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ))
                            ]))))
          ],
        ));
  }
}
