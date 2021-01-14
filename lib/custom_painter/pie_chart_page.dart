import 'dart:math';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

Color randomColor() {
  return Color.fromARGB(95, Random().nextInt(256) + 0,
      Random().nextInt(256) + 0, Random().nextInt(256) + 0);
}

class ChartTestPage extends StatelessWidget {
  const ChartTestPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("chart_flutter")),
      body: Column(children: [
        Container(height: 300, child: _simplePie()),
      ]),
    );
  }

  Widget _simplePie() {
    var data = [
      PieSales(0, (0.363621 * 100).toInt(), "XAUUSD",
          charts.ColorUtil.fromDartColor(randomColor())),
      PieSales(1, (0.320454 * 100).toInt(), "WTI",
          charts.ColorUtil.fromDartColor(randomColor())),
      PieSales(2, (0.072175 * 100).toInt(), "AUDUSD",
          charts.ColorUtil.fromDartColor(randomColor())),
      PieSales(3, (0.071705 * 100).toInt(), "GBPUSD",
          charts.ColorUtil.fromDartColor(randomColor())),
      PieSales(4, (0.06261 * 100).toInt(), "EURUSD",
          charts.ColorUtil.fromDartColor(randomColor())),
      PieSales(5, (0.109436 * 100).toInt(), "其他",
          charts.ColorUtil.fromDartColor(randomColor())),
    ];

    var seriesList = [
      charts.Series<PieSales, int>(
        id: 'Sales',
        domainFn: (PieSales sales, _) => sales.year,
        measureFn: (PieSales sales, _) => sales.sales,
        colorFn: (PieSales sales, _) => sales.color,
        data: data,
        labelAccessorFn: (PieSales row, _) => row.name,
      )
    ];

    return charts.PieChart(seriesList,
        animate: true,
        defaultRenderer: new charts.ArcRendererConfig(
            arcWidth: 60,
            arcRendererDecorators: [
              new charts.ArcLabelDecorator(
                  labelPosition: charts.ArcLabelPosition.outside)
            ]));
  }
}

class PieSales {
  final int year;
  final int sales;
  final String name;
  final charts.Color color;

  PieSales(this.year, this.sales, this.name, this.color);
}
