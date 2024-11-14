import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:member_humic/core/constant/variable.dart';
import 'package:member_humic/data/models/respons/About/aboutmember_response.dart';
import 'package:member_humic/presentation/landing_pages/bloc/MemberLanding/member_bloc.dart';
import 'package:member_humic/presentation/landing_pages/detailmember.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  void initState() {
    super.initState();
    context.read<MemberLandingBloc>().add(const MemberLandingEvent.fetchAbout());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<MemberLandingBloc, MemberLandingState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),

            aboutLoaded: (memberResponse) {
              final positionOneMembers = memberResponse.userOne
                  .where((member) => member.position == 1)
                  .toList();
              final positionTwoMembers = memberResponse.userTwo
                  .where((member) => member.position == 2)
                  .toList();
              final positionThreeMembers = memberResponse.userThree
                  .where((member) => member.position == 3)
                  .toList();

              return SingleChildScrollView(
                child: Column(
                  children: [
                    // About Us Header Section
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
                              'ABOUT US',
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
                                  '/ABOUT US',
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
                    // About Us Information Section
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset(
                        'assets/images/HHumic.png',
                        width: 380,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Human Centric Engineering (HUMIC) is one of the research centers (RC) at Telkom University that was officially founded in February 2020 with Dr. Satria Mandala as the Director of the RC. Human Centric Engineering focuses on several research fields, such as computing, informatics, electronics, robotics, mechanical and biomedical engineering. All of these researches are intended to support HUMICs vision to become a center of excellence in improving the health and well-being of human life.',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.w500
                            ),
                            textAlign: TextAlign.start,
                          ),

                          SizedBox(height: 16.0),

                          Text(
                            'Vision',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xffB3261E),
                              fontWeight: FontWeight.bold
                            ),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            'To become an excellent research center in the field of engineering to improve the human health and prosperity',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.w500
                            ),
                            textAlign: TextAlign.start,
                          ),

                          SizedBox(height: 16.0),

                          Text(
                            'Mission',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xffB3261E),
                              fontWeight: FontWeight.bold
                            ),
                            textAlign: TextAlign.start,
                          ),
                          
                          SizedBox(height: 8.0),
                          Text(
                            '1. Becoming the science and technology excellent center in the field of embedded sensor systems to support biomedical applications based on the Internet of Things (IoT).',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            '2. Becoming the science and technology excellent center on development remote health monitoring systems based on Internet of Things (IoT).',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            '3. Becoming the science and technology excellent center on Big Data Analytic.',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            '4. Becoming the science and technology excellent center on health development of Information and Communication Technology (ICT).',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        ],
                      ),
                    ),
                    // "Meet Our Team" Section Header
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 12,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Color(0xff800C05), Color(0xffE91407)],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'MEET OUR TEAM',
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(0xffB3261E),
                                fontWeight: FontWeight.w900),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              height: 12,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Color(0xff800C05), Color(0xffE91407)],
                                  begin: Alignment.centerRight,
                                  end: Alignment.centerLeft,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: positionOneMembers.map((member) {
                          return Expanded(child: memberCard(member));
                        }).toList(),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 12, right: 12, bottom: 12),
                      child: Text(
                          'The following are several members entrusted with operational roles at HUMiC research center, combining great passion for science and engineering with diverse skills and experience, as great power comes with great responsibility.',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                          ),
                          textAlign: TextAlign.center,
                        ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      alignment: WrapAlignment.center,
                      children: [
                        ...positionTwoMembers.map((member) => memberCard(member)),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      alignment: WrapAlignment.center,
                      children: [
                        ...positionThreeMembers.map((member) => memberCard(member)),
                      ],
                    ),
                    const SizedBox(height: 50),
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
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },

            // Handle the error state
            error: (message) => Center(
              child: Text(
                'Error: $message',
                style: const TextStyle(color: Colors.red),
              ),
            ),

            // Default fallback widget if no matching state is found
            orElse: () => const Center(child: Text('No data available.')),
          );
        },
      ),
    );
  }

  // Helper widget to create a member card
  Widget memberCard(User member) {
    return SizedBox(
      width: 120,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MemberDetailPage(member: member),
            ),
          );
        },
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: 130,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                  ),
                  child: member.profilePicture.isNotEmpty
                      ? CachedNetworkImage(
                          imageUrl: "${Variables.imageBaseUrl}${member.profilePicture}",
                          width: 130,
                          height: 200,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) => Center(
                            child: Icon(
                              Icons.person,
                              size: 50,
                              color: Colors.grey[600],
                            ),
                          ),
                        )
                      : Center(
                          child: Icon(
                            Icons.person,
                            size: 50,
                            color: Colors.grey[600],
                          ),
                        ),
                ),
                Positioned(
                  bottom: 10,
                  child: Container(
                    width: 150,
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    color: const Color(0x66B3261E),
                    child: Column(
                      children: [
                        Text(
                          member.name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.white, fontSize: 8),
                        ),
                        Text(
                          member.positionName,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
