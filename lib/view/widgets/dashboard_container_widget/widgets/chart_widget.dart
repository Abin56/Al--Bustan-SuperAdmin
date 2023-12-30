import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatelessWidget {
  const Chart({super.key});

  @override
  Widget build(BuildContext context) {
    List<TestEntity> list = [
      TestEntity("10-01", 25.4),
      TestEntity("10-02", 26.4),
      TestEntity("10-03", 26.8),
      TestEntity("10-04", 25.6),
      TestEntity("10-05", 24.3),
      TestEntity("10-06", 25.6),
      TestEntity("10-07", 25.8),
      TestEntity("10-08", 24.6),
      TestEntity("10-09", 25.6),
      TestEntity("10-10", 26.6),
      TestEntity("10-11", 26.4),
      TestEntity("10-12", 26.7),
      TestEntity("10-13", 26.3),
      TestEntity("10-14", 26.7),
    ];

    List<TestEntity> list2 = [
      TestEntity("10-01", 35.4),
      TestEntity("10-02", 36.4),
      TestEntity("10-03", 36.8),
      TestEntity("10-04", 35.6),
      TestEntity("10-05", 14.3),
      TestEntity("10-06", 35.6),
      TestEntity("10-07", 45.8),
      TestEntity("10-08", 34.6),
      TestEntity("10-09", 35.6),
      TestEntity("10-10", 36.6),
      // TestEntity("10-11", 26.4),
      // TestEntity("10-12", 26.7),
      // TestEntity("10-13", 26.3),
      // TestEntity("10-14", 26.7),
    ];

    List<LineSeries> buildCacheRate = [
      LineSeries<TestEntity, String>(
          name: "Sales",
          dataSource: list,
          xValueMapper: (TestEntity entity, _) => entity.date,
          yValueMapper: (TestEntity entity, _) => entity.y),
      LineSeries<TestEntity, String>(
          name: "Purchase",
          dataSource: list2,
          xValueMapper: (TestEntity entity, _) => entity.date,
          yValueMapper: (TestEntity entity, _) => entity.y),
    ];

    return SfCartesianChart(
        plotAreaBorderWidth: 0,
        primaryXAxis: CategoryAxis(
          majorGridLines: MajorGridLines(width: 0),
          axisLine: AxisLine(width: 0),
        ),
        palette: const [
          Color(0xFF5B8FF9),
          Color(0xFFE8684A),
        ],
        primaryYAxis: NumericAxis(
            axisLine: AxisLine(width: 0),
            labelFormat: '{value} %',
            majorTickLines: MajorTickLines(size: 0)),
        legend: Legend(isVisible: true),
        series: buildCacheRate);
  }
}

class TestEntity {
  String date;
  double y;

  TestEntity(this.date, this.y);
}
