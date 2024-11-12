import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:member_humic/data/models/respons/static_response_model.dart';
import 'package:member_humic/presentation/landing_pages/bloc/statistic/statistic_bloc.dart';


class CustomBarChartWidget extends StatelessWidget {
  const CustomBarChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatisticBloc, StatisticState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (message) => Center(child: Text(message)),
          loaded: (statistics) {
            final usersGroupedByYear = statistics.usersGroupedByYear;
            final activeUsersGroupedByYear = statistics.activeUsersGroupedByYear;

            List<BarChartGroupData> barGroups = [];
            for (int i = 0; i < usersGroupedByYear.length; i++) {
              final yearData = usersGroupedByYear[i];
              final activeData = activeUsersGroupedByYear.firstWhere(
                (activeYear) => activeYear.year == yearData.year,
                orElse: () => ActiveUsersGroupedByYear(year: yearData.year, activeMembers: 0),
              );

              barGroups.add(
                BarChartGroupData(
                  x: i + 1,
                  barRods: [
                    BarChartRodData(
                      toY: yearData.totalMembers.toDouble(),
                      color: const Color(0xffE91407),
                      width: 24,
                      borderRadius: BorderRadius.zero,
                    ),
                    BarChartRodData(
                      toY: activeData.activeMembers.toDouble(),
                      color: const Color(0xffFF7777),
                      width: 24,
                      borderRadius: BorderRadius.zero,
                    ),
                  ],
                  barsSpace: 4,
                ),
              );
            }

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
                          final index = value.toInt() - 1;
                          if (index >= 0 && index < usersGroupedByYear.length) {
                            return Text(usersGroupedByYear[index].year.toString());
                          }
                          return const Text('');
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
                  barGroups: barGroups,
                ),
              ),
            );
          },
          orElse: () => const Center(child: Text("Press fetch to load statistics")),
        );
      },
    );
  }
}
