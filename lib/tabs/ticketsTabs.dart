import 'package:auto_route/auto_route.dart';
import 'package:doremi/router.gr.dart';
import 'package:doremi/tabs/components/ticketView.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:doremi/app_properties.dart';
import 'package:doremi/settings/HexColor.dart';
import 'package:easy_dialog/easy_dialog.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ticket_pass_package/ticket_pass.dart';

class TicketTabsPage extends StatefulWidget {
  TicketTabsPage({Key key}) : super(key: key);

  _TicketTabsPageState createState() => _TicketTabsPageState();
}

class _TicketTabsPageState extends State<TicketTabsPage> {
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
                TicketView(),
              ])
        ],
      ),
    );
  }
}
