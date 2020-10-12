import 'package:auto_route/auto_route.dart';
import 'package:doremi/app_properties.dart';
import 'package:doremi/settings/HexColor.dart';
import 'package:doremi/utils/listPernyataanUser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class QNEViewers extends StatefulWidget {
  @override
  _QNEViewersState createState() => _QNEViewersState();
}

class _QNEViewersState extends State<QNEViewers> {
  bool isLoading = true;

  void isLoadingFunc() {
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoadingFunc();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: darkBlack,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: darkBlack,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              ExtendedNavigator.of(context).pop();
            },
          ),
          title: Padding(
            padding: const EdgeInsets.only(
                bottom: 60.0, top: 60.0, right: 80.0, left: 40.0),
            child: Image.asset('assets/images/app logo.png'),
          )),
      body: Stack(
        children: <Widget>[
          Container(
            height: height / 2,
            decoration: new BoxDecoration(
                color: darkBlack,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(width / 1.5))),
          ),
          ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(left: 10, right: 10),
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      'Pertanyaan Terpilih',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: HexColor("ffffff")),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  //child: disii nanti,
                ),
                (!isLoading)
                    ? Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                border: Border.all(color: darkAqua, width: 5),
                                borderRadius: BorderRadius.circular(8)),
                            child: Text(
                              '${listPertanyaan[0]["pertanyaan"]}\n(${listPertanyaan[0]["nama"]})',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: HexColor("ffffff")),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                border: Border.all(color: darkAqua, width: 5),
                                borderRadius: BorderRadius.circular(8)),
                            child: Text(
                              '${listPertanyaan[1]["pertanyaan"]}\n(${listPertanyaan[1]["nama"]})',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: HexColor("ffffff")),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                border: Border.all(color: darkAqua, width: 5),
                                borderRadius: BorderRadius.circular(8)),
                            child: Text(
                              '${listPertanyaan[2]["pertanyaan"]}\n(${listPertanyaan[2]["nama"]})',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: HexColor("ffffff")),
                            ),
                          ),
                        ],
                      )
                    : SpinKitChasingDots(
                        color: darkAqua,
                        size: 50.0,
                      ),
              ])
        ],
      ),
    );
  }
}
