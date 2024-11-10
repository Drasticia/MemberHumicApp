import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:member_humic/core/constant/variable.dart';
import 'package:member_humic/data/models/respons/projectgallery_respons_model.dart';
import 'package:member_humic/presentation/admin_pages/bloc/projectgallery/projectgallery_bloc.dart';

class PreviewProject extends StatefulWidget {
  const PreviewProject({super.key, required this.projectId});

  final int projectId;

  @override
  State<PreviewProject> createState() => _PreviewProjectState();
}

class _PreviewProjectState extends State<PreviewProject> {
  final commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context
        .read<ProjectgalleryBloc>()
        .add(ProjectgalleryEvent.fetchById(widget.projectId));
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  void _updateStatus(String status) {
    context.read<ProjectgalleryBloc>().add(
          ProjectgalleryEvent.updateStatus(
            id: widget.projectId,
            status: status,
            comment: commentController.text,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, true);
        return false;
      },
      child: Scaffold(
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
                  color: Colors.white),
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
        body: BlocConsumer<ProjectgalleryBloc, ProjectgalleryState>(
          listener: (context, state) {
            if (state is ProjectGalleryUpdated) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('Project updated successfully!'),
                    backgroundColor: Colors.green),
              );
              Navigator.pop(context, true);
            }
            if (state is ProjectGalleryError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(state.message), backgroundColor: Colors.red),
              );
            }
          },
          builder: (context, state) {
            if (state is ProjectGalleryLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is ProjectGalleryLoadedSingle) {
              final project = state.gallery;
              return buildProjectDetail(project);
            }
            return const Center(child: Text('No Project Found.'));
          },
        ),
      ),
    );
  }

  Widget buildProjectDetail(Data project) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 13, 10, 10).withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 8,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'PREVIEW',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 22,
                      )
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.grey[300],
                  child:
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: const Color(0xffB9B9B9)),
                        ),
                        child: project.thumbnail != null && project.thumbnail!.isNotEmpty
                            ? CachedNetworkImage(
                                imageUrl:
                                    "${Variables.imageBaseUrl}${project.thumbnail}",
                                fit: BoxFit.cover,
                                errorWidget: (context, error, stackTrace) {
                                  return const Center(
                                    child: Text(
                                      'Failed to load image',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  );
                                },
                              )
                            : const Center(
                                child: Text(
                                  'Image Preview',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                      ),
                ),
                const SizedBox(height: 8),
                buildField('Title', project.title,),
                buildField('Description', project.description),
                buildField(
                    'Date',
                    project.date != null
                        ? project.date!.toIso8601String().split('T')[0]
                        : 'N/A'),
                const SizedBox(height: 8),
                const Text(
                  'Comments',
                  style: 
                  TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff676767),
                    fontSize: 16
                  )
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: commentController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    hintText: 'Enter your comments here',
                    border: OutlineInputBorder(),
                  ),
                  autofocus: true,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildStatusButton(
                        'DENIED', const Color(0xffE91407), () => _updateStatus('Rejected')),
                    const SizedBox(width: 10),
                    _buildStatusButton('REVISION', const Color(0xffFFA500),
                        () => _updateStatus('Need Revision')),
                    const SizedBox(width: 10),
                    _buildStatusButton('APPROVED', const Color(0xff1F9254),
                        () => _updateStatus('Approved')),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildField(String label, String? value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label, 
          style: 
          const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xff676767),
            fontSize: 16
          )
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: const Color(0xffB9B9B9)),
          ),
          child: Text(
            value ?? 'N/A', 
            style: 
            const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600
            )
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  ElevatedButton _buildStatusButton(
      String label, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4), // Mengatur radius di sini
          ),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    );
  }
}
