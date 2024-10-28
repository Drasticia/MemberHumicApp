import 'package:flutter/material.dart';
import 'package:member_humic/models/projectmodels.dart';

class ProjectgalleryPage extends StatefulWidget {
  const ProjectgalleryPage({super.key});

  @override
  State<ProjectgalleryPage> createState() => _ProjectgalleryPageState();
}

class _ProjectgalleryPageState extends State<ProjectgalleryPage> {
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
                      'PROJECT GALLERY',
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
                          '/PROJECT GALLERY',
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
            
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: projectmodel.length,
              itemBuilder: (context, index) {
                final project = projectmodel[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        project.tittle,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              offset: const Offset(2, 2),
                              blurRadius: 0.4,
                              color: Colors.black.withOpacity(0.4),
                            ),
                          ]
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: 120,
                        width: double.infinity,
                        color: Colors.grey[300],
                        child: project.imagePath.isNotEmpty
                            ? Image.network(project.imagePath, fit: BoxFit.cover)
                            : const Icon(Icons.image, color: Colors.grey),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
