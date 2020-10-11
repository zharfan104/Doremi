import 'package:doremi/tabs/components/addTicketView.dart';
import 'package:doremi/tabs/components/musicianTicketView.dart';
import 'package:doremi/tabs/components/ticketView.dart';
import 'package:flutter/material.dart';
import 'package:doremi/app_properties.dart';
import 'package:doremi/settings/HexColor.dart';

class YourEvent extends StatefulWidget {
  YourEvent({Key key}) : super(key: key);

  _YourEventState createState() => _YourEventState();
}

class _YourEventState extends State<YourEvent> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: darkBlack,
      body: Stack(
        children: <Widget>[
          Container(
            height: height / 2,
            decoration: new BoxDecoration(
                color: darkBlack,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(width / 1.5))),
          ),
          ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(left: 10, right: 10),
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      'Tiketku',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: HexColor("ffffff")),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AddTicketView(),
                ),
                MusicianTicketView(),
              ])
        ],
      ),
    );
  }
}
