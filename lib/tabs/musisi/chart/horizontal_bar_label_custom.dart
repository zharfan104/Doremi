// Copyright 2018 the Charts project authors. Please see the AUTHORS file
// for details.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

/// Horizontal bar chart with custom style for each datum in the bar label.
// EXCLUDE_FROM_GALLERY_DOCS_START
import 'dart:math';
// EXCLUDE_FROM_GALLERY_DOCS_END
import 'package:charts_flutter/flutter.dart';
import 'package:doremi/tabs/musisi/data_dummy.dart';
import 'package:flutter/material.dart';

class HorizontalBarLabelCustomChart extends StatelessWidget {
  HorizontalBarLabelCustomChart(this.seriesList, {this.animate});

  factory HorizontalBarLabelCustomChart.withRandomData() {
    return HorizontalBarLabelCustomChart(_createRandomData());
  }

  /// Creates a [BarChart] with sample data and no transition.
  static HorizontalBarLabelCustomChart createWithSampleData() {
    return HorizontalBarLabelCustomChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  // EXCLUDE_FROM_GALLERY_DOCS_START
  // This section is excluded from being copied to the gallery.
  // It is used for creating random series data to demonstrate animation in
  // the example app only.

  /// Create random data.
  static List<Series<OrdinalSales, String>> _createRandomData() {
    final random = Random();

    final data = [
      OrdinalSales('2014', random.nextInt(100)),
      OrdinalSales('2015', random.nextInt(100)),
      OrdinalSales('2016', random.nextInt(100)),
      OrdinalSales('2017', random.nextInt(100)),
    ];

    return [
      Series<OrdinalSales, String>(
        id: 'Sales',
        domainFn: (OrdinalSales sales, _) => sales.display,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
        // Set a label accessor to control the text of the bar label.
        labelAccessorFn: (OrdinalSales sales, _) =>
            '${sales.display}: ${sales.sales.toString()}',
        // insideLabelStyleAccessorFn: (OrdinalSales sales, _) {
        //   final color = (sales.display == '2014')
        //       ? MaterialPalette.red.shadeDefault
        //       : MaterialPalette.yellow.shadeDefault.darker;
        //   return TextStyleSpec(color: color);
        // },
        // outsideLabelStyleAccessorFn: (OrdinalSales sales, _) {
        //   final color = (sales.display == '2014')
        //       ? MaterialPalette.red.shadeDefault
        //       : MaterialPalette.yellow.shadeDefault.darker;
        //   return TextStyleSpec(color: color);
        // },
      ),
    ];
  }

  final List<Series> seriesList;
  final bool animate;
  // EXCLUDE_FROM_GALLERY_DOCS_END

  // The [BarLabelDecorator] has settings to set the text style for all labels
  // for inside the bar and outside the bar. To be able to control each datum's
  // style, set the style accessor functions on the series.
  @override
  Widget build(BuildContext context) {
    return BarChart(
      seriesList,
      animate: animate,
      vertical: false,
      barRendererDecorator: BarLabelDecorator<String>(),
      // Hide domain axis.
      domainAxis: OrdinalAxisSpec(renderSpec: NoneRenderSpec()),
    );
  }

  /// Create one series with sample hard coded data.
  static List<Series<OrdinalSales, String>> _createSampleData() {
    List<OrdinalSales> data = List<OrdinalSales>();
    final random = Random();

    for (int i = 0; i < singkatanPMKS.length; i++) {
      data.add(OrdinalSales(singkatanPMKS[i], random.nextInt(100)));
    }

    return [
      Series<OrdinalSales, String>(
        id: 'Sales',
        domainFn: (OrdinalSales sales, _) => sales.display,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
        // Set a label accessor to control the text of the bar label.
        labelAccessorFn: (OrdinalSales sales, _) =>
            '${sales.display}: ${sales.sales.toString()} Orang',
        // insideLabelStyleAccessorFn: (OrdinalSales sales, _) {
        //   final color = (sales.display == '2014')
        //       ? MaterialPalette.red.shadeDefault
        //       : MaterialPalette.yellow.shadeDefault.darker;
        //   return TextStyleSpec(color: color);
        // },
        // outsideLabelStyleAccessorFn: (OrdinalSales sales, _) {
        //   final color = (sales.display == '2014')
        //       ? MaterialPalette.red.shadeDefault
        //       : MaterialPalette.yellow.shadeDefault.darker;
        //   return TextStyleSpec(color: color);
        // },
      ),
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  OrdinalSales(this.display, this.sales);

  final String display;
  final int sales;
}
