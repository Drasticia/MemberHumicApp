import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:member_humic/data/datasources/auth_local_datasource.dart';
import 'package:member_humic/models/lmember.dart';
import 'package:member_humic/models/member.dart';
import 'package:member_humic/presentation/admin_pages/widget/adminnavbar.dart';
import 'package:member_humic/presentation/auth/bloc/login/login_bloc.dart';
import 'package:member_humic/presentation/member_pages/widgets/membernavbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 40.0),
                      child: Text(
                        'Welcome to the\nHUMIC Engineering Member Portal!',
                        style: TextStyle(
                          color: Color(0xffB3261E),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 300,
                            height: 50,
                            child: TextFormField(
                              controller: _usernameController,
                              decoration: InputDecoration(
                                labelText: 'Username',
                                labelStyle:
                                    const TextStyle(color: Colors.black),
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
                          const SizedBox(height: 16),
                          SizedBox(
                            width: 300,
                            height: 50,
                            child: TextFormField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                hintText: 'at least 8 characters',
                                labelStyle:
                                    const TextStyle(color: Colors.black),
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
                              obscureText: true,
                            ),
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            width: 300,
                            height: 40,
                            child: BlocListener<LoginBloc, LoginState>(
                              listener: (context, state) {
                                state.maybeWhen(
                                  orElse: () {},
                                  success: (authResponseModel) {
                                    AuthLocalDatasource().saveAuthData(authResponseModel);
                                    if (_usernameController.text == 'adminuser') {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const Adminnavbar(),
                                        ),
                                      );
                                    } else {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const Membernavbar(),
                                        ),
                                      );
                                    }
                                  },
                                  error: (message) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(message),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  },
                                );
                              },

                              child: BlocBuilder<LoginBloc, LoginState>(
                                builder: (context, state) {
                                  return state.maybeWhen(
                                    orElse: () {
                                      return ElevatedButton(
                                        onPressed: () {
                                          context.read<LoginBloc>().add(
                                              LoginEvent.login(
                                                username: _usernameController.text,
                                                password: _passwordController.text,
                                              ));
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color(0xff006AFF),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12.0),
                                          ),
                                        ),
                                        child: const Text(
                                          'Login',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      );
                                    },
                                    loading: () {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: Center(
                child: SizedBox(
                  width: 500,
                  height: 320,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: 15,
                        left: 150,
                        child: CircleAvatar(
                          backgroundImage:
                              NetworkImage(teamMembers[1].imagePath),
                          radius: 50,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 30,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(timMember[4].imagePath),
                          radius: 50,
                        ),
                      ),
                      Positioned(
                        top: 180,
                        left: 55,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(timMember[3].imagePath),
                          radius: 50,
                        ),
                      ),
                      Positioned(
                        top: 110,
                        right: 30,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(timMember[2].imagePath),
                          radius: 50,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 135,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(timMember[1].imagePath),
                          radius: 50,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 30,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(timMember[0].imagePath),
                          radius: 50,
                        ),
                      ),
                      Positioned(
                        top: 95,
                        left: 140,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 4,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: CircleAvatar(
                            backgroundImage:
                                NetworkImage(teamMembers[0].imagePath),
                            radius: 60,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 60,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff800C05), Color(0xffE91407)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: const Center(
                child: Text(
                  'HUMIC Research Center',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
