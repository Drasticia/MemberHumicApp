import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:member_humic/data/models/request/projectgallerymember_moder.dart';
import 'package:member_humic/presentation/member_pages/bloc/ProjectGalleryS/project_gallery_s_bloc.dart';
import 'package:member_humic/presentation/member_pages/projectgallerypage.dart/addprojectgallery.dart';

class ProjectgalleryMember extends StatefulWidget {
  const ProjectgalleryMember({super.key});

  @override
  State<ProjectgalleryMember> createState() => _ProjectgalleryMemberState();
}

class _ProjectgalleryMemberState extends State<ProjectgalleryMember> {
  @override
  void initState() {
    super.initState();
    // Memicu fetchGallery ketika halaman dibuka
    context.read<ProjectGallerySBloc>().add(ProjectGallerySEvent.fetchGallery());
  }

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
            'Project Gallery',
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
      body: BlocBuilder<ProjectGallerySBloc, ProjectGallerySState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: Text('Ready to load')),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (gallery) => _buildProjectTable(gallery.projectGallery),
            added: (project) => Center(child: Text('Project "${project.title}" added successfully!')),
            error: (message) => Center(child: Text(message)),
          );
        },
      ),
    );
  }

  Widget _buildProjectTable(List<ProjectGallery> projects) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Addprojectgallery(),
                      ),
                    );

                    if (result == true) {
                      context.read<ProjectGallerySBloc>().add(ProjectGallerySEvent.fetchGallery());
                    }
                  },
                  icon: const Icon(Icons.add, color: Colors.white),
                  label: const Text(
                    'Add Project',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff1B59F8),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Table(
                columnWidths: const {
                  0: FixedColumnWidth(80.0),
                  1: FixedColumnWidth(80.0),
                  2: FixedColumnWidth(110.0),
                  3: FixedColumnWidth(100.0),
                },
                border: TableBorder.all(
                  color: Colors.grey,
                ),
                children: [
                  TableRow(
                    decoration: BoxDecoration(
                      color: const Color(0xff000000).withOpacity(0.06),
                    ),
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'No',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'TITLE',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'DESCRIPTION',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'STATUS',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  ...projects.asMap().entries.map((entry) {
                    int index = entry.key + 1;
                    var project = entry.value;
                    return TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(index.toString(), textAlign: TextAlign.center),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(project.title, textAlign: TextAlign.start),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(project.description, textAlign: TextAlign.start),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: project.status == 'Rejected'
                                  ? const Color(0xffE91407)
                                  : project.status == 'Approved'
                                      ? const Color(0xff1F9254)
                                      : project.status == 'Need Revision'
                                          ? const Color(0xffFFA500)
                                          : project.status == 'Waiting'
                                              ? const Color(0xff1976D2)
                                              : const Color(0xffEBF9F1),
                              border: Border.all(
                                color: project.status == 'Rejected'
                                    ? const Color(0xffE91407)
                                    : project.status == 'Approved'
                                        ? Colors.green
                                        : project.status == 'Need Revision'
                                            ? Colors.yellow
                                            : project.status == 'On Review'
                                                ? Colors.blue
                                                : const Color(0xffEBF9F1),
                              ),
                              borderRadius: BorderRadius.circular(22),
                            ),
                            child: Text(
                              project.status,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
