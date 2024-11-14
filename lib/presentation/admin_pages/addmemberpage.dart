import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:member_humic/presentation/admin_pages/bloc/addmember/addmember_bloc.dart';

class Addmemberpage extends StatefulWidget {
  const Addmemberpage({super.key});

  @override
  State<Addmemberpage> createState() => _AddmemberpageState();
}

class _AddmemberpageState extends State<Addmemberpage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController retypePasswordController = TextEditingController();
  final TextEditingController positionNameController = TextEditingController();
  int? selectedPosition;
  String? selectedBranch;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddmemberBloc, AddmemberState>(
      builder: (context, state) {
        return BlocListener<AddmemberBloc, AddmemberState>(
          listener: (context, state) {
            state.whenOrNull(
              success: () {
                nameController.clear();
                usernameController.clear();
                emailController.clear();
                passwordController.clear();
                retypePasswordController.clear();
                positionNameController.clear();
                setState(() {
                  selectedPosition = null;
                  selectedBranch = null;
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Member added successfully!')),
                );
              },
              error: (message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(message)),
                );
              },
            );
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
                    Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                child: const Text(
                  'Add Member',
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
                          buildInputField(
                            label: 'Nama Lengkap',
                            controller: nameController,
                            hintText: 'Input name',
                          ),
                          const SizedBox(height: 16),
                          buildDropdownField(
                            label: 'Cabang',
                            selectedValue: selectedBranch,
                            items: ['Bandung', 'Jakarta', 'Purwokerto', 'Surabaya'],
                            onChanged: (value) {
                              setState(() {
                                selectedBranch = value;
                              });
                            },
                          ),
                          const SizedBox(height: 16),
                          buildInputField(
                            label: 'Email',
                            controller: emailController,
                            hintText: 'Input email',
                          ),
                          const SizedBox(height: 16),
                          buildInputField(
                            label: 'Username',
                            controller: usernameController,
                            hintText: 'Input username',
                          ),
                          const SizedBox(height: 16),
                          buildDropdownField(
                            label: 'Posisi Display',
                            selectedValue: selectedPosition,
                            items: const [1, 2, 3],
                            onChanged: (value) {
                              setState(() {
                                selectedPosition = value;
                              });
                            },
                          ),
                          const SizedBox(height: 16),
                          buildInputField(
                            label: 'Jabatan',
                            controller: positionNameController,
                            hintText: 'Input Jabatan',
                          ),
                          const SizedBox(height: 16),
                          buildInputField(
                            label: 'Password',
                            controller: passwordController,
                            hintText: 'Input password',
                            obscureText: true,
                          ),
                          const SizedBox(height: 16),
                          buildInputField(
                            label: 'Retype Password',
                            controller: retypePasswordController,
                            hintText: 'Retype password',
                            obscureText: true,
                          ),
                          const SizedBox(height: 32),
                          SizedBox(
                            width: 300,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                context.read<AddmemberBloc>().add(AddmemberEvent.addMember(
                                  name: nameController.text,
                                  username: usernameController.text,
                                  email: emailController.text,
                                  branch: selectedBranch ?? 'Bandung',
                                  password: passwordController.text,
                                  retypePassword: retypePasswordController.text,
                                  position: selectedPosition ?? 1,
                                  position_name: positionNameController.text,
                                ));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff006AFF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                              child: const Text(
                                'Add Member',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
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
            ),
          ),
        );
      },
    );
  }

  Widget buildInputField({
    required String label,
    required TextEditingController controller,
    required String hintText,
    bool obscureText = false,
  }) {
    return BlocBuilder<AddmemberBloc, AddmemberState>(
      builder: (context, state) {
        String? fieldError;
        if (state is AddMemberError) {
          if (label == 'Nama Lengkap' && state.message.contains('Name')) {
            fieldError = state.message;
          } else if (label == 'Email' && state.message.contains('mail')) {
            fieldError = state.message;
          } else if (label == 'Username' && state.message.contains('Username')) {
            fieldError = state.message;
          } else if (label == 'Cabang' && state.message.contains('Cabang')) {
            fieldError = state.message;
          } else if (label == 'Password' && state.message.contains('Password') && !state.message.contains('match')) {
            fieldError = state.message;
          } else if (label == 'Retype Password' && state.message.contains('match')) {
            fieldError = state.message;
          } else if (label == 'Jabatan' && state.message.contains('Jabatan')) {
            fieldError = state.message;
          }
        }
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
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: 300,
              height: fieldError != null ? 70 : 50,
              child: TextField(
                controller: controller,
                obscureText: obscureText,
                style: const TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: const TextStyle(color: Color(0xffB9B9B9)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  errorText: fieldError,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                  errorStyle: const TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 1.0,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  
  Widget buildDropdownField<T>({
  required String label,
  required T? selectedValue,
  required List<T> items,
  required ValueChanged<T?> onChanged,
  }) {
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
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          width: 300,
          height: 50,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(12.0), 
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<T>(
                value: selectedValue,
                items: items.map((T item) {
                  return DropdownMenuItem<T>(
                    value: item,
                    child: Text(item.toString(),
                        style: const TextStyle(fontSize: 16)),
                  );
                }).toList(),
                onChanged: onChanged,
                isExpanded: true,
                hint: Text(
                  'Select $label',
                  style: const TextStyle(
                    color: Color(0xffB9B9B9),
                  ),
                ),
                icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
                dropdownColor: Colors.white, 
              ),
            ),
          ),
        ),
      ],
    );
  }
}
