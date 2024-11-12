import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:member_humic/core/constant/variable.dart';
import 'package:member_humic/data/datasources/announcementmember_service.dart';
import 'package:member_humic/presentation/member_pages/bloc/announcement/announcement_bloc.dart';

class AnnouncementpageMember extends StatefulWidget {
  const AnnouncementpageMember({super.key});

  @override
  State<AnnouncementpageMember> createState() => _AnnouncementpageMemberState();
}

class _AnnouncementpageMemberState extends State<AnnouncementpageMember> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xff800C05), Color(0xffE91407)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          ),
          child: const Text(
            'Announcement',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2.0),
          child: Container(
            color: const Color(0xff000000).withOpacity(0.1),
            height: 1,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => AnnouncementBloc(AnnouncementServiceMember('https://api.example.com'))
          ..add(FetchAnnouncements()), // Trigger fetching announcements
        child: BlocBuilder<AnnouncementBloc, AnnouncementState>(
          builder: (context, state) {
            return state.when(
              initial: () => Center(child: Text('Welcome to Announcements')),
              loading: () => Center(child: CircularProgressIndicator()),
              loaded: (announcements) => ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: announcements.length,
                itemBuilder: (context, index) {
                  final announcement = announcements[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffF8ECEC),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xffB9B9B9)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              announcement.title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 8),
                            if (announcement.images.isNotEmpty)
                              SizedBox(
                                height: 200,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: announcement.images.length,
                                  itemBuilder: (context, imgIndex) {
                                    final image = announcement.images[imgIndex];
                                    final imageUrl = "${Variables.imageBaseUrl}${image.image}";
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 8.0),
                                      child: LayoutBuilder(
                                        builder: (context, constraints){
                                          final screenWidth = MediaQuery.of(context).size.width;
                                          return CachedNetworkImage(
                                            imageUrl: imageUrl,
                                            width: screenWidth * 0.8,
                                            placeholder: (context, url) => const Center(
                                              child: CircularProgressIndicator(),
                                            ),
                                            errorWidget: (context, url, error) => const Icon(Icons.broken_image, color: Colors.red),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                            const SizedBox(height: 8),
                            Text(
                              announcement.desc,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '${DateFormat('yyyy-MM-dd').format(announcement.date)} ${announcement.time}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              error: (message) => Center(child: Text('Error: $message')),
            );
          },
        ),
      ),
    );
  }
}
