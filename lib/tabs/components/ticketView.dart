import 'package:auto_route/auto_route.dart';
import 'package:doremi/app_properties.dart';
import 'package:doremi/router.gr.dart';
import 'package:doremi/settings/HexColor.dart';
import 'package:doremi/tabs/category/models/konser.dart';
import 'package:easy_dialog/easy_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ticket_pass_package/ticket_pass.dart';

class TicketView extends StatelessWidget {
  final Color bgcolor;
  final Konser konser;
  TicketView({this.bgcolor, this.konser});
  @override
  Widget build(BuildContext context) {
    openPopup() {
      EasyDialog(
          closeButton: true,
          cornerRadius: 10.0,
          title: Text(
            "Detail Tiket",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          fogOpacity: 0.1,
          width: 280,
          height: 300,
          descriptionPadding: EdgeInsets.all(0),
          contentPadding:
              EdgeInsets.only(top: 1.0), // Needed for the button design
          contentList: [
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
                          child: Text('Doremi Apps',
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
                    child: Text("Include Nama Konser".toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12.0)))),
            Container(
                padding: const EdgeInsets.all(5),
                child: Text(
                    "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi iusto eius ex dolorum velit! Atque, veniam! Atque incidunt",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontWeight: FontWeight.w300, fontSize: 12.0))),
            Divider(
              height: 6,
              thickness: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    padding: const EdgeInsets.all(5),
                    child: Text("Rp. 60.000,-",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12.0))),
                Container(
                    padding: const EdgeInsets.all(5),
                    child: Text("via Tokopedia",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12.0))),
              ],
            ),
            Divider(
              height: 6,
              thickness: 2,
            ),
            Container(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                      child: FlatButton(
                          color: Colors.red,
                          onPressed: () {
                            ExtendedNavigator.of(context)
                                .push(Routes.detailsEvent);
                          },
                          child: Text(
                            "Detail Konser",
                            textScaleFactor: 1.3,
                            style:
                                TextStyle(fontSize: 11.5, color: Colors.white),
                          )))
                ],
              ),
            ),
          ]).show(context);
    }

    return Bounce(
      duration: Duration(milliseconds: 110),
      onPressed: () {},
      child: Center(
          child: TicketPass(
              alignment: Alignment.center,
              separatorHeight: 2.0,
              color: darkAqua,
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
                  color: darkAqua,
                  height: 170,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Waktu',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        '08.00',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Nama',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        'Konserku',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
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
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      '4 November 2020',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
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
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      '\Rp. 50.000,- ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    FlatButton(
                                      color: darkBlack,
                                      onPressed: () {
                                        openPopup();
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            LineIcons.music,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 5.0,
                                          ),
                                          Text(
                                            "Detail",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    )
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
              ))),
    );
  }
}
