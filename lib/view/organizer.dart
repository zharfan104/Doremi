import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:doremi/partials/drawer.dart';
import 'package:doremi/settings/HexColor.dart';
import 'package:easy_dialog/easy_dialog.dart';
import 'package:line_icons/line_icons.dart';

import 'detailsevent.dart';

class OrganizerDetailsPage extends StatefulWidget {
  OrganizerDetailsPage({Key key}) : super(key: key);

  _OrganizerDetailsPageState createState() => _OrganizerDetailsPageState();
}

class _OrganizerDetailsPageState extends State<OrganizerDetailsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  double w;
  double h;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 40;
    double height = MediaQuery.of(context).size.height;
    w = width;
    h = height;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: HexColor("C52127"),
        elevation: 0,
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 0),
              child: IconButton(
                onPressed: () => _scaffoldKey.currentState.openDrawer(),
                icon: Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.white,
                ),
              ))
        ],
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      drawer: DrawerCustom(),
      body: Stack(
        children: <Widget>[
          Container(
            height: height / 2,
            decoration: new BoxDecoration(
                color: HexColor("C52127"),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(width / 1.5))),
          ),
          ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(left: 10, right: 10),
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      'Organizer',
                      style: TextStyle(
                          fontSize: 39,
                          fontFamily: "BwNistaGeometricDEMO",
                          fontWeight: FontWeight.w900,
                          color: HexColor("ffffff")),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    child: Column(children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  new BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                            ),
                            height: 100,
                            width: width / 4,
                            child: Image.asset("assets/images/logo1.png"),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            height: 100,
                            width: (width / 4) * 2.3,
                            child: Center(
                                child: Text('Long Meadow',
                                    style: TextStyle(
                                        fontSize: 36,
                                        fontFamily: "BwNistaGeometricDEMO",
                                        fontWeight: FontWeight.w900,
                                        color: HexColor("ffffff")))),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                new BorderRadius.all(Radius.circular(10)),
                            color: Colors.black,
                          ),
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                  width: (width / 2) - 46,
                                  height: 80,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Text('1',
                                          style: TextStyle(
                                              fontSize: 40,
                                              fontFamily:
                                                  "BwNistaGeometricDEMO",
                                              fontWeight: FontWeight.w900,
                                              color: Colors.grey)),
                                      Text('Upcoming',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontFamily:
                                                  "BwNistaGeometricDEMO",
                                              fontWeight: FontWeight.w900,
                                              color: Colors.grey))
                                    ],
                                  )),
                              Container(
                                  width: (width / 2) - 40,
                                  height: 100,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Text('38',
                                          style: TextStyle(
                                              fontSize: 40,
                                              fontFamily:
                                                  "BwNistaGeometricDEMO",
                                              fontWeight: FontWeight.w900,
                                              color: Colors.grey)),
                                      Text('Past',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontFamily:
                                                  "BwNistaGeometricDEMO",
                                              color: Colors.grey))
                                    ],
                                  ))
                            ],
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                new BorderRadius.all(Radius.circular(10)),
                            color: Colors.transparent,
                          ),
                          padding: EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Image.asset("assets/images/sociaux.png")
                            ],
                          ))
                    ])),
                Divider(
                  thickness: 2,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Text('UpComing',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87, //HexColor("676767")
                      )),
                ),
                Column(
                  children: _getEvents(),
                )
              ])
        ],
      ),
    );
  }

  List<Widget> _getEvents() {
    List listings = new List<Widget>();
    List items = ['photo1.png', 'photo2.png', 'photo0.png'];

    int i = 0;
    for (i = 0; i < 3; i++) {
      listings.add(Container(
          child: Row(
        children: <Widget>[
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DetailsEvent()));
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 2,
                child: Container(
                  padding: EdgeInsets.all(0),
                  width: w,
                  height: 120,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                          width: w / 3,
                          height: 120,
                          child: Image.asset(
                            "assets/images/${items[i]}",
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width / 3,
                          )),
                      Container(
                        width: ((w / 3) * 2) - 80,
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                height: 40,
                                child: Text('New York Party Week',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                        color: HexColor("252525")))),
                            Container(
                                height: 30,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Icon(
                                          FontAwesomeIcons.mapMarkerAlt,
                                          size: 15,
                                        )),
                                    Text('New York, USA',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: HexColor("252525"))),
                                  ],
                                )),
                            Container(
                                height: 20,
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("4:00pm, Tuesday",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: HexColor("252525"))))),
                            Container(
                                height: 20,
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('by Knokdown...')))
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border(
                                left: BorderSide(
                                    width: 1.0,
                                    color: Colors.grey.withOpacity(0.6)))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(LineIcons.heart_o),
                            SizedBox(height: 16),
                            Text('02',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                    color: HexColor("C52127"))),
                            Text('Nov',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: HexColor("252525"))),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ))
        ],
      )));
    }
    return listings;
  }
}
