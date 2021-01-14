import 'package:flutter/material.dart';

import 'donut_chart.dart';

class DonutChartPage extends StatefulWidget {
  @override
  _DonutChartState createState() => _DonutChartState();
}

class _DonutChartState extends State<DonutChartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("自定义绘制环状图"),
      ),
      body: Center(
        child: DonutCahrt(
          datas: [
            {
              "name": '其他',
              "value": 0.109436,
            },
            {
              "name": 'WTI',
              "value": 0.320454,
            },
            {
              "name": 'AUDUSD',
              "value": 0.072175,
            },
            {
              "name": 'GBPUSD',
              "value": 0.071705,
            },
            {
              "name": 'EURUSD',
              "value": 0.06261,
            },
            {
              "name": 'XAUUSD',
              "value": 0.363621,
            },
          ],
        ),
      ),
    );
  }
}
