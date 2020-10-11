import 'package:flutter/material.dart';
import 'package:doremi/settings/HexColor.dart';
import 'package:doremi/view/login.dart';

class NewPasswordPage extends StatefulWidget {
  NewPasswordPage({Key key}) : super(key: key);

  _NewPasswordPageState createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
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
                  'New',
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
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 16.0),
                child: Builder(
                    builder: (context) => Form(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Enter New Password',
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Enter a new password';
                                  }
                                },
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Confirm Passsword',
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Enter a confirmation password';
                                    }
                                  }),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    top: 20, left: 50, right: 50),
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
                              SizedBox(
                                height: 15,
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
                              ))
                            ]))))
          ],
        ));
  }
}
