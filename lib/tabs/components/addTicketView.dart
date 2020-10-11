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

class AddTicketView extends StatelessWidget {
  final Color bgcolor;
  final Konser konser;
  AddTicketView({this.bgcolor, this.konser});
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
            Center(
              child: Icon(Icons.plus_one),
            )
          ]).show(context);
    }

    return Bounce(
      duration: Duration(milliseconds: 110),
      onPressed: () {
        ExtendedNavigator.of(context).push(Routes.addEvent);
      },
      child: Center(
          child: TicketPass(
              alignment: Alignment.center,
              separatorHeight: 2.0,
              color: darkAqua,
              curve: Curves.easeOut,
              titleColor: Colors.blue,
              titleHeight: 0,
              width: 280,
              height: 50,
              shadowColor: Colors.blue.withOpacity(0.5),
              elevation: 3,
              child: Container(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                          icon: Icon(Icons.add),
                          color: Colors.white,
                          onPressed: () {
                            ExtendedNavigator.of(context).push(Routes.addEvent);
                          }),
                      Text(
                        "Tambah Event",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ))),
    );
  }
}
