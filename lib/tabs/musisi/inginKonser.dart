import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:doremi/app_properties.dart';
import 'package:doremi/router.gr.dart';
import 'package:doremi/tabs/musisi/homeMusisi.dart';

class InginKonser extends StatelessWidget {
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
              child: Image.asset('assets/images/musician.png'),
            ),
          ),
          Container(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
              child: Text(
                "Silahkan E-mail management@doremi.co.id untuk membuat konser di aplikasi Doremi",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
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
              'Lihat Dashboard untuk Musisi',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            onPressed: () {
              print('asdasd');
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeMusisi()));
            },
          ),
          RaisedButton(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Text(
                'Kembali',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: darkBlack),
              ),
              onPressed: () {
                ExtendedNavigator.of(context).pop();
              }),
        ],
      ),
    );
  }
}
