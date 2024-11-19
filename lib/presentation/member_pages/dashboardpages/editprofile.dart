import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';
import 'package:member_humic/core/constant/variable.dart';
import 'package:member_humic/presentation/member_pages/bloc/profile/profile_bloc.dart';
import 'package:member_humic/data/models/respons/userprofile_model.dart';

class EditProfile extends StatefulWidget {
  final Data user;

  const EditProfile({super.key, required this.user});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late TextEditingController _nameController;
  late TextEditingController _nipController;
  late TextEditingController _phoneController;
  late TextEditingController _addressController;
  late TextEditingController _birthdayController;
  late TextEditingController _facultyController;
  late TextEditingController _departmentController;

  late List<EduBackground> _eduBackground;

  String? _selectedGender;
  String? _selectedReligion;

  final List<String> _genders = ["Laki-laki", "Perempuan"];
  final List<String> _religions = [
    "Islam",
    "Kristen",
    "Hindu",
    "Buddha",
    "Lainnya"
  ];

  File? _selectedImage;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.user.name);
    _nipController = TextEditingController(text: widget.user.NIP);
    _phoneController = TextEditingController(text: widget.user.handphone);
    _addressController = TextEditingController(text: widget.user.address);
    _birthdayController = TextEditingController(text: widget.user.birthday);
    _facultyController = TextEditingController(text: widget.user.faculty);
    _departmentController = TextEditingController(text: widget.user.department);

    _eduBackground = List<EduBackground>.from(widget.user.eduBackground);
    _selectedGender = widget.user.gender == 1 ? "Laki-laki" : "Perempuan";
    _selectedReligion = widget.user.religion;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _nipController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _birthdayController.dispose();
    _facultyController.dispose();
    _departmentController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _saveProfile() {
    List<String> emptyFields = [];

    if (_nameController.text.isEmpty) emptyFields.add("Nama Lengkap");
    if (_nipController.text.isEmpty) emptyFields.add("NIP");
    if (_phoneController.text.isEmpty) emptyFields.add("Nomor HP");
    if (_addressController.text.isEmpty) emptyFields.add("Alamat");
    if (_birthdayController.text.isEmpty) emptyFields.add("Tanggal Lahir");
    if (_facultyController.text.isEmpty) emptyFields.add("Fakultas");
    if (_departmentController.text.isEmpty) emptyFields.add("Program Studi");
    if (_selectedGender == null) emptyFields.add("Jenis Kelamin");
    if (_selectedReligion == null) emptyFields.add("Agama");

    for (var edu in _eduBackground) {
      if (edu.level.isEmpty || edu.major.isEmpty || edu.institution.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Pastikan semua data riwayat studi terisi.')),
        );
        return;
      }
    }

    if (emptyFields.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Harap isi semua field yang wajib:\n${emptyFields.join(', ')}",
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final updatedUser = Data(
      id: widget.user.id,
      name: _nameController.text,
      NIP: widget.user.NIP,
      faculty: _facultyController.text,
      department: _departmentController.text,
      handphone: _phoneController.text,
      birthday: _birthdayController.text,
      gender: _selectedGender == "Laki-laki" ? 1 : 0,
      religion: _selectedReligion!,
      address: _addressController.text,
      profilePicture: widget.user.profilePicture,
      eduBackground: _eduBackground,
      status: widget.user.status,
    );
    Map<String, dynamic> prepareEducationData() {
      List<String> levels = [];
      List<String> majors = [];
      List<String> institutions = [];

      for (var edu in _eduBackground) {
        levels.add(edu.level);
        majors.add(edu.major);
        institutions.add(edu.institution);
      }

      return {
        "level": levels,
        "major": majors,
        "institution": institutions,
      };
    }

    print('Data to be sent: ${updatedUser.toJson()}');
    context.read<ProfileBloc>().add(UpdateProfile(updatedUser, _selectedImage));
  }

  void _editEducation(int index) {
    final edu = _eduBackground[index];
    final levelController = TextEditingController(text: edu.level);
    final majorController = TextEditingController(text: edu.major);
    final institutionController = TextEditingController(text: edu.institution);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: const Text(
          'Edit Riwayat Studi',
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: levelController,
              decoration: const InputDecoration(labelText: "Tingkat"),
            ),
            TextField(
              controller: majorController,
              decoration: const InputDecoration(labelText: "Jurusan"),
            ),
            TextField(
              controller: institutionController,
              decoration: const InputDecoration(labelText: "Institusi"),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.red, 
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24), 
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), 
              ),
              textStyle: const TextStyle(
                fontSize: 16, // Ukuran teks
                fontWeight: FontWeight.bold,
              ),
            ),
            child: const Text("Batal"),
          ),
          TextButton(
            onPressed: () {
              if (levelController.text.isEmpty ||
                  majorController.text.isEmpty ||
                  institutionController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Pastikan semua data terisi.')),
                );
                return;
              }
              setState(() {
                _eduBackground[index] = EduBackground(
                  level: levelController.text,
                  major: majorController.text,
                  institution: institutionController.text,
                );
              });
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color(0xff006AFF),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24), 
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), 
              ),
              textStyle: const TextStyle(
                fontSize: 16, // Ukuran teks
                fontWeight: FontWeight.bold,
              ),
            ),
            child: const Text("Simpan"),
          ),
        ],
      ),
    );
  }

  void _addEducation() {
    final levelController = TextEditingController();
    final majorController = TextEditingController();
    final institutionController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: const Text(
          'Tambah Riwayat Studi',
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: levelController,
              decoration: const InputDecoration(labelText: "Tingkat"),
            ),
            TextField(
              controller: majorController,
              decoration: const InputDecoration(labelText: "Jurusan"),
            ),
            TextField(
              controller: institutionController,
              decoration: const InputDecoration(labelText: "Institusi"),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.red, 
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24), 
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), 
              ),
              textStyle: const TextStyle(
                fontSize: 16, // Ukuran teks
                fontWeight: FontWeight.bold,
              ),
            ),
            child: const Text("Batal"),
          ),
          TextButton(
            onPressed: () {
              if (levelController.text.isEmpty ||
                  majorController.text.isEmpty ||
                  institutionController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Pastikan semua data terisi.')),
                );
                return;
              }
              setState(() {
                _eduBackground.add(EduBackground(
                  level: levelController.text,
                  major: majorController.text,
                  institution: institutionController.text,
                ));
              });
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color(0xff006AFF),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24), 
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), 
              ),
              textStyle: const TextStyle(
                fontSize: 16, // Ukuran teks
                fontWeight: FontWeight.bold,
              ),
            ),
            child: const Text("Tambah"),
          ),
        ],
      ),
    );
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
            'Dashboard',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is Updated) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Profil berhasil diperbarui!')),
            );
            Navigator.pop(context);
          }
          if (state is Error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Terjadi kesalahan: ${state.message}')),
            );
          }
        },
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
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  const Text(
                    "EDIT PROFILE",
                    style: TextStyle(
                      color: Color(0xffE91407),
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: _pickImage, 
                      child: Container(
                        width: 110,
                        height: 140,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(
                              10),
                        ),
                        child: Stack(
                          children: [
                            _selectedImage != null
                                ? Image.file(
                                    _selectedImage!,
                                    width: 110,
                                    height: 140,
                                    fit: BoxFit
                                        .cover, 
                                  )
                                : widget.user.profilePicture.isNotEmpty
                                    ? CachedNetworkImage(
                                        imageUrl:
                                            "${Variables.imageBaseUrl}${widget.user.profilePicture}",
                                        width: 110,
                                        height: 140,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) =>
                                            const Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Center(
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
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                margin: const EdgeInsets.all(5),
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(
                                      0.5),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.camera_alt,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: "Nama Lengkap",
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                      errorText: _nameController.text.isEmpty
                          ? "Nama Lengkap harus diisi"
                          : null,
                    ),
                    onChanged: (value) {
                      setState(
                          () {}); 
                    },
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _nipController,
                    decoration: InputDecoration(
                      labelText: "NIP",
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                      errorText: _nipController.text.isEmpty
                          ? "NIP harus diisi"
                          : null,
                    ),
                    onChanged: (value) {
                      setState(
                          () {});
                    },
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: "Nomor HP",
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                      errorText: _phoneController.text.isEmpty
                          ? "Nomor HP harus diisi"
                          : null,
                    ),
                    onChanged: (value) {
                      setState(
                          () {});
                    },
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _addressController,
                    decoration: InputDecoration(
                      labelText: "Alamat Asal",
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                      errorText: _addressController.text.isEmpty
                          ? "Alamat harus diisi"
                          : null,
                    ),
                    onChanged: (value) {
                      setState(
                          () {});
                    },
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _birthdayController,
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: "Tanggal Lahir",
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                      errorText: _birthdayController.text.isEmpty
                          ? "Tanggal Lahir harus diisi"
                          : null,
                    ),
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          _birthdayController.text =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _facultyController,
                    decoration: InputDecoration(
                      labelText: "Fakultas",
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                      errorText: _facultyController.text.isEmpty
                          ? "Fakultas harus diisi"
                          : null,
                    ),
                    onChanged: (value) {
                      setState(
                          () {});
                    },
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _departmentController,
                    decoration: InputDecoration(
                      labelText: "Program Studi",
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                      errorText: _departmentController.text.isEmpty
                          ? "Program Studi harus diisi"
                          : null,
                    ),
                    onChanged: (value) {
                      setState(
                          () {});
                    },
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: _selectedGender,
                    items: _genders.map((gender) {
                      return DropdownMenuItem(
                        value: gender,
                        child: Text(gender),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: "Jenis Kelamin",
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                      errorText: _selectedGender == null
                          ? "Jenis Kelamin harus dipilih"
                          : null,
                    ),
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: _selectedReligion,
                    items: _religions.map((religion) {
                      return DropdownMenuItem(
                        value: religion,
                        child: Text(religion),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedReligion = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: "Agama",
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                      errorText: _selectedReligion == null
                          ? "Agama harus dipilih"
                          : null,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Riwayat Studi",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _eduBackground.length,
                    itemBuilder: (context, index) {
                      final edu = _eduBackground[index];
                      return ListTile(
                        title: Text("${edu.level} - ${edu.major}"),
                        subtitle: Text(edu.institution),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () => _editEducation(
                                  index), 
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Color(0xffE91407),
                              ),
                              onPressed: () {
                                setState(() {
                                  _eduBackground.removeAt(
                                      index);
                                });
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  ElevatedButton.icon(
                    onPressed: _addEducation,
                    icon: const Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                    label: const Text(
                      "Tambah Riwayat Studi",
                      style: TextStyle(
                        color: Colors.black
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                       side: const BorderSide(
                        color: Color(0xff9E9E9E),
                        width: 2.0, // Ketebalan outline
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _saveProfile,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff006AFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text(
                      "Simpan Perubahan",
                      style: TextStyle(
                        color: Colors.white
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
}
