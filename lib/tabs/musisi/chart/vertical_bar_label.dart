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

/// Vertical bar chart with bar label renderer example.
// EXCLUDE_FROM_GALLERY_DOCS_START
import 'dart:math';
// EXCLUDE_FROM_GALLERY_DOCS_END
import 'package:charts_flutter/flutter.dart';
import 'package:doremi/app_properties.dart';
import 'package:flutter/material.dart';

class VerticalBarLabelChart extends StatelessWidget {
  VerticalBarLabelChart(this.seriesList, {this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory VerticalBarLabelChart.withSampleData() {
    return VerticalBarLabelChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  // EXCLUDE_FROM_GALLERY_DOCS_START
  // This section is excluded from being copied to the gallery.
  // It is used for creating random series data to demonstrate animation in
  // the example app only.
  factory VerticalBarLabelChart.withRandomData() {
    return VerticalBarLabelChart(_createRandomData());
  }

  /// Create random data.
  static List<Series<OrdinalSales, String>> _createRandomData() {
    final random = Random();

    final data = [
      OrdinalSales('5', random.nextInt(100)),
      OrdinalSales('3', random.nextInt(100)),
      OrdinalSales('2', random.nextInt(100)),
      OrdinalSales('1', random.nextInt(100)),
    ];

    return [
      Series<OrdinalSales, String>(
          id: 'Sales',
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          data: data,
          seriesColor: ColorUtil.fromDartColor(Colors.white),

          // Set a label accessor to control the text of the bar label.
          labelAccessorFn: (OrdinalSales sales, _) =>
              '${sales.sales.toString()}')
    ];
  }

  final List<Series> seriesList;
  final bool animate;
  // EXCLUDE_FROM_GALLERY_DOCS_END

  // [BarLabelDecorator] will automatically position the label
  // inside the bar if the label will fit. If the label will not fit,
  // it will draw outside of the bar.
  // Labels can always display inside or outside using [LabelPosition].
  //
  // Text style for inside / outside can be controlled independently by setting
  // [insideLabelStyleSpec] and [outsideLabelStyleSpec].
  @override
  Widget build(BuildContext context) {
    return BarChart(
      seriesList,
      animate: animate,
      // Set a bar label decorator.
      // Example configuring different styles for inside/outside:
      //       barRendererDecorator:  BarLabelDecorator(
      //          insideLabelStyleSpec:  TextStyleSpec(...),
      //          outsideLabelStyleSpec:  TextStyleSpec(...)),
      barRendererDecorator: BarLabelDecorator<String>(),
      domainAxis: OrdinalAxisSpec(),
    );
  }

  /// Create one series with sample hard coded data.
  static List<Series<OrdinalSales, String>> _createSampleData() {
    final data = [
      OrdinalSales('1', 5),
      OrdinalSales('2', 25),
      OrdinalSales('3', 100),
      OrdinalSales('4', 75),
      OrdinalSales('5', 175),
    ];

    return [
      Series<OrdinalSales, String>(
          id: 'Sales',
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          data: data,
          seriesColor: ColorUtil.fromDartColor(Colors.white),
          colorFn: (_, index) {
            return MaterialPalette.gray.makeShades(4)[index];
          },
          insideLabelStyleAccessorFn: (OrdinalSales sales, _) {
            final color = (sales.year == '2014')
                ? MaterialPalette.cyan.shadeDefault
                : MaterialPalette.teal.shadeDefault;
            return new TextStyleSpec(color: color);
          },
          outsideLabelStyleAccessorFn: (OrdinalSales sales, _) {
            final color = (sales.year == '2014')
                ? MaterialPalette.teal.shadeDefault
                : MaterialPalette.teal.shadeDefault;
            return new TextStyleSpec(color: color);
          },
          // Set a label accessor to control the text of the bar label.
          labelAccessorFn: (OrdinalSales sales, _) =>
              '${sales.sales.toString()}')
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  OrdinalSales(this.year, this.sales);

  final String year;
  final int sales;
}
