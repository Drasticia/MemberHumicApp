import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:member_humic/presentation/landing_pages/bloc/statistic/statistic_bloc.dart';


class StatisticWidgets extends StatefulWidget {
  const StatisticWidgets({super.key});

  @override
  State<StatisticWidgets> createState() => _StatisticWidgetsState();
}

class _StatisticWidgetsState extends State<StatisticWidgets> {
  @override
  void initState() {
    super.initState();
    context.read<StatisticBloc>().add(const StatisticEvent.fetchStatistics());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatisticBloc, StatisticState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (statistics) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildStatisticCard(
                      title: 'Prodi',
                      value: statistics.totalDepartments.toString(),
                      color: const Color(0xff369FFF),
                      iconPath: 'assets/icons/notebook.png',
                    ),
                    _buildDetailBox(
                      label: 'AKTIF',
                      value: '${statistics.totalActive} Person',
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildStatisticCard(
                      title: 'Fakultas',
                      value: statistics.totalFaculties.toString(),
                      color: const Color(0xff8AC53E),
                      iconPath: 'assets/icons/computer.png',
                    ),
                    _buildDetailBox(
                      label: 'CABANG',
                      value: statistics.totalBranches.toString(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          error: (message) => Center(child: Text(message)),
          orElse: () => const Center(child: Text('No data available.')),
        );
      },
    );
  }

  // Helper method to build statistic cards
  Widget _buildStatisticCard({
    required String title,
    required String value,
    required Color color,
    required String iconPath,
  }) {
    return Container(
      width: 220,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'View Detail',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.asset(
                iconPath,
                height: 70,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper method to build detail boxes
  Widget _buildDetailBox({required String label, required String value}) {
    return Container(
      width: 130,
      height: 130,
      decoration: BoxDecoration(
        color: Colors.lightBlue.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                color: Color(0xff006ED3),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
