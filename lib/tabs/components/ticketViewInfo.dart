import 'package:doremi/app_properties.dart';
import 'package:flutter/material.dart';
import 'package:ticket_pass_package/ticket_pass.dart';

class TicketViewInfo extends StatelessWidget {
  final String nama;
  final String waktu;
  final String tanggal;
  final int harga;

  const TicketViewInfo(
      {Key key, this.nama, this.waktu, this.tanggal, this.harga})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
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
                                      waktu,
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
                                      nama,
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
                                    tanggal,
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
                                    harga.toString(),
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
}
