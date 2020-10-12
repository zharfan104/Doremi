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

/// Bar chart with example of a legend with customized position, justification,
/// desired max rows, and padding. These options are shown as an example of how
/// to use the customizations, they do not necessary have to be used together in
/// this way. Choosing [end] as the position does not require the justification
/// to also be [endDrawArea].
// EXCLUDE_FROM_GALLERY_DOCS_START
import 'dart:math';
// EXCLUDE_FROM_GALLERY_DOCS_END
import 'package:doremi/tabs/musisi/data_dummy.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart';

/// Example that shows how to build a datum legend that shows measure values.
///
/// Also shows the option to provide a custom measure formatter.
class DatumLegendWithMeasures extends StatelessWidget {
  DatumLegendWithMeasures(this.seriesList, {this.animate});

  factory DatumLegendWithMeasures.withSampleData() {
    return DatumLegendWithMeasures(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  // EXCLUDE_FROM_GALLERY_DOCS_START
  // This section is excluded from being copied to the gallery.
  // It is used for creating random series data to demonstrate animation in
  // the example app only.
  factory DatumLegendWithMeasures.withRandomData() {
    return DatumLegendWithMeasures(_createRandomData());
  }
  final List<Series> seriesList;
  final bool animate;

  /// Create random data.
  static List<Series<LinearSales, int>> _createRandomData() {
    final random = Random();

    final data = [
      LinearSales('2014', random.nextInt(100)),
      LinearSales('2015', random.nextInt(100)),
      LinearSales('2016', random.nextInt(100)),
      LinearSales('2017', random.nextInt(100)),
    ];

    return [
      Series<LinearSales, int>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.sales,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
        seriesColor: ColorUtil.fromDartColor(Colors.white),
        displayName: "asd",
        colorFn: (_, index) {
          return MaterialPalette.green.makeShades(4)[index];
        },
      )
    ];
  }
  // EXCLUDE_FROM_GALLERY_DOCS_END

  @override
  Widget build(BuildContext context) {
    return PieChart<String>(
      seriesList,

      animate: animate,
      // Add the legend behavior to the chart to turn on legends.
      // This example shows how to optionally show measure and provide a custom
      // formatter.
      behaviors: [
        // EXCLUDE_FROM_GALLERY_DOCS_START
        // This section is excluded from being copied to the gallery.
        // This is added in order to generate the image for the gallery to show
        // an initial selection so that measure values are shown in the gallery.
        InitialSelection(
          selectedDataConfig: [
            SeriesDatumConfig<String>('Sales', '0'),
          ],
        ),
        // EXCLUDE_FROM_GALLERY_DOCS_END
        DatumLegend(
          // Positions for "start" and "end" will be left and right respectively
          // for widgets with a build context that has directionality ltr.
          // For rtl, "start" and "end" will be right and left respectively.
          // Since this example has directionality of ltr, the legend is
          // positioned on the right side of the chart.
          position: BehaviorPosition.end,
          // For a legend that is positioned on the left or right of the chart,
          // setting the justification for [endDrawArea] is aligned to the
          // bottom of the chart draw area.
          outsideJustification: OutsideJustification.endDrawArea,
          // By default, if the position of the chart is on the left or right of
          // the chart, [horizontalFirst] is set to false. This means that the
          // legend entries will grow as new rows first instead of a new column.
          horizontalFirst: false,
          // By setting this value to 2, the legend entries will grow up to two
          // rows before adding a new column.
          desiredMaxRows: 2,
          // This defines the padding around each legend entry.
          cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
          // Render the legend entry text with custom styles.
          entryTextStyle: TextStyleSpec(
              color: MaterialPalette.gray.shadeDefault, fontSize: 14),
        ),
      ],
    );
  }

  /// Create series list with one series
  static List<Series<LinearSales, String>> _createSampleData() {
    List<LinearSales> data = List<LinearSales>();
    final random = Random();

    for (int i = 0; i < singkatanPMKS.length; i++) {
      data.add(LinearSales(singkatanPMKS[i], random.nextInt(100)));
    }

    return [
      Series<LinearSales, String>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.display,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
        seriesColor: ColorUtil.fromDartColor(Colors.white),
        colorFn: (_, index) {
          return MaterialPalette.teal.makeShades(4)[index];
        },
        insideLabelStyleAccessorFn: (LinearSales sales, _) {
          final color = MaterialPalette.white;
          return new TextStyleSpec(color: color);
        },
        outsideLabelStyleAccessorFn: (LinearSales sales, _) {
          final color = MaterialPalette.cyan.shadeDefault;
          return new TextStyleSpec(color: color);
        },

        // colorFn: (_, __) => MaterialPalette.lime.shadeDefault,
      )
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  LinearSales(this.display, this.sales);

  final String display;
  final int sales;
}
