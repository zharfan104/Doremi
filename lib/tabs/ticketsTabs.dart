import 'package:auto_route/auto_route.dart';
import 'package:doremi/router.gr.dart';
import 'package:doremi/tabs/components/ticketView.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:doremi/app_properties.dart';
import 'package:doremi/settings/HexColor.dart';
import 'package:easy_dialog/easy_dialog.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:ticket_pass_package/ticket_pass.dart';

class TicketTabsPage extends StatefulWidget {
  TicketTabsPage({Key key}) : super(key: key);

  _TicketTabsPageState createState() => _TicketTabsPageState();
}

class _TicketTabsPageState extends State<TicketTabsPage> {
  int jum = 0;
  int itemCount;
  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      jum = prefs.getInt(Teks.jumTiket);
    });
    print(jum);
    if (jum == 0) {
      itemCount = 1;
    } else {
      itemCount = jum;
    }
  }

  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }

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
          Column(children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: GestureDetector(
                  onDoubleTap: () async {
                    if (jum >= 0) {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setInt(Teks.jumTiket, jum - 1);
                      setState(() {
                        jum = prefs.getInt(Teks.jumTiket);
                      });
                    }
                  },
                  child: Text(
                    'Tiketku',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: HexColor("ffffff")),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (ctx, idx) {
                  if (jum == 0) {
                    if (idx == 0) {
                      return Container(
                        height: 400.0,
                        child: Center(
                          child: Image.asset(
                            "assets/images/belumbeli.png",
                            fit: BoxFit.scaleDown,
                            height: 75.0,
                          ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TicketView(
                        index: jum,
                      ),
                    );
                  }
                },
                itemCount: itemCount,
              ),
            ),
          ])
        ],
      ),
    );
  }
}
