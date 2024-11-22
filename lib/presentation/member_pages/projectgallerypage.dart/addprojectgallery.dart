import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:member_humic/presentation/admin_pages/widget/gradientborder.dart';
import 'package:member_humic/presentation/member_pages/bloc/ProjectGalleryS/project_gallery_s_bloc.dart';

class Addprojectgallery extends StatefulWidget {
  const Addprojectgallery({super.key});

  @override
  State<Addprojectgallery> createState() => _AddprojectgalleryState();
}

class _AddprojectgalleryState extends State<Addprojectgallery> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _dateOfBirthController = TextEditingController();
  File? _thumbnail;

  final picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _thumbnail = File(pickedFile.path);
      });
    }
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
            ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
            child: const Text(
              'Add Project Gallery',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: BlocListener<ProjectGallerySBloc, ProjectGallerySState>(
          listener: (context, state) {
            state.whenOrNull(
              added: (project) async {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Project "${project.title}" added successfully!')),
                );
                // Pastikan memicu FetchGallery
                if (context.mounted) {
                  context.read<ProjectGallerySBloc>().add(ProjectGallerySEvent.fetchGallery());
                  Navigator.of(context).pop(true); 
                }
              },
              error: (message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error: $message')),
                );
              },
            );
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                  decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 4,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: Text(
                            'ADD PROJECT',
                            style:
                                TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: _pickImage,
                                    child: Container(
                                      color: Colors.red.shade50,
                                      child: CustomPaint(
                                        painter: GradientDottedBorderPainter(
                                          strokeWidth: 2,
                                          dashPattern: [6, 3],
                                          radius: const Radius.circular(8),
                                          gradient: const LinearGradient(
                                            colors: [Color(0xff800C05), Color(0xffE91407)],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                        ),
                                        child: Container(
                                          padding: const EdgeInsets.all(16),
                                          child: Column(
                                            children: [
                                              ShaderMask(
                                                shaderCallback: (bounds) =>
                                                    const LinearGradient(
                                                  colors: [
                                                    Color(0xff800C05),
                                                    Color(0xffE91407)
                                                  ],
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                ).createShader(bounds),
                                                child: const Icon(
                                                  Icons.cloud_upload_outlined,
                                                  size: 45,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Row(
                                                children: [
                                                  const Text(
                                                    'Drag & drop files or ',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  ShaderMask(
                                                    shaderCallback: (bounds) => const LinearGradient(
                                                      colors: [
                                                        Color(0xff800C05),
                                                        Color(0xffE91407),
                                                      ],
                                                      begin: Alignment.topLeft,
                                                      end: Alignment.bottomRight,
                                                    ).createShader(bounds),
                                                    child: const Text(
                                                      'Browse',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.white, // This will be overridden by ShaderMask
                                                        decoration: TextDecoration.underline,
                                                        decorationColor: Colors.red,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 6),
                                              const Text(
                                                'Supported formates: JPEG, PNG, GIF, MP4, PDF, Word',
                                                style: TextStyle(
                                                  fontSize: 10
                                                ),
                                              ),
                                              if (_thumbnail != null)
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 8.0),
                                                  child: Text('Image selected: ${_thumbnail!.path.split('/').last}'),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        const SizedBox(height: 16),
                        const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            'Title',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        TextField(
                          controller: _titleController,
                          decoration: InputDecoration(
                            hintText: 'Add title',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                    
                        // Input Description
                        const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            'Description',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        TextField(
                          controller: _descriptionController,
                          decoration: InputDecoration(
                            hintText: 'Add description',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                    
                        // Input Date
                        const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            'Date',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        TextField(
                          controller: _dateOfBirthController,
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            );
                            if (pickedDate != null) {
                              _dateOfBirthController.text =
                                  "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
                            }
                          },
                          decoration: InputDecoration(
                            hintText: 'Select Date',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        
                    
                        // Upload Button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xffE91407),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              child: const Text(
                                'CANCEL',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            ElevatedButton(
                              onPressed: () {
                                if (_titleController.text.isNotEmpty &&
                                    _descriptionController.text.isNotEmpty &&
                                    _dateOfBirthController.text.isNotEmpty &&
                                    _thumbnail != null) {
                                  context.read<ProjectGallerySBloc>().add(
                                        ProjectGallerySEvent.addProjectGallery(
                                          title: _titleController.text,
                                          description: _descriptionController.text,
                                          date: _dateOfBirthController.text,
                                          thumbnail: _thumbnail!,
                                        ),
                                      );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Please fill all fields')),
                                  );
                                }
                              },
                              child: const Text(
                                'UPLOAD',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                                style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff1F9254),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
  }
}
