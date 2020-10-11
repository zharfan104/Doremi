import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:doremi/app_properties.dart';
import 'package:doremi/settings/HexColor.dart';
import 'package:doremi/view/organizer.dart';
import 'package:doremi/view/transaction.dart';
import 'package:doremi/view/transaction_user_input.dart';
import 'package:line_icons/line_icons.dart';
import 'package:scaling_header/scaling_header.dart';
import 'package:ticket_pass_package/ticket_pass.dart';
import 'package:ticketview/ticketview.dart';

class DetailsEvent extends StatefulWidget {
  final String posterphoto;
  static final String path = "lib/src/pages/hotel/details.dart";

  const DetailsEvent({Key key, this.posterphoto}) : super(key: key);

  @override
  _DetailsEventState createState() => _DetailsEventState();
}

class _DetailsEventState extends State<DetailsEvent>
    with TickerProviderStateMixin {
  double h;
  double w;
  final List<Transaction> _transactions = [
    // Transaction(
    //   id: 1,
    //   title: "Demo Transaction 1",
    //   amount: 69.90,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 2,
    //   title: "Demo Transaction 2",
    //   amount: 19.22,
    //   date: DateTime.now(),
    // ),
  ];
  TabController _tabController;
  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    // TODO: implement initState
    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 600;

  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(5.3385615, -3.9585525),
    zoom: 14.4746,
  );
  Widget _getTicketInfoView() {
    return Center(
        child: TicketPass(
            alignment: Alignment.center,
            separatorHeight: 2.0,
            color: ticketColor,
            curve: Curves.easeOut,
            titleColor: Colors.blue,
            titleHeight: 0,
            width: 280,
            height: 180,
            shadowColor: Colors.blue.withOpacity(0.5),
            elevation: 3,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5),
              child: Container(
                height: 140,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Waktu',
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.5)),
                                    ),
                                    Text(
                                      '08.00',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Nama',
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(0.5),
                                      ),
                                    ),
                                    Text(
                                      'Konserku',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Tanggal',
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.5)),
                                  ),
                                  Text(
                                    '4 November 2020',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Harga',
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.5)),
                                  ),
                                  Text(
                                    '\Rp. 50.000,- ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  void addTransactionToList(Transaction t) {
    setState(() {
      _transactions.add(t);
    });
  }

  void startAddTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return Container(
            color: darkAqua,
            child: TransactionUserInput(addTransactionToList),
            height: 1000,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 10;
    double height = MediaQuery.of(context).size.height;

    w = width;
    h = height;

    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      // drawer: DrawerCustom(),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: <Widget>[
              ScalingHeader(
                backgroundColor: darkAqua,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Colors.white,
                  onPressed: () {
                    ExtendedNavigator.of(context).pop();
                  },
                ),
                title: Text(
                  'Judul Konser',
                  style: TextStyle(color: Colors.white),
                ),
                flexibleSpace: Image.asset(
                  widget.posterphoto,
                  fit: BoxFit.cover,
                  color: Colors.black.withOpacity(0.3),
                  colorBlendMode: BlendMode.srcATop,
                ),
                overlapContentBackgroundColor: darkAqua,
                overlapContent: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          print('Tap Bio');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              LineIcons.calendar_o,
                              color: Colors.white,
                            ),
                            SizedBox(width: 8.0),
                            Text(
                              '15 September',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          print('Tap Movies');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              LineIcons.clock_o,
                              color: Colors.white,
                            ),
                            SizedBox(width: 8.0),
                            Text('20.00 WIB',
                                style: TextStyle(color: Colors.white))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        //padding: const EdgeInsets.all(10.0),
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                              child: Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Icon(
                                                    FontAwesomeIcons
                                                        .mapMarkerAlt,
                                                    color: darkBlack,
                                                    size: 12,
                                                  ))),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            child: Text('Live at Doremi Apps',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                CountdownTimer(
                                  endTime: endTime,
                                  textStyle: TextStyle(
                                      fontSize: 40, color: Colors.pink),
                                ),
                                Text('menuju konser')
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Container(
                                padding:
                                    const EdgeInsets.only(left: 15, top: 5),
                                child: Text("Musician".toUpperCase(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.0))),
                            const SizedBox(height: 10.0),
                            Container(
                                padding:
                                    const EdgeInsets.only(left: 15, top: 5),
                                child: Text(
                                    "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi iusto eius ex dolorum velit! Atque, veniam! Atque incidunt laudantium eveniet sint quod harum facere numquam molestias?",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 14.0))),
                            Container(
                              // width: MediaQuery.of(context).size.width / 1,
                              child: TabBar(
                                unselectedLabelColor: darkAqua,
                                labelColor: Colors.black,
                                controller: _tabController,
                                indicatorColor: darkAqua,
                                labelStyle: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    .copyWith(
                                        fontSize: 12.0, color: Colors.white),
                                unselectedLabelStyle: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    .copyWith(
                                        fontSize: 12.0, color: Colors.black),
                                indicatorSize: TabBarIndicatorSize.tab,
                                tabs: [
                                  Tab(
                                    child: Text(
                                      'Ticket Only',
                                    ),
                                  ),
                                  Tab(
                                    child: Text('Ticket & Merch'),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 600.0,
                              child: TabBarView(
                                controller: _tabController,
                                children: [
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Column(
                                        children: [
                                          _getTicketInfoView(),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Column(
                                        children: [
                                          Text(
                                              "Coming Soon, Ticket With Exclusive Merch"),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          _getTicketInfoView(),
                                          Container(
                                            height: 200.0,
                                            child: Image.asset(
                                                'assets/images/kaos.jpg'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              height: 10,
                            ),
                            Divider(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: w,
                padding: EdgeInsets.only(bottom: 10, left: 30, right: 30),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(34),
                  ),
                  onPressed: () async {
                    startAddTransaction(context);
                  },
                  padding: EdgeInsets.all(15),
                  color: darkBlack,
                  child:
                      Text('Beli Tiket', style: TextStyle(color: Colors.white)),
                ),
              ))
        ],
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
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
                elevation: 1,
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
              ))
        ],
      )));
    }
    return listings;
  }
}
