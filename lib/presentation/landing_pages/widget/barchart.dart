import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomBarChartWidget extends StatelessWidget {
  const CustomBarChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: BarChart(
        BarChartData(
          titlesData: FlTitlesData(
            show: true,
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  switch (value.toInt()) {
                    case 1:
                      return const Text('2024');
                    case 2:
                      return const Text('2025');
                    case 3:
                      return const Text('2026');
                    case 4:
                      return const Text('2027');
                    case 5:
                      return const Text('2028');
                    default:
                      return const Text('');
                  }
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 10,
                getTitlesWidget: (value, meta) {
                  if (value % 10 == 0) {
                    return Text(value.toInt().toString());
                  }
                  return const Text('');
                },
              ),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          borderData: FlBorderData(show: false),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: 10,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.grey.withOpacity(0.4),
                strokeWidth: 1,
              );
            },
          ),
          barGroups: [
            BarChartGroupData(
              x: 1,
              barRods: [
                BarChartRodData(
                  toY: 35,
                  color: const Color(0xffE91407),
                  width: 24,
                  borderRadius: BorderRadius.zero,
                ),
                BarChartRodData(
                  toY: 35,
                  color: const Color(0xffFF7777),
                  width: 24,
                  borderRadius: BorderRadius.zero,
                ),
              ],
              barsSpace: 4,
            ),
            BarChartGroupData(
              x: 2,
              barRods: [
                BarChartRodData(
                  toY: 40,
                  color: const Color(0xffE91407),
                  width: 24,
                  borderRadius: BorderRadius.zero,
                ),
                BarChartRodData(
                  toY: 40,
                  color: const Color(0xffFF7777),
                  width: 24,
                  borderRadius: BorderRadius.zero,
                ),
              ],
              barsSpace: 4,
            ),
            BarChartGroupData(
              x: 3,
              barRods: [
                BarChartRodData(
                  toY: 0,
                  color: const Color(0xffE91407),
                  width: 24,
                  borderRadius: BorderRadius.zero,
                ),
                BarChartRodData(
                  toY: 0,
                  color: const Color(0xffFF7777),
                  width: 24,
                  borderRadius: BorderRadius.zero,
                ),
              ],
              barsSpace: 4,
            ),
            BarChartGroupData(
              x: 4,
              barRods: [
                BarChartRodData(
                  toY: 0,
                  color: const Color(0xffE91407),
                  width: 24,
                  borderRadius: BorderRadius.zero,
                ),
                BarChartRodData(
                  toY: 0,
                  color: const Color(0xffFF7777),
                  width: 24,
                  borderRadius: BorderRadius.zero,
                ),
              ],
              barsSpace: 4,
            ),
            BarChartGroupData(
              x: 5,
              barRods: [
                BarChartRodData(
                  toY: 0,
                  color: const Color(0xffE91407),
                  width: 24,
                  borderRadius: BorderRadius.zero,
                ),
                BarChartRodData(
                  toY: 0,
                  color: const Color(0xffFF7777),
                  width: 24,
                  borderRadius: BorderRadius.zero,
                ),
              ],
              barsSpace: 4,
            ),
          ],
        ),
      ),
    );
  }
}
