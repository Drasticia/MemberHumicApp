import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:member_humic/core/constant/variable.dart';
import 'package:member_humic/models/lmember.dart';
import 'package:member_humic/models/member.dart';
import 'package:member_humic/models/projectmodels.dart';
import 'package:member_humic/presentation/landing_pages/bloc/ProjectG/project_g_bloc.dart';
import 'package:member_humic/presentation/landing_pages/bloc/statistic/statistic_bloc.dart';
import 'package:member_humic/presentation/landing_pages/widget/barchart.dart';
import 'package:member_humic/presentation/landing_pages/widget/gradient.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
void didChangeDependencies() {
  super.didChangeDependencies();
  context.read<ProjectGBloc>().add(const ProjectGEvent.fetchApprovedProjects());
}
@override
  void initState() {
    super.initState();
    context.read<StatisticBloc>().add(const StatisticEvent.fetchStatistics());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, bottom: 16, top: 64),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 140),
                      child: Text(
                        'Welcome to the HUMIC Engineering Member Portal!',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffB3261E),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'As a part of the HUMIC community, you gain exclusive access to the latest innovations in the fields of the Internet of Things (IoT), Big Data, and healthcare technology. Get ready to engage in collaboration, training, and research that will bring technology closer to real life. Together, let\'s build a healthier and more prosperous future!',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Center(
                      child: SizedBox(
                        width: 500,
                        height: 320,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              top: 5,
                              left: 124,
                              child: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(teamMembers[1].imagePath),
                                radius: 50,
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 30,
                              child: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(timMember[4].imagePath),
                                radius: 50,
                              ),
                            ),
                            Positioned(
                              top: 180,
                              left: 25,
                              child: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(timMember[3].imagePath),
                                radius: 50,
                              ),
                            ),
                            Positioned(
                              top: 110,
                              right: 30,
                              child: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(timMember[2].imagePath),
                                radius: 50,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 135,
                              child: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(timMember[1].imagePath),
                                radius: 50,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 30,
                              child: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(timMember[0].imagePath),
                                radius: 50,
                              ),
                            ),
                            Positioned(
                              top: 95,
                              left: 110,
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 4,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      spreadRadius: 1,
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),
                                child: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(teamMembers[0].imagePath),
                                  radius: 60,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    const GradientText(
                      'STATISTIC',
                      gradient: LinearGradient(
                        colors: [Color(0xff800C05), Color(0xffE91407)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),
                    BlocBuilder<StatisticBloc, StatisticState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          loading: () => const Center(child: CircularProgressIndicator()),
                          loaded: (statistics) => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 45,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                        colors: [Color(0xffFFCDD2), Color(0xffFFEFEF)],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomRight,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.group_outlined,
                                      color: Color(0xffE41D1D),
                                      size: 30,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Prodi',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xffACACAC),
                                          ),
                                        ),
                                        Text(
                                          statistics.totalDepartments.toString(),
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: Container(
                                  width: 2,
                                  height: 40,
                                  color: const Color(0xffF0F0F0),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 45,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                        colors: [Color(0xffFFCDD2), Color(0xffFFEFEF)],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomRight,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.person_2_outlined,
                                      color: Color(0xffE41D1D),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Fakultas',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xffACACAC),
                                          ),
                                        ),
                                        Text(
                                          statistics.totalFaculties.toString(),
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: Container(
                                  width: 2,
                                  height: 40,
                                  color: const Color(0xffF0F0F0),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 45,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                        colors: [Color(0xffFFCDD2), Color(0xffFFEFEF)],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomRight,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.monitor_outlined,
                                      color: Color(0xffE41D1D),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Cabang',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xffACACAC),
                                          ),
                                        ),
                                        Text(
                                          statistics.totalBranches.toString(),
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          error: (message) => Center(child: Text(message)),
                          orElse: () => const Center(child: Text('No data available.')),
                        );
                      },
                    ),
                    
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
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
                                          color: Color(0xff949494)),
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
                                          color: Color(0xff949494)),
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
                    const SizedBox(height: 40),
                    const GradientText(
                      'PROJECT GALLERY',
                      gradient: LinearGradient(
                        colors: [Color(0xff800C05), Color(0xffE91407)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    BlocBuilder<ProjectGBloc, ProjectGState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          loading: () => const Center(child: CircularProgressIndicator()),
                          error: (message) => Center(child: Text('Error: $message')),
                          loaded: (projects) => ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: projects.data.length,
                            itemBuilder: (context, index) {
                              final project = projects.data[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      project.title,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        shadows: [
                                          Shadow(
                                            offset: const Offset(2, 2),
                                            blurRadius: 0.4,
                                            color: Colors.black.withOpacity(0.4),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Container(
                                      height: 120,
                                      width: double.infinity,
                                      color: Colors.grey[300],
                                      child: project.thumbnail.isNotEmpty
                                          ? CachedNetworkImage(
                                              imageUrl: "${Variables.imageBaseUrl}${project.thumbnail}",
                                              placeholder: (context, url) => const Center(
                                                child: CircularProgressIndicator(),
                                              ),
                                              errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red),
                                            )
                                          : const Icon(Icons.image, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          orElse: () => const SizedBox.shrink(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
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
    );
  }
}
