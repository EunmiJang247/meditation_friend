import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:meditation_friend_app/common/utils/kcolors.dart';
import 'package:intl/intl.dart'; // 날짜 포맷을 위해 추가

class LineChartSample2 extends StatefulWidget {
  const LineChartSample2({super.key});

  @override
  State<LineChartSample2> createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [Kolors.kOrange, Kolors.kOrange];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Kolors.kWhite,
      child: Stack(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1.70,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 18,
                left: 12,
                top: 24,
                bottom: 12,
              ),
              child: LineChart(mainData()),
            ),
          ),
          SizedBox(
            width: 60,
            height: 34,
            child: TextButton(
              onPressed: () {
                setState(() {
                  showAvg = !showAvg;
                });
              },
              child: Text(
                'avg',
                style: TextStyle(
                  fontSize: 12,
                  color:
                      showAvg
                          ? Colors.white.withValues(alpha: 0.5)
                          : Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(fontWeight: FontWeight.bold, fontSize: 14);

    // 현재 날짜 가져오기
    DateTime now = DateTime.now();

    // 최신 날짜에서 value를 빼서 과거 7일로 제한
    DateTime targetDate = now.subtract(Duration(days: (6 - value.toInt())));

    // 요일 가져오기 (월, 화, 수... 표시)
    String dayLabel = DateFormat.E(
      'ko_KR',
    ).format(targetDate); // '월', '화', '수' 형식

    return SideTitleWidget(meta: meta, child: Text(dayLabel, style: style));
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(fontWeight: FontWeight.normal, fontSize: 10);
    String text;
    switch (value.toInt()) {
      case 5:
        text = '5:00';
        break;
      case 6:
        text = '6:00';
        break;
      case 7:
        text = '7:00';
        break;
      case 8:
        text = '8:00';
        break;
      case 9:
        text = '9:00';
        break;
      case 10:
        text = '10:00';
        break;
      case 11:
        text = '11:00';
        break;
      case 12:
        text = '12:00';
        break;
      case 13:
        text = '13:00';
        break;
      case 14:
        text = '14:00';
      case 15:
        text = '15:00';
      case 16:
        text = '16:00';
      case 17:
        text = '17:00';
      case 18:
        text = '18:00';
      case 19:
        text = '19:00';
      case 20:
        text = '20:00';
      case 21:
        text = '21:00';
      case 22:
        text = '22:00';
      case 23:
        text = '23:00';
      case 24:
        text = '24:00';

        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(color: Kolors.kOrange, strokeWidth: 1);
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(color: Kolors.kSkyBlue, strokeWidth: 1);
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: Kolors.kOrange),
      ),
      minX: 0,
      maxX: 6,
      minY: 5,
      maxY: 24,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 5),
            FlSpot(1, 6),
            FlSpot(2, 12),
            FlSpot(3, 20),
            FlSpot(4, 15),
            FlSpot(5, 12),
            FlSpot(6, 11),
          ],
          isCurved: true,
          gradient: LinearGradient(colors: gradientColors),
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors:
                  gradientColors
                      .map((color) => color.withValues(alpha: 0.3))
                      .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
