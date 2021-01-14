import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widget_demo/custom_painter/bar_chart.dart';

class ChartPage extends StatefulWidget {
  @override
  _ChartPageState createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  List<double> datalist = [];
  List<String> xList = [];
  @override
  void initState() {
    super.initState();
    datalist = [0.366, 0.4, 0.1, 0.2, 0.5, 0.91];
    xList = ['GBPJPY', 'EFSWA', 'DFEFA', 'TRTFRF', 'ERFRF', 'EFSWA'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("自定义绘制柱状图"),
      ),
      body: Center(
        child: ColumnChart(
          data: datalist,
          xAxis: xList,
        ),
      ),
    );
  }
}
