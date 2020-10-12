// import 'package:firebase_auth_demo_flutter/app/chart/datum_legend_with_measures.dart';
// import 'package:firebase_auth_demo_flutter/app/chart/horizontal_bar_label_custom.dart';
// import 'package:firebase_auth_demo_flutter/constants/strings.dart';
import 'package:auto_route/auto_route.dart';
import 'package:doremi/app_properties.dart';
import 'package:doremi/settings/HexColor.dart';
import 'package:doremi/tabs/musisi/chart/datum_legend_with_measures.dart';
import 'package:doremi/tabs/musisi/chart/horizontal_bar_label_custom.dart';
import 'package:doremi/tabs/musisi/chart/vertical_bar_label.dart';
import 'package:flutter/material.dart';

class VisualisasiPage extends StatelessWidget {
  const VisualisasiPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            child: Image.asset('assets/images/doremistudio.png'),
          )),
      body: ListView(
        children: <Widget>[
          // SizedBox(
          //   // height: (715),
          //   height: 600,
          //   child: PageView(
          //     controller: controllers,
          //     children: <Widget>[
          //       Kartu1(
          //         diagram: DatumLegendWithMeasures.withSampleData(),
          //         tulisan: 'Pie Chart Data PMKS',
          //       ),

          //     ],
          //   ),
          // ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 20.0),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                'Dashboard Konsermu',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Container(
              color: darkBlack,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Total Konser: 2",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Divider(),
                    Text(
                      "Total Pendapatan: Rp. 54.132.333,-",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 320,
            child: Kartu1(
              diagram: DatumLegendWithMeasures.withSampleData(),
              tulisan: 'Data Penjualan Tiket',
            ),
          ),

          SizedBox(
            height: 320,
            child: Kartu1(
              diagram: VerticalBarLabelChart.withSampleData(),
              tulisan: 'Rating Konser Terakhir',
            ),
          ),
          SizedBox(
            height: (10),
          ),

          // Container(
          //   height: 120.0,
          //   child: SmoothPageIndicator(
          //     controller: controllers,
          //     count: 2,
          //     effect: ExpandingDotsEffect(
          //         dotHeight: (24),
          //         dotWidth: (24),
          //         radius: 8.0,
          //         expansionFactor: 3,
          //         dotColor: Colors.grey,
          //         activeDotColor: Colors.indigo),
          //   ),
          // ),
          // KartuGraf(
          //   widget: DatumLegendWithMeasures.withRandomData(),
          // ),
          // KartuGraf(
          //   widget: HorizontalBarLabelCustomChart.withRandomData(),
          // ),
          // KartuGraf(
          //   widget: VerticalBarLabelChart.withRandomData(),
          // ),
          // KartuGraf(
          //   widget: TimeSeriesBar.withRandomData(),
          // ),
        ],
      ),
    );
  }
}

class Kartu1 extends StatelessWidget {
  Kartu1({Key key, @required this.tulisan, @required this.diagram})
      : super(key: key);
  String tulisan;
  Widget diagram;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        color: darkBlack,
        // shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(4)),
        margin: EdgeInsets.symmetric(horizontal: 0, vertical: 12),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    tulisan,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: (21),
              ),
              SizedBox(height: 200.0, child: diagram),
              Expanded(
                child: Container(),
              ),

              // Text(
              //   "Rp. ${loanList[index].InstallmentAmount},-",
              //   style: TextStyle(
              //       // color: Colors.white,
              //       fontSize: (70),
              //       fontWeight: FontWeight.bold),
              // ),
              Expanded(
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
