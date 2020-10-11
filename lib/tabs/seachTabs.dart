import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:doremi/settings/HexColor.dart';
import 'package:doremi/view/detailsevent.dart';
import 'package:doremi/view/organizer.dart';

class SeachTabsPage extends StatefulWidget {
  SeachTabsPage({Key key}) : super(key: key);

  _SeachTabsPageState createState() => _SeachTabsPageState();
}

class _SeachTabsPageState extends State<SeachTabsPage> {
  double h;
  double w;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 30;
    double height = MediaQuery.of(context).size.height;

    w = width;
    h = height;

    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          height: height / 2,
          decoration: new BoxDecoration(
              color: HexColor("C52127"),
              borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(width / 1.5))),
        ),
        ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                style: new TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    focusColor: Colors.white.withOpacity(0.4),
                    hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                    contentPadding: EdgeInsets.only(
                        left: 20, top: 12, right: 12, bottom: 12),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 0.0,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    hintText: "Tape here",
                    fillColor: Colors.white.withOpacity(0.4),
                    filled: true,
                    suffixIcon: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        color: Colors.white,
                        child: Icon(
                          Icons.search,
                          color: HexColor("C52127"),
                          size: 30,
                        ),
                        onPressed: () {
                          debugPrint('222');
                        })),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                        child: Padding(
                            padding: EdgeInsets.all(5),
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              onPressed: () async {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            OrganizerDetailsPage()));
                              },
                              padding: EdgeInsets.all(15),
                              color: Colors.transparent,
                              child: Text('Organizers',
                                  style: TextStyle(
                                      color: HexColor("ffffff"),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                            ))),
                    Expanded(
                        child: Padding(
                            padding: EdgeInsets.all(5),
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              onPressed: () async {},
                              padding: EdgeInsets.all(15),
                              color: HexColor("ffffff"),
                              child: Text('Events',
                                  style: TextStyle(
                                      color: HexColor("C52127"),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                            ))),
                    Expanded(
                        child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: new BorderRadius.all(
                                        Radius.circular(20.0)),
                                    color: Colors.white),
                                child: Center(
                                    child: DropdownButton(
                                  style: TextStyle(
                                      backgroundColor: Colors.white,
                                      color: HexColor("C52127")),
                                  iconSize: 30,
                                  iconEnabledColor: HexColor("C52127"),
                                  value: _currentType,
                                  items: _dropDownMenuItems,
                                  onChanged: changedDropDownItem,
                                )))))
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                '11 events found',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: _getEvents(),
                    ))
              ],
            )
          ],
        )
      ],
    ));
  }

  List _type = ["Weekend", "Month"];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentType;

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentType = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String t in _type) {
      items.add(new DropdownMenuItem(value: t, child: new Text(t)));
    }
    return items;
  }

  void changedDropDownItem(String selectedCity) {
    setState(() {
      _currentType = selectedCity;
    });
  }

  List<Widget> _getEvents() {
    List listings = new List<Widget>();
    List items = [
      'photo1.png',
      'photo2.png',
      'photo0.png',
      'photo3.png',
      'anthony.png',
      'gonzalo.png',
      'photo1.png',
      'photo2.png',
      'photo3.png',
      'anthony.png'
    ];

    int i = 0;
    for (i = 0; i < 10; i++) {
      listings.add(GestureDetector(
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => DetailsEvent())),
          child: Container(
              child: Row(
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 2,
                child: Container(
                  padding: EdgeInsets.all(0),
                  width: w - 30,
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
                                            fontSize: 12,
                                            color: HexColor("252525"))),
                                  ],
                                )),
                            Container(
                                height: 20,
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("4:00pm, Tuesday",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: HexColor("252525"))))),
                            Container(
                                height: 20,
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('by Knokdown...',
                                        style: TextStyle(
                                          fontSize: 12,
                                        ))))
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
                            Icon(FontAwesomeIcons.heart),
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
              )
            ],
          ))));
    }
    return listings;
  }
}

class OvalRightBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width - 40, 0);
    path.quadraticBezierTo(
        size.width, size.height / 4, size.width, size.height / 2);
    path.quadraticBezierTo(size.width, size.height - (size.height / 4),
        size.width - 40, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
