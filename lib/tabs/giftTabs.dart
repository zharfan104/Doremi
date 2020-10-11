import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intro_views_flutter/UI/pager_indicator.dart';
import 'package:doremi/settings/HexColor.dart';
import 'package:doremi/view/detailsevent.dart';
import 'package:line_icons/line_icons.dart';

class GiftTabsPage extends StatefulWidget {
  GiftTabsPage({Key key}) : super(key: key);

  _GiftTabsPageState createState() => _GiftTabsPageState();
}

class _GiftTabsPageState extends State<GiftTabsPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
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
                      'Gift',
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
                      'Cards',
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
                Container(
                  decoration: BoxDecoration(
                    borderRadius: new BorderRadius.all(Radius.circular(50)),
                  ),
                  height: 350,
                  child: new Swiper(
                    onTap: (index) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsEvent()));
                    },
                    loop: true,
                    itemWidth: 255,
                    viewportFraction: 0.84,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: Colors.transparent.withOpacity(0.1),
                                offset: Offset(10, 0),
                                blurRadius: 100)
                          ]),
                          padding: EdgeInsets.all(0),
                          child: Column(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  new Image.asset(
                                    "assets/images/photo$index.png",
                                    fit: BoxFit.cover,
                                    width: 255,
                                    height: 200,
                                  ),
                                ],
                              ),
                              Container(
                                  padding: EdgeInsets.all(5),
                                  height: 150,
                                  width: 255,
                                  color: Colors.white,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                          width: width,
                                          child: Center(
                                              child: Text(
                                            " \$15 Gift Card",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey),
                                          ))),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                          width: width,
                                          child: Center(
                                              child: Text(
                                            " Valid till 21 Janjuary",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey),
                                          ))),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          width: width,
                                          child: Center(
                                            child: new Image.asset(
                                                "assets/images/codebarre.png",
                                                fit: BoxFit.cover),
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          width: width,
                                          child: Center(
                                            child: Text('View Details',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.blue,
                                                )),
                                          ))
                                    ],
                                  ))
                            ],
                          ));
                    },
                    itemCount: 3,
                    pagination: new SwiperPagination(
                        margin: EdgeInsets.only(top: 10),
                        builder: SwiperPagination.dots),
                    // control: new SwiperControl(),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  color: HexColor("F3F3F3"),
                  width: width - 20,
                  height: 60,
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: width / 8,
                        height: width / 8,
                        color: HexColor("C52127"),
                        child: Center(
                          child: Icon(
                            LineIcons.gift,
                            color: Colors.white.withOpacity(0.5),
                            size: 40,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Container(
                          width: (width / 8) * 5,
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text('My Gift Cards',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold)),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                  child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text('3 Cards',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black26,
                                        fontWeight: FontWeight.bold)),
                              ))
                            ],
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ])
        ],
      ),
    );
  }
}
