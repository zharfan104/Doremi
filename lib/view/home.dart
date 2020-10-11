import 'package:auto_route/auto_route_annotations.dart';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:doremi/app_properties.dart';
import 'package:doremi/settings/HexColor.dart';
import 'package:doremi/tabs/accountPage/profile_page.dart';
import 'package:doremi/tabs/category/category_list_page.dart';
import 'package:doremi/tabs/homeTabs.dart';
import 'package:doremi/tabs/ticketsTabs.dart';

class HomePage extends StatefulWidget {
  final int index;
  final int isLogin;

  HomePage({
    Key key,
    @PathParam() this.isLogin,
    this.index,
  }) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final List<Map> collections = [
    {"title": "Food joint", "image": "assets/images/city.png"},
    {"title": "Photos", "image": "assets/images/logo.png"},
    {"title": "Travel", "image": "assets/images/city.png"},
    {"title": "Nepal", "image": "assets/images/people.png"},
  ];
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: (widget.index != null) ? widget.index : 0,
      length: 3,
      child: Scaffold(
          backgroundColor: darkBlack,
          key: _scaffoldKey,
          appBar: AppBar(
              centerTitle: true,
              backgroundColor: darkBlack,
              elevation: 0,
              leading: Icon(null),
              title: Padding(
                padding: const EdgeInsets.only(
                    bottom: 60.0, top: 60.0, right: 80.0, left: 40.0),
                child: Image.asset('assets/images/app logo.png'),
              )),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: [
              HomeTabsPage(),
              TicketTabsPage(),
              ProfilePage(),
            ],
          ),
          bottomNavigationBar: Container(
            height: 70.0,
            child: new TabBar(
              controller: _tabController,
              indicator: BoxDecoration(color: darkBlack),
              tabs: [
                Tab(
                  icon: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: _tabController.index == 0
                        ? Image.asset('assets/images/home-active.png')
                        : Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Image.asset('assets/images/home.png'),
                          ),
                  ),
                ),
                Tab(
                  icon: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: _tabController.index == 1
                        ? Image.asset('assets/images/ticket-active.png')
                        : Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Image.asset('assets/images/ticket.png'),
                          ),
                  ),
                ),
                Tab(
                  icon: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: _tabController.index == 2
                        ? Image.asset('assets/images/profile-active.png')
                        : Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Image.asset('assets/images/profile.png'),
                          ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Widget listEvent() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border(
              left:
                  BorderSide(width: 1.0, color: Colors.grey.withOpacity(0.6)))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(FontAwesomeIcons.heart),
          SizedBox(
            height: 16,
          ),
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
    );
  }

  Widget sliderCollection() {
    return Container(
        color: Colors.white,
        height: 200.0,
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: collections.length,
            itemBuilder: (BuildContext context, int index) {
              return new Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return new Image.network(
                    "http://via.placeholder.com/350x150",
                    fit: BoxFit.fill,
                  );
                },
                itemCount: 3,
                pagination: new SwiperPagination(),
                control: new SwiperControl(),
              );
            }));
  }
}
