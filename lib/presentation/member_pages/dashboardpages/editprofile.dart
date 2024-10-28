import 'package:flutter/material.dart';
import 'package:member_humic/presentation/member_pages/widgets/edititem.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({super.key});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  final _nameController =
      TextEditingController(text: 'Amila Nafila Vidyana, S.I.Kom');
  final _nipController = TextEditingController(text: '333333');
  final _facultyController = TextEditingController(text: 'Informatika');
  final _programStudyController = TextEditingController(text: 'Informatika');
  final _phoneNumberController = TextEditingController(text: '081244557898');

  final _addressController = TextEditingController(text: 'Bogor');
  final _dateOfBirthController = TextEditingController(text: '1997-03-14');

  String? _selectedGender = 'Perempuan';
  String? _selectedReligion = 'Muslim';

  final List<String> _genderList = ['Perempuan', 'Laki-laki'];
  final List<String> _religionList = ['Muslim', 'Kristen', 'Budha', 'Hindu'];

  List<Map<String, String>> _educations = [
    {
      'degree': 'S1',
      'studyProgram': 'Informatika',
      'university': 'Universitas Telkom'
    }
  ];

  final List<String> _degreeOptions = ['S1', 'S2', 'S3'];

  void _addEducation() {
    setState(() {
      _educations.add({'degree': 'S1', 'studyProgram': '', 'university': ''});
    });
  }

  void _removeEducation(int index) {
    setState(() {
      _educations.removeAt(index);
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
          ).createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          ),
          child: const Text(
            'Dashboard',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "EDIT PROFILE",
                    style: TextStyle(
                      color: Color(0xffE91407),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16.0),
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            width: 120,
                            height: 160,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://humic.telkomuniversity.ac.id/wp-content/uploads/2024/05/amilaa-1.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.edit_square,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffEBF9F1),
                          border: Border.all(color: const Color(0xffEBF9F1)),
                          borderRadius: BorderRadius.circular(22)),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 3, horizontal: 20),
                        child: Text(
                          'Aktif',
                          style: TextStyle(
                              color: Color(0xff1F9254),
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  EditItem(
                    title: "Nama Lengkap",
                    widget: TextFormField(
                      controller: _nameController,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Nama tidak boleh kosong';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelStyle:
                            const TextStyle(color: Colors.black, fontSize: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  EditItem(
                    title: "NIP",
                    widget: TextFormField(
                      controller: _nipController,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'NIP tidak boleh kosong';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelStyle:
                            const TextStyle(color: Colors.black, fontSize: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  EditItem(
                    title: "Fakultas",
                    widget: TextFormField(
                      controller: _facultyController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Fakultas tidak boleh kosong';
                        }
                        return null;
                      },
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        labelStyle:
                            const TextStyle(color: Colors.black, fontSize: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  EditItem(
                    title: "Program Studi",
                    widget: TextFormField(
                      controller: _programStudyController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Program Studi tidak boleh kosong';
                        }
                        return null;
                      },
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        labelStyle:
                            const TextStyle(color: Colors.black, fontSize: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  EditItem(
                    title: "Nomor Hp",
                    widget: TextFormField(
                      controller: _phoneNumberController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Nomor Telepon tidak boleh kosong';
                        }
                        return null;
                      },
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        labelStyle:
                            const TextStyle(color: Colors.black, fontSize: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  EditItem(
                    title: "Agama",
                    widget: DropdownButtonFormField<String>(
                      value: _selectedReligion,
                      items: _religionList.map((String religion) {
                        return DropdownMenuItem<String>(
                          value: religion,
                          child: Text(
                            religion,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedReligion = newValue;
                        });
                      },
                      decoration: InputDecoration(
                        labelStyle:
                            const TextStyle(color: Colors.black, fontSize: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  EditItem(
                    title: "Jenis Kelamin",
                    widget: DropdownButtonFormField<String>(
                      value: _selectedGender,
                      items: _genderList.map((String gender) {
                        return DropdownMenuItem<String>(
                          value: gender,
                          child: Text(
                            gender,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedGender = newValue;
                        });
                      },
                      decoration: InputDecoration(
                        labelStyle:
                            const TextStyle(color: Colors.black, fontSize: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  EditItem(
                    title: "Alamat Asal",
                    widget: TextFormField(
                      controller: _addressController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Alamat tidak boleh kosong';
                        }
                        return null;
                      },
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        labelStyle:
                            const TextStyle(color: Colors.black, fontSize: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  EditItem(
                    title: "Tanggal Lahir",
                    widget: TextFormField(
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
                          setState(() {
                            _dateOfBirthController.text =
                                "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
                          });
                        }
                      },
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        labelStyle:
                            const TextStyle(color: Colors.black, fontSize: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Riwayat Studi',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _educations.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: DropdownButtonFormField<String>(
                              value: _educations[index]['degree'],
                              items: _degreeOptions.map((String degree) {
                                return DropdownMenuItem<String>(
                                  value: degree,
                                  child: Text(
                                    degree,
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 12),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _educations[index]['degree'] = newValue!;
                                });
                              },
                              decoration: InputDecoration(
                                labelText: "Pendidikan",
                                labelStyle: const TextStyle(
                                    color: Colors.black, fontSize: 12),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            flex: 3,
                            child: TextFormField(
                              initialValue: _educations[index]['studyProgram'],
                              onChanged: (newValue) {
                                setState(() {
                                  _educations[index]['studyProgram'] = newValue;
                                });
                              },
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 12),
                              decoration: InputDecoration(
                                labelText: "Program Studi",
                                labelStyle: const TextStyle(
                                    color: Colors.black, fontSize: 12),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            flex: 3,
                            child: TextFormField(
                              initialValue: _educations[index]['university'],
                              onChanged: (newValue) {
                                setState(() {
                                  _educations[index]['university'] = newValue;
                                });
                              },
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 12),
                              decoration: InputDecoration(
                                labelText: "Universitas",
                                labelStyle: const TextStyle(
                                    color: Colors.black, fontSize: 12),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              _removeEducation(index);
                            },
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xff9E9E9E),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: IconButton(
                        onPressed: _addEducation, 
                        icon: const Icon(Icons.add),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 32),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      label: const Text(
                        'Edit',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff006AFF),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 150, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
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
