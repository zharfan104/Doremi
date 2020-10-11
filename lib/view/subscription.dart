import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:doremi/partials/drawer.dart';
import 'package:doremi/settings/HexColor.dart';
import 'package:easy_dialog/easy_dialog.dart';

class SubscriptionPage extends StatefulWidget {
  SubscriptionPage({Key key}) : super(key: key);

  _SubscriptionPageState createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
        leading: Icon(null),
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
                      'Subscription',
                      style: TextStyle(
                          fontSize: 39,
                          fontFamily: "BwNistaGeometricDEMO",
                          fontWeight: FontWeight.w900,
                          color: HexColor("ffffff")),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      'Details',
                      style: TextStyle(
                          fontSize: 39,
                          fontWeight: FontWeight.bold,
                          color: HexColor("ffffff")),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Column(children: <Widget>[
                  Container(
                      padding: EdgeInsets.all(10),
                      child: Column(children: <Widget>[
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 1,
                          child: Container(
                            padding: EdgeInsets.all(0),
                            width: MediaQuery.of(context).size.width - 20,
                            height: 140,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            right: BorderSide(
                                                width: 1.0,
                                                color: Colors.red
                                                    .withOpacity(0.6)))),
                                    height: 100,
                                    width: (MediaQuery.of(context).size.width /
                                            3) -
                                        20,
                                    padding: EdgeInsets.only(right: 5),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          child: RaisedButton(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(34),
                                            ),
                                            onPressed: () async {
                                              Navigator.of(context)
                                                  .pushNamedAndRemoveUntil(
                                                      '/home',
                                                      (Route<dynamic> route) =>
                                                          false);
                                            },
                                            padding: EdgeInsets.all(0),
                                            color: HexColor("C52127"),
                                            child: Text('Standart',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10)),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          child: Text('\$150',
                                              style: TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Container(
                                          child: Text('per Month',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 10)),
                                        )
                                      ],
                                    )),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                          width: ((MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      3) *
                                                  2) -
                                              100,
                                          child: Text(
                                            'Features',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w800,
                                              color: HexColor("C52127"),
                                            ),
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          width: ((MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      3) *
                                                  2) -
                                              100,
                                          child: Text(
                                            '* Reserve 2 tickets at a time',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w800,
                                              color: Colors.grey,
                                            ),
                                          )),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Container(
                                          width: ((MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      3) *
                                                  2) -
                                              100,
                                          child: Text(
                                            '* Reserve 2 tickets at a time',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w800,
                                              color: Colors.grey,
                                            ),
                                          )),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Container(
                                          width: ((MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      3) *
                                                  2) -
                                              100,
                                          child: Text(
                                            '* Reserve 2 tickets at a time',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w800,
                                              color: Colors.grey,
                                            ),
                                          )),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Container(
                                          width: ((MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      3) *
                                                  2) -
                                              100,
                                          child: Text(
                                            '* Reserve 2 tickets at a time',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w800,
                                              color: Colors.grey,
                                            ),
                                          )),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Card(
                          color: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 1,
                          child: Container(
                            padding: EdgeInsets.all(0),
                            width: MediaQuery.of(context).size.width - 20,
                            height: 140,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            right: BorderSide(
                                                width: 1.0,
                                                color: Colors.white))),
                                    height: 100,
                                    width: (MediaQuery.of(context).size.width /
                                            3) -
                                        20,
                                    padding: EdgeInsets.only(right: 5),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          child: RaisedButton(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(34),
                                            ),
                                            onPressed: () async {
                                              Navigator.of(context)
                                                  .pushNamedAndRemoveUntil(
                                                      '/home',
                                                      (Route<dynamic> route) =>
                                                          false);
                                            },
                                            padding: EdgeInsets.all(0),
                                            color: HexColor("C52127"),
                                            child: Text('Plus',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10)),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          child: Text('\$250',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Container(
                                          child: Text('per Month',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 10)),
                                        )
                                      ],
                                    )),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                          width: ((MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      3) *
                                                  2) -
                                              100,
                                          child: Text(
                                            'Features',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w800,
                                              color: HexColor("ffffff"),
                                            ),
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          width: ((MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      3) *
                                                  2) -
                                              100,
                                          child: Text(
                                            '* Reserve 2 tickets at a time',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w800,
                                              color: Colors.grey,
                                            ),
                                          )),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Container(
                                          width: ((MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      3) *
                                                  2) -
                                              100,
                                          child: Text(
                                            '* Reserve 2 tickets at a time',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w800,
                                              color: Colors.grey,
                                            ),
                                          )),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Container(
                                          width: ((MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      3) *
                                                  2) -
                                              100,
                                          child: Text(
                                            '* Reserve 2 tickets at a time',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w800,
                                              color: Colors.grey,
                                            ),
                                          )),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Container(
                                          width: ((MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      3) *
                                                  2) -
                                              100,
                                          child: Text(
                                            '* Reserve 2 tickets at a time',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w800,
                                              color: Colors.grey,
                                            ),
                                          )),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Card(
                          color: HexColor("FFBB00"),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 1,
                          child: Container(
                            padding: EdgeInsets.all(0),
                            width: MediaQuery.of(context).size.width - 20,
                            height: 140,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            right: BorderSide(
                                                width: 1.0,
                                                color: Colors.white))),
                                    height: 100,
                                    width: (MediaQuery.of(context).size.width /
                                            3) -
                                        20,
                                    padding: EdgeInsets.only(right: 5),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          child: RaisedButton(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(34),
                                            ),
                                            onPressed: () async {
                                              Navigator.of(context)
                                                  .pushNamedAndRemoveUntil(
                                                      '/home',
                                                      (Route<dynamic> route) =>
                                                          false);
                                            },
                                            padding: EdgeInsets.all(0),
                                            color: HexColor("C52127"),
                                            child: Text('Premium',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10)),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          child: Text('\$250',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Container(
                                          child: Text('per Month',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 10)),
                                        )
                                      ],
                                    )),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                          width: ((MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      3) *
                                                  2) -
                                              100,
                                          child: Text(
                                            'Features',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w800,
                                              color: HexColor("ffffff"),
                                            ),
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          width: ((MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      3) *
                                                  2) -
                                              100,
                                          child: Text(
                                            '* Reserve 2 tickets at a time',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w800,
                                              color: Colors.black,
                                            ),
                                          )),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Container(
                                          width: ((MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      3) *
                                                  2) -
                                              100,
                                          child: Text(
                                            '* Reserve 2 tickets at a time',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w800,
                                              color: Colors.black,
                                            ),
                                          )),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Container(
                                          width: ((MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      3) *
                                                  2) -
                                              100,
                                          child: Text(
                                            '* Reserve 2 tickets at a time',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w800,
                                              color: Colors.black,
                                            ),
                                          )),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Container(
                                          width: ((MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      3) *
                                                  2) -
                                              100,
                                          child: Text(
                                            '* Reserve 2 tickets at a time',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w800,
                                              color: Colors.black,
                                            ),
                                          )),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ]))
                ])
              ])
        ],
      ),
    );
  }

  openPopup() {
    EasyDialog(
        closeButton: false,
        cornerRadius: 10.0,
        fogOpacity: 0.1,
        width: 280,
        height: 475,
        // title: Text(
        //   "Custom Easy Dialog Title",
        //   style: TextStyle(fontWeight: FontWeight.bold),
        //   textScaleFactor: 1.2,
        // ),
        descriptionPadding: EdgeInsets.all(0),
        // description: Text(
        //   "This is a custom dialog. Easy Dialog helps you easily create basic or custom dialogs.",
        //   textScaleFactor: 1.1,
        //   textAlign: TextAlign.center,
        // ),
        // topImage: NetworkImage(
        //     "https://raw.githubusercontent.com/ricardonior29/easy_dialog/master/example/assets/topImageblack.png"),
        contentPadding:
            EdgeInsets.only(top: 1.0), // Needed for the button design
        contentList: [
          Container(
              child: Column(
            children: <Widget>[
              Image.asset(
                "assets/images/qr.png",
                height: 100,
              ),
              SizedBox(
                height: 20,
              ),
              Text('QR Code : 987654323')
            ],
          )),
          Divider(
            height: 10,
            thickness: 2,
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            padding: EdgeInsets.all(5),
            height: 80,
            width: 260,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 250 / 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Icon(
                                FontAwesomeIcons.mapMarkerAlt,
                                color: HexColor("C52127"),
                                size: 12,
                              ))),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 260 / 2,
                        child: Text('Marina Bay ST, New York, USA',
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 250 / 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Icon(
                                FontAwesomeIcons.calendarAlt,
                                color: HexColor("C52127"),
                                size: 12,
                              ))),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 260 / 2 - 10,
                        child: Text('15 September 2019 8:00 onwards',
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 6,
            thickness: 2,
          ),
          Container(
              padding: const EdgeInsets.only(left: 15, top: 5),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("About".toUpperCase(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12.0)))),
          Container(
              padding: const EdgeInsets.all(5),
              child: Text(
                  "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi iusto eius ex dolorum velit! Atque, veniam! Atque incidunt",
                  textAlign: TextAlign.justify,
                  style:
                      TextStyle(fontWeight: FontWeight.w300, fontSize: 12.0))),
          Container(
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: FlatButton(
                    onPressed: () {},
                    child: Text(
                      'See more',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.blue,
                      ),
                    ),
                  ))),
          Container(
              padding: const EdgeInsets.only(left: 15, top: 5),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Organizer".toUpperCase(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12.0)))),
          Container(
            height: 42,
            padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                    width: (260 / 4) - 10,
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Image.asset("assets/images/logo.png"))),
                Container(
                  width: (260 / 4) * 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text("Propos Park allinace",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12.0))
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                    width: 280 / 2,
                    child: FlatButton(
                        color: Colors.black,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "\$45",
                          style: TextStyle(fontSize: 11.5, color: Colors.white),
                        ))),
                Container(
                    width: 280 / 2,
                    child: FlatButton(
                        color: Colors.red,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Buy Ticket",
                          textScaleFactor: 1.3,
                          style: TextStyle(fontSize: 11.5, color: Colors.white),
                        )))
              ],
            ),
          ),
        ]).show(context);
  }
}
