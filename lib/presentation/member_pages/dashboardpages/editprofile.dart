import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:member_humic/presentation/member_pages/bloc/profile/profile_bloc.dart';
import '../../../data/models/respons/userprofile_model.dart';
XFile? _pickedFile;
class EditProfile extends StatefulWidget {
  final Data user;

  const EditProfile({super.key, required this.user});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late TextEditingController nameController;
  late TextEditingController nipController;
  late TextEditingController facultyController;
  late TextEditingController departmentController;
  late TextEditingController phoneController;
  late TextEditingController addressController;
  late TextEditingController birthdayController;
  late TextEditingController religionController;
  late TextEditingController majorController;
  late TextEditingController institutionController;
  String selectedLevel = 'S1';
  List<EduBackground> eduBackgroundList = [];
  Uint8List? profileImageBytes;

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.user.name);
    nipController = TextEditingController(text: widget.user.NIP.toString());
    facultyController = TextEditingController(text: widget.user.faculty);
    departmentController = TextEditingController(text: widget.user.department);
    phoneController = TextEditingController(text: widget.user.handphone.toString());
    addressController = TextEditingController(text: widget.user.address);
    birthdayController = TextEditingController(text: widget.user.birthday);
    religionController = TextEditingController(text: widget.user.religion);
    majorController = TextEditingController();
    institutionController = TextEditingController();
    eduBackgroundList = widget.user.eduBackground;
  }

  void _onSave() {
    if (nameController.text.isEmpty ||
        nipController.text.isEmpty ||
        facultyController.text.isEmpty ||
        departmentController.text.isEmpty ||
        phoneController.text.isEmpty ||
        birthdayController.text.isEmpty ||
        religionController.text.isEmpty ||
        addressController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("All fields are required.")),
      );
      return;
    }

    final updatedUser = {
      'id': widget.user.id,
      'name': nameController.text,
      'NIP': nipController.text,
      'faculty': facultyController.text,
      'department': departmentController.text,
      'handphone': phoneController.text,
      'birthday': birthdayController.text,
      'gender': widget.user.gender,
      'religion': religionController.text,
      'address': addressController.text,
      'eduBackground': eduBackgroundList.map((e) => e.toJson()).toList(),
    };

    // Menyertakan `profileImageBytes` jika ada
    String? profilePicturePath;
    if (_pickedFile != null) {
      profilePicturePath = _pickedFile!.path;
    }

    context.read<ProfileBloc>().add(ProfileEvent.updateProfile(updatedUser, profilePicturePath));
  }

  void _addEduBackground() {
    setState(() {
      eduBackgroundList.add(EduBackground(
        level: selectedLevel,
        major: majorController.text,
        institution: institutionController.text,
      ));
      majorController.clear();
      institutionController.clear();
    });
  }

  Future<void> _pickProfileImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        profileImageBytes = bytes;
        _pickedFile = pickedFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
        backgroundColor: const Color(0xff006AFF),
      ),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          state.maybeWhen(
            updated: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Profile updated successfully")),
              );
              Navigator.pop(context);
            },
            error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message)),
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          }
          return _buildForm();
        },
      ),
    );
  }

  Widget _buildForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Center(
            child: GestureDetector(
              onTap: _pickProfileImage,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: profileImageBytes != null
                    ? MemoryImage(profileImageBytes!)
                    : CachedNetworkImageProvider(widget.user.profilePicture) as ImageProvider,
                child: profileImageBytes == null ? const Icon(Icons.camera_alt) : null,
              ),
            ),
          ),
          const SizedBox(height: 16),
          _buildTextField("Nama Lengkap", nameController),
          _buildTextField("NIP", nipController, isNumber: true),
          _buildTextField("Fakultas", facultyController),
          _buildTextField("Program Studi", departmentController),
          _buildTextField("Nomor HP", phoneController, isNumber: true),
          _buildTextField("Alamat", addressController),
          _buildTextField("Tanggal Lahir (YYYY-MM-DD)", birthdayController),
          _buildTextField("Agama", religionController),
          const SizedBox(height: 24),
          const Text("Riwayat Studi", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          DropdownButtonFormField<String>(
            value: selectedLevel,
            items: ['S1', 'S2', 'S3']
                .map((level) => DropdownMenuItem(value: level, child: Text(level)))
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedLevel = value!;
              });
            },
            decoration: const InputDecoration(labelText: "Level"),
          ),
          _buildTextField("Jurusan", majorController),
          _buildTextField("Institusi", institutionController),
          ElevatedButton(
            onPressed: _addEduBackground,
            child: const Text("Tambah Riwayat Studi"),
          ),
          const SizedBox(height: 24),
          ...eduBackgroundList.map((edu) => ListTile(
                title: Text('${edu.level} - ${edu.major}'),
                subtitle: Text(edu.institution),
              )),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _onSave,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffE91407),
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text("Save Changes", style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {bool isNumber = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
