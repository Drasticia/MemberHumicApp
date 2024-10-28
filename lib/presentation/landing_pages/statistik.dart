import 'package:flutter/material.dart';
import 'package:member_humic/presentation/landing_pages/widget/barchart.dart';
import 'package:member_humic/presentation/landing_pages/widget/statsitic.dart';

class StatisticPage extends StatefulWidget {
  const StatisticPage({super.key});

  @override
  State<StatisticPage> createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage> {
  int selectedYear = 2024;

  void _incrementYear() {
    setState(() {
      selectedYear++;
    });
  }

  void _decrementYear() {
    setState(() {
      selectedYear--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 62,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff800C05), Color(0xffE91407)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'STATISTIC',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'HOMEPAGE',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '/STATISTIC',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff5B47BC).withOpacity(0.3),
                      spreadRadius: 0,
                      blurRadius: 20,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 15,
                              height: 2,
                              decoration: const BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Color(0xffE91407),
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              'STATUS',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff949494)
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 16),
                        Row(
                          children: [
                            Container(
                              width: 15,
                              height: 2,
                              decoration: const BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Color(0xffFF7777),
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              'JUMLAH MEMBER',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff949494)
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const CustomBarChartWidget(),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            const StatisticWidgets(),
            const SizedBox(height: 24),
            Container(
              height: 60,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff800C05), Color(0xffE91407)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: const Center(
                child: Text(
                  'HUMIC Research Center',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
