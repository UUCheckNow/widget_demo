import 'dart:math';
import 'dart:math' as math;
import 'package:flutter/material.dart';

class DonutCahrt extends StatefulWidget {
  final List<Map<String, dynamic>> datas;

  const DonutCahrt({this.datas});

  @override
  _DonutCahrtState createState() => _DonutCahrtState();
}

class _DonutCahrtState extends State<DonutCahrt> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return CustomPaint(
            size: constraints.biggest,
            painter: DonutChartPainter(widget.datas),
          );
        },
      ),
    );
  }
}

class DonutChartPainter extends CustomPainter {
  final List<Map<String, dynamic>> datas;

  DonutChartPainter(this.datas);

  double initStartAngle = 0;

  void _drawItemArc(
    double value,
    total,
    double startAngle,
    Canvas canvas,
    Size size,
  ) {
    Paint paint = Paint()
      ..color = randomColor()
      ..strokeWidth = 20.0
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true;
    Rect rect = Rect.fromCircle(
      radius: 78.0,
      center: Offset(size.width / 2, size.height / 2),
    );

    double sweepAngle = -value / total * pi * 2;
    initStartAngle = startAngle + sweepAngle;

    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
  }

  void _drawText(String name, PiePart part, Canvas canvas, Size size) {
    final sw = size.width;
    final sh = size.height;
    final double radius = math.min(sw, sh) / 2;
    final double fontSize = 12.0;
    final String legend = name;
    // 根据每部分的起始弧度加上自身弧度值的一半得到每部分的中间弧度值
    final radians = part.startAngle + part.sweepAngle / 2;
    // 根据三角函数计算中出标识文字的 x 和 y 位置，需要加上宽和高的一半适配 Canvas 的坐标
    double x = math.cos(radians) * (radius + 52) + sw / 2 - fontSize;
    double y = math.sin(radians) * (radius + 22) + sh / 2;
    final offset = Offset(x, y);
    Offset center = Offset(size.width / 2, size.height / 2);
    // 设置绘制属性
    final paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..isAntiAlias = true;

    // 创建一个 Path 对象，并规定它的路线
    final Path path = Path();

    final innerRadiusStartPoint = new Point<double>(
        radians * cos(part.startAngle) + center.dx,
        radians * sin(part.startAngle) + center.dy);

    final innerRadiusEndPoint = new Point<double>(
        radians * cos(part.sweepAngle) + center.dx,
        radians * sin(part.sweepAngle) + center.dy);

    final radiusStartPoint = new Point<double>(
        radius * cos(part.startAngle) + center.dx,
        radius * sin(part.startAngle) + center.dy);

    final radiusEndPoint = new Point<double>(
        radius * cos(part.sweepAngle) + center.dx,
        radius * sin(part.sweepAngle) + center.dy);

    path.moveTo(innerRadiusStartPoint.x, innerRadiusStartPoint.y);

    path.lineTo(radiusStartPoint.x, radiusStartPoint.y);
    /*平行线*/
    path.lineTo(
        radiusStartPoint.x >= 90
            ? radiusStartPoint.x + 50
            : radiusStartPoint.x - 50,
        radiusStartPoint.y);
    // path.moveTo(innerRadiusEndPoint.x, innerRadiusEndPoint.y);
    // path.lineTo(radiusEndPoint.x, radiusEndPoint.y);

    // ..moveTo(offset.dx + 10, offset.dy)
    // ..lineTo(center.dx, center.dy);
    // 绘制路径
    canvas.drawPath(path, paint);

    // 使用 TextPainter 绘制文字标识
    TextPainter(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: legend,
        style: TextStyle(
          fontSize: fontSize,
          color: Colors.black,
        ),
      ),
      textDirection: TextDirection.ltr,
    )
      ..layout(
        minWidth: 0,
        maxWidth: size.width,
      )
      ..paint(canvas, offset);
  }

  void _drawParts(
      double data, double total, PiePart parts, Canvas canvas, Size size) {
    final sw = size.width;
    final sh = size.height;
    final double fontSize = 12.0;
    final double radius = math.min(sw, sh) / 2;
    final Offset center = Offset(sw / 2, sh / 2);

    // 设置绘制属性
    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..isAntiAlias = true;

    Path path = Path();
    // 计算每部分占比
    final String percent = (data * 100 / total * 100).toStringAsFixed(1);
    final double radians = parts.startAngle + parts.sweepAngle / 2;
    // 使用三角函数计算文字位置
    double x = math.cos(radians) * radius + sw / 2 - fontSize;
    double y = math.sin(radians) * radius + sh / 2 - fontSize;
    final Offset offset = Offset(x, y);

    path.moveTo(offset.dx, offset.dy);

    path.lineTo(
      offset.dx >= 90 ? offset.dx + 50 : offset.dx - 50,
      offset.dy,
    );
    print(offset.dy);
    // path.lineTo(
    //     radiusStartPoint.x >= 90
    //         ? radiusStartPoint.x + 50
    //         : radiusStartPoint.x - 50,
    //     radiusStartPoint.y);
    // print(radiusStartPoint.x);
    // path.moveTo(innerRadiusEndPoint.x, innerRadiusEndPoint.y);
    // path.lineTo(radiusEndPoint.x, radiusEndPoint.y);

    // ..moveTo(offset.dx + 10, offset.dy)
    // ..lineTo(center.dx, center.dy);
    // 绘制路径
    canvas.drawPath(path, paint);
    // ..lineTo(center.dx, center.dy);
    // // 使用 TextPainter 绘制文字标识
    // TextPainter(
    //   textAlign: TextAlign.start,
    //   text: TextSpan(
    //     text: percent,
    //     style: TextStyle(
    //       fontSize: fontSize,
    //       color: Colors.blue,
    //       fontWeight: FontWeight.bold,
    //     ),
    //   ),
    //   textDirection: TextDirection.ltr,
    // )
    //   ..layout(
    //     minWidth: 0,
    //     maxWidth: size.width,
    //   )
    //   ..paint(canvas, offset);
  }

  void _drawTextsss(
      double data, double total, PiePart part, Canvas canvas, Size size) {
    final sw = size.width;
    final sh = size.height;
    // final double fontSize = 12.0;
    final double radius = math.min(sw, sh) / 2;
    final Offset center = Offset(sw / 2, sh / 2);
    // 计算每部分占比
    final String percent = (data * 100 / total * 100).toStringAsFixed(1);
    final double radians = part.startAngle + part.sweepAngle / 2;
    // 使用三角函数计算文字位置
    double x = math.cos(radians) * radius + sw / 2;
    double y = math.sin(radians) * radius + sh / 2;
    final Offset offset = Offset(x, y);
    // 设置绘制属性
    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..isAntiAlias = true;

    Path path = Path();
    path.moveTo(center.dx + radius - 15, y);

    path.lineTo(center.dx + radius, y + radians);

    // 绘制路径
    canvas.drawPath(path, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    var total = 0.0;
    // 设置一个起始变量
    double startAngle = 0;
    List<PiePart> _parts = <PiePart>[];
    Offset center = Offset(size.width / 2, size.height / 2);
    datas.forEach((item) {
      total += item['value'];
    });

    datas.asMap().forEach((i, item) {
      final angle = (item['value'] / total) * -math.pi * 2;
      PiePart peiPart;
      if (i > 0) {
        // 下一个数据的起始弧度值等于之前的弧度值相加
        double lastSweepAngle = _parts[i - 1].sweepAngle;
        startAngle += lastSweepAngle;
        peiPart = PiePart(startAngle, angle, randomColor());
      } else {
        // 第一个数据的起始弧度为 0.0
        peiPart = PiePart(startAngle, angle, randomColor());
      }
      // 添加到数组中
      _parts.add(peiPart);
      // _parts[i].sweepAngle = angle;
      _drawItemArc(item['value'], total, initStartAngle, canvas, size);
      _drawText(item['name'], _parts[i], canvas, size);
      // _drawTextsss(datas[i]['value'], total, _parts[i], canvas, size);
      // _drawParts(item['value'], total, _parts[i], canvas, size);
    });
  }

  @override
  bool shouldRepaint(DonutChartPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(DonutChartPainter oldDelegate) => false;
}

Color randomColor() {
  return Color.fromARGB(100, Random().nextInt(256) + 0,
      Random().nextInt(256) + 0, Random().nextInt(256) + 0);
}

class PiePart {
  double sweepAngle;
  final Color color;
  final double startAngle;

  PiePart(
    this.startAngle,
    this.sweepAngle,
    this.color,
  );
}
