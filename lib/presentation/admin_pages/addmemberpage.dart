import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:member_humic/data/datasources/user_remote_datasource.dart';
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

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddmemberBloc, AddmemberState>(
        listener: (context, state) {
          if (state is AddMemberSuccess) {
            nameController.clear();
            usernameController.clear();
            emailController.clear();
            passwordController.clear();
            retypePasswordController.clear();

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Member added successfully!')),
            );
          } else if (state is AddMemberError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
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
              ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
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
                        // Field Input untuk Nama Lengkap
                        buildInputField(
                          label: 'Nama Lengkap',
                          controller: nameController,
                          hintText: 'input name',
                        ),
                        const SizedBox(height: 16),

                        // Field Input untuk Email
                        buildInputField(
                          label: 'Email',
                          controller: emailController,
                          hintText: 'input email',
                        ),
                        const SizedBox(height: 16),

                        // Field Input untuk Username
                        buildInputField(
                          label: 'Username',
                          controller: usernameController,
                          hintText: 'input username',
                        ),
                        const SizedBox(height: 16),

                        // Field Input untuk Password
                        buildInputField(
                          label: 'Password',
                          controller: passwordController,
                          hintText: 'input password',
                          obscureText: true,
                        ),
                        const SizedBox(height: 16),

                        // Field Input untuk Retype Password
                        buildInputField(
                          label: 'Retype Password',
                          controller: retypePasswordController,
                          hintText: 'retype password',
                          obscureText: true,
                        ),
                        const SizedBox(height: 32),

                        // Tombol Add Member
                        SizedBox(
                          width: 300,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              // Trigger event AddMember saat tombol ditekan
                              context.read<AddmemberBloc>().add(AddmemberEvent.addMember(
                                name: nameController.text,
                                username: usernameController.text,
                                email: emailController.text,
                                branch: 'Default Branch', // Sesuaikan jika ada input untuk branch
                                password: passwordController.text,
                                retypePassword: retypePasswordController.text,
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
  }

  Widget buildInputField({
    required String label,
    required TextEditingController controller,
    required String hintText,
    bool obscureText = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            label,
            style: const TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          width: 300,
          height: 50,
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
            ),
          ),
        ),
      ],
    );
  }
}
