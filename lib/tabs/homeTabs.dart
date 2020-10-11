import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intro_views_flutter/UI/page_indicator_buttons.dart';
import 'package:intro_views_flutter/UI/pager_indicator.dart';
import 'package:doremi/app_properties.dart';
import 'package:doremi/router.gr.dart';
import 'package:doremi/settings/HexColor.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:doremi/tabs/category/models/category.dart';
import 'package:doremi/view/detailsevent.dart';
import 'package:doremi/view/filter.dart';
import 'package:line_icons/line_icons.dart';

List photojazz = ['jazz1.png', 'jazz2.png', 'jazz3.png'];
List photopop = ['pop1.png', 'pop2.png', 'pop3.png'];
List photodangdut = ['dangdut-1.png', 'dangdut-2.png', 'dangdut-3.png'];
List photoband = [
  'artis-ardhito.png',
  'artis-hindia.png',
  'artis-kunto.png',
  'artis-nadin.png',
  'artis-tulus.png',
];

class HomeTabsPage extends StatefulWidget {
  HomeTabsPage({Key key}) : super(key: key);

  _HomeTabsPageState createState() => _HomeTabsPageState();
}

class _HomeTabsPageState extends State<HomeTabsPage> {
  double w;
  double h;
  List<Category> searchResults;
  List<Category> categories = [
    Category(
      Color(0xffFCE183),
      Color(0xffF68D7F),
      'Popular Event',
      'assets/jeans_5.png',
    ),
    Category(
      Color(0xffF749A2),
      Color(0xffFF7375),
      'Jazz',
      'assets/jeans_5.png',
    ),
    Category(
      Color(0xff00E9DA),
      Color(0xff5189EA),
      'RnB',
      'assets/jeans_5.png',
    ),
    Category(
      Color(0xffAF2D68),
      Color(0xff632376),
      'Funk',
      'assets/jeans_5.png',
    ),
    Category(
      Color(0xff36E892),
      Color(0xff33B2B9),
      'Rock',
      'assets/jeans_5.png',
    ),
    Category(
      Color(0xffF123C4),
      Color(0xff668CEA),
      'Metal',
      'assets/jeans_5.png',
    ),
    Category(
      Color(0xffF123C4),
      Color(0xff668CEA),
      'Pop',
      'assets/jeans_5.png',
    ),
    Category(
      Color(0xffF123C4),
      Color(0xff668CEA),
      'Hiphop',
      'assets/jeans_5.png',
    ),
  ];
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 10;
    double height = MediaQuery.of(context).size.height;

    w = width;
    h = height;

    return Stack(
      children: <Widget>[
        // Container(
        //   height: height/2,
        //   decoration: new BoxDecoration(
        //     color: HexColor("C52127"),
        //     borderRadius: BorderRadius.only(bottomLeft: Radius.circular(width/1.5))
        //   ),
        // ),
        ListView(physics: BouncingScrollPhysics(), children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Container(
              padding: EdgeInsets.only(left: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: lightAqua,
              ),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                    hintStyle: TextStyle(fontWeight: FontWeight.bold),
                    border: InputBorder.none,
                    hintText: 'Cari Konser Terbaru!',
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    )),
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    List<Category> tempList = List<Category>();
                    categories.forEach((category) {
                      if (category.category.toLowerCase().contains(value)) {
                        tempList.add(category);
                      }
                    });
                    setState(() {
                      searchResults.clear();
                      searchResults.addAll(tempList);
                    });
                    return;
                  } else {
                    setState(() {
                      searchResults.clear();
                      searchResults.addAll(categories);
                    });
                  }
                },
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Align(
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    'Popular Now',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: new BorderRadius.all(Radius.circular(50)),
            ),
            height: 400,
            child: new Swiper(
              onTap: (index) {
                ExtendedNavigator.of(context).push(Routes.detailsEvent,
                    arguments: DetailsEventArguments(
                        posterphoto: "assets/poster_konser/${index + 1}.png"));
              },
              layout: SwiperLayout.DEFAULT,
              loop: true,
              autoplay: true,
              itemWidth: 500,
              viewportFraction: 0.8,
              duration: 3000,
              autoplayDelay: 4000,
              itemBuilder: (BuildContext context, int index) {
                return Bounce(
                  duration: Duration(milliseconds: 110),
                  onPressed: () {
                    ExtendedNavigator.of(context).push(Routes.detailsEvent,
                        arguments: DetailsEventArguments(
                            posterphoto:
                                "assets/poster_konser/${index + 1}.png"));
                  },
                  child: Container(
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
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: new Image.asset(
                                  "assets/poster_konser/${index + 1}.png",
                                  fit: BoxFit.cover,
                                  // width: 255,
                                  height: 325,
                                ),
                              ),
                            ],
                          ),
                          Container(
                              padding: EdgeInsets.all(5),
                              height: 60,
                              width: 255,
                              color: Colors.transparent,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                          child: Row(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Icon(
                                              Icons.date_range,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text('Sat, 17 Oct',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white)),
                                        ],
                                      ))
                                    ],
                                  ),
                                  Divider(
                                    height: 10,
                                    color: Colors.black,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                          child: Row(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Icon(
                                              LineIcons.clock_o,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text('20.00',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white)),
                                        ],
                                      ))
                                    ],
                                  )
                                ],
                              ))
                        ],
                      )),
                );
              },
              itemCount: 4,
              // pagination: new SwiperPagination(margin: EdgeInsets.only(top: 2)),
              // control: new SwiperControl(),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Jazz',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, //HexColor("676767")
                )),
          ),
          Container(
            height: 200.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: _getEvents(photojazz),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Featured Musician',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, //HexColor("676767")
                )),
          ),
          Container(
            height: 200.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: _getEvents(photoband),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Dangdut',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, //HexColor("676767")
                )),
          ),
          Container(
            height: 200.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: _getEvents(photodangdut),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Pop',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, //HexColor("676767")
                )),
          ),
          Container(
            height: 200.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: _getEvents(photopop),
            ),
          ),
        ])
      ],
    );
  }

  List<Widget> _getEvents(List itemPhoto) {
    List listings = new List<Widget>();
    int i = 0;
    for (i = 0; i < itemPhoto.length; i++) {
      listings.add(Bounce(
        duration: Duration(milliseconds: 110),
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 200.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: new Image.asset(
                "assets/poster_konser/${itemPhoto[i]}",
                fit: BoxFit.cover,
                // width: 255,
                height: 325,
              ),
            ),
          ),
        ),
      ));
    }
    return listings;
  }
}
