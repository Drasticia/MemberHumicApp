import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:member_humic/data/models/respons/projectgallery_respons_model.dart';
import 'package:member_humic/presentation/admin_pages/bloc/projectgallery/projectgallery_bloc.dart';
import 'package:member_humic/presentation/admin_pages/projectgallery/previewprojectgallery.dart';

class Projectgallerypage extends StatefulWidget {
  const Projectgallerypage({super.key});

  @override
  State<Projectgallerypage> createState() => _ProjectgallerypageState();
}

class _ProjectgallerypageState extends State<Projectgallerypage> {
  @override
  void initState() {
    super.initState();
    _fetchProjectGallery();
  }

  void _fetchProjectGallery() {
    context.read<ProjectgalleryBloc>().add(const ProjectgalleryEvent.fetchAll());
    print("Fetching Project Gallery Data...");
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
      body: BlocListener<ProjectgalleryBloc, ProjectgalleryState>(
        listener: (context, state) {
          // Ketika status diperbarui, muat ulang data
          if (state is ProjectGalleryUpdated) {
            _fetchProjectGallery();
          }
        },
        child: BlocBuilder<ProjectgalleryBloc, ProjectgalleryState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: Text("Start fetching data...")),
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (projects) => buildProjectTable(projects),
              error: (message) => Center(child: Text(message)),
              loadedSingle: (_) => const SizedBox.shrink(),
              updated: () => const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }

  Widget buildProjectTable(List<Data> projects) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Text(
              'List Project Approval',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Table(
                columnWidths: const {
                  0: FixedColumnWidth(80.0),
                  1: FixedColumnWidth(80.0),
                  2: FixedColumnWidth(110.0),
                  3: FixedColumnWidth(140.0),
                  4: FixedColumnWidth(100.0),
                },
                border: TableBorder.all(color: Colors.grey),
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
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          '',
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
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                              decoration: BoxDecoration(
                                color: 
                                project.status == 'Approved'
                                  ? const Color(0xffEBF9F1)
                                : project.status == 'Rejected'
                                  ? const Color(0xffffcfcf) 
                                : project.status == 'Need Revision'
                                  ? const Color.fromARGB(40, 255, 162, 0)
                                  : const Color.fromARGB(41, 0, 157, 255),
                                borderRadius: BorderRadius.circular(22), // Radius sudut kotak
                              ),
                              child: Text(
                                project.status, 
                                style: TextStyle(
                                  color: 
                                  project.status == 'Approved'
                                    ? const Color(0xff1F9254)
                                  : project.status == 'Rejected'
                                    ? const Color(0xff930000) 
                                  : project.status == 'Need Revision'
                                    ? const Color(0xffFFA500)
                                    : const Color(0xff003e6d),
                                  fontWeight: FontWeight.w900
                                ),
                                textAlign: TextAlign.center
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            onPressed: () async {
                              final result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PreviewProject(projectId: project.id),
                                ),
                              );

                              // Periksa jika kembali dari PreviewProject dan reload data
                              if (result == true) {
                                _fetchProjectGallery();
                              }
                            },
                            icon: const Icon(
                              Icons.remove_red_eye_outlined,
                              color: Color(0xffB9B9B9),
                            ),
                          ),
                        ),
                      ],
                    );
                  })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}