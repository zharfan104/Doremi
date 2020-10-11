import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:doremi/partials/drawer.dart';
import 'package:doremi/settings/HexColor.dart';

class FilterPage extends StatefulWidget {
  FilterPage({Key key}) : super(key: key);

  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<Widget> _getItems() {
    List listings = new List<Widget>();
    List items = [
      'Party',
      'Business',
      'Sports',
      'Health & Welliness',
      'Culturel',
      'Tour',
      'Fashion',
      'Technology',
      'Charity',
      'Arts & Entertainment'
    ];

    int i = 0;
    for (i = 0; i < 10; i++) {
      listings.add(new Padding(
          padding: EdgeInsets.all(5),
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            onPressed: () async {},
            padding: EdgeInsets.all(15),
            color: Colors.transparent,
            child: Text('${items[i]}',
                style: TextStyle(
                    color: HexColor("ffffff"),
                    fontSize: 14,
                    fontWeight: FontWeight.bold)),
          )));
    }
    return listings;
  }

  List<Widget> _getPlaces() {
    List listings = new List<Widget>();
    List items = ['SA', 'Canada', 'India', 'Russia', 'Germany'];

    int i = 0;
    for (i = 0; i < 5; i++) {
      listings.add(new Padding(
          padding: EdgeInsets.all(5),
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            onPressed: () async {},
            padding: EdgeInsets.all(15),
            color: HexColor("C52127"),
            child: Text('${items[i]}',
                style: TextStyle(
                    color: HexColor("ffffff"),
                    fontSize: 14,
                    fontWeight: FontWeight.bold)),
          )));
    }
    return listings;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 10;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
            leading: Icon(null),
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.white),
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
            backgroundColor: HexColor("C52127")),
        drawer: DrawerCustom(),
        drawerDragStartBehavior: DragStartBehavior.down,
        drawerScrimColor: HexColor("C52127").withOpacity(0.3),
        drawerEdgeDragWidth: 100,
        body: Stack(
          children: <Widget>[
            Container(
              height: height / 2,
              decoration: new BoxDecoration(
                  color: HexColor("C52127"),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(width / 1.5))),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child:
                  ListView(physics: BouncingScrollPhysics(), children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Align(
                        alignment: AlignmentDirectional.center,
                        child: Text(
                          'Filter',
                          style: TextStyle(
                              fontSize: 39,
                              //fontWeight: FontWeight.normal,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    IconButton(
                      color: Colors.white.withOpacity(1),
                      onPressed: () {},
                      icon: Icon(
                        FontAwesomeIcons.filter,
                        size: 25,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Text('Catégories',
                        style: TextStyle(fontSize: 15, color: Colors.white))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Wrap(
                    children: _getItems(),
                    runSpacing: 2.5,
                    spacing: 2,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Text('Places',
                        style: TextStyle(
                          fontSize: 15,
                        ))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Wrap(
                    children: _getPlaces(),
                    runSpacing: 2.5,
                    spacing: 2,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                        width: (MediaQuery.of(context).size.width / 2) - 25,
                        child: OutlineButton(
                          borderSide: BorderSide(
                            color: HexColor("C52127"), //Color of the border
                            style: BorderStyle.solid, //Style of the border
                            width: 2.5, //width of the border
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          //color: HexColor("C52127"),
                          onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                '/home', (Route<dynamic> route) => false);
                          },
                          child: Text(
                            'Apply',
                            style: TextStyle(color: Colors.black),
                          ),
                        )),
                    Container(
                        width: (MediaQuery.of(context).size.width / 2) - 25,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(34),
                          ),
                          //color: HexColor("C52127"),
                          onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                '/home', (Route<dynamic> route) => false);
                          },
                          child: Text(
                            'Skip',
                            style: TextStyle(color: Colors.black),
                          ),
                        ))
                  ],
                )
              ]),
            )
          ],
        ));
  }
}
