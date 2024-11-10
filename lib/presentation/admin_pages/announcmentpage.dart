import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:member_humic/presentation/admin_pages/bloc/announcement/announcement_bloc.dart';
import 'package:member_humic/presentation/admin_pages/widget/gradientborder.dart';

class Announcmentpage extends StatefulWidget {
  const Announcmentpage({super.key});

  @override
  State<Announcmentpage> createState() => _AnnouncmentpageState();
}

class _AnnouncmentpageState extends State<Announcmentpage> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();

  List<File> files = [];

  void pickFiles(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: [
        'jpg',
        'png',
        'gif',
        'mp4',
        'pdf',
        'psd',
        'ai',
        'doc',
        'ppt'
      ],
    );

    if (result != null) {
      List<File> pickedFiles = result.paths.map((path) => File(path!)).toList();
      setState(() {
        files = pickedFiles;
      });
    }
  }

  void uploadFiles(BuildContext context) {
    context.read<AnnouncementBloc>().add(
          AnnouncementEvent.createAnnouncement(
            title: titleController.text,
            description: descriptionController.text,
            date: dateController.text,
            time: timeController.text,
            files: files,
          ),
        );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        dateController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );

    if (picked != null) {
      final String formattedTime = picked.hour.toString().padLeft(2, '0') +
          ':' +
          picked.minute.toString().padLeft(2, '0');
      setState(() {
        timeController.text = formattedTime;
      });
    }
  }

  void clearInputs() {
    titleController.clear();
    descriptionController.clear();
    dateController.clear();
    timeController.clear();
    setState(() {
      files.clear();
    });
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
            'Announcement',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
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
      body: MultiBlocListener(
        listeners: [
          BlocListener<AnnouncementBloc, AnnouncementState>(
            listener: (context, state) {
              state.when(
                initial: () {},
                loading: () {},
                success: () {
                  // Tampilkan Snackbar sukses
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Announcement created successfully!"),
                      backgroundColor: Colors.green,
                    ),
                  );
                  
                  // Bersihkan input setelah sukses
                  clearInputs();
                  
                  // Reset state kembali ke initial jika diperlukan
                  context.read<AnnouncementBloc>().add(AnnouncementEvent.reset());
                },
                failure: (message) {
                  // Tampilkan Snackbar error
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                      backgroundColor: Colors.red,
                    ),
                  );
                },
                filePicked: (pickedFiles) {
                  setState(() {
                    files = pickedFiles;
                  });
                },
              );
            },
          ),
        ],
        child: BlocBuilder<AnnouncementBloc, AnnouncementState>(
          builder: (context, state) {
            return state.when(
              initial: () => buildContent(context),
              loading: () => const Center(child: CircularProgressIndicator()),
              success: () => buildContent(context),
              failure: (message) => buildContent(context),
              filePicked: (pickedFiles) => buildContent(context),
            );
          },
        ),
      ),
    );
  }

  Widget buildContent(BuildContext context) {
    return SingleChildScrollView(
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Add New Announcement',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
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
                        child: GestureDetector(
                          onTap: () => pickFiles(context),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Drag & drop files or ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    GestureDetector(
                                      onTap: () => pickFiles(context),
                                      child: ShaderMask(
                                        shaderCallback: (bounds) =>
                                            const LinearGradient(
                                          colors: [
                                            Color(0xff800C05),
                                            Color(0xffE91407)
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ).createShader(bounds),
                                        child: const Text(
                                          'Browse',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            decoration:
                                                TextDecoration.underline,
                                            decorationColor: Colors.red,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'Supported formats: JPEG, PNG, GIF, MP4, PDF, PSD, AI, Word, PPT',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.black54),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (files.isNotEmpty) ...[
                    const Text('Selected Files:',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    ...files.map((file) => ListTile(
                          title: Text(file.path.split('/').last),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              setState(() {
                                files.remove(file);
                              });
                            },
                          ),
                        )),
                  ],
                  const SizedBox(height: 16),
                  buildTextField(
                      'Title', titleController, 'type the title here'),
                  const SizedBox(height: 16),
                  buildTextField('Description', descriptionController,
                      'type the description here'),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () => _selectDate(context),
                    child: AbsorbPointer(
                      child: buildTextField(
                          'Date', dateController, 'choose the date'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () => _selectTime(context),
                    child: AbsorbPointer(
                      child: buildTextField(
                          'Time', timeController, 'choose the time'),
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: 300,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () => uploadFiles(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff006AFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: const Text(
                        'UPLOAD',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String label, TextEditingController controller, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: 300,
          height: 50,
          child: TextField(
            controller: controller,
            style: const TextStyle(fontSize: 16),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(color: Color(0xffB9B9B9)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: Colors.grey, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: Colors.black, width: 2.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
