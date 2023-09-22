// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'password_field.dart';
import 'email_field.dart';
import 'my_button.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isVisible = false;
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void signIn() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      Get.until((route) => route.isFirst);

      if (e.code == 'user-not-found') {
        wrongEmailMessage();
      } else if (e.code == 'wrong-password') {
        wrongPasswordMessage();
      }
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              'Incorrect Email',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              'Incorrect Password',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) => Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    EmailField(
                      controller: emailController,
                    ),
                    // TextField(
                    //   controller: emailController,
                    //   textInputAction: TextInputAction.next,
                    //   obscureText: false,
                    //   cursorColor: Colors.white,
                    //   decoration: InputDecoration(
                    //       enabledBorder: const OutlineInputBorder(
                    //         borderSide: BorderSide(color: Colors.white),
                    //       ),
                    //       focusedBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(color: Colors.grey.shade400),
                    //       ),
                    //       fillColor: Colors.grey.shade200,
                    //       filled: true,
                    //       hintText: 'Email',
                    //       hintStyle: TextStyle(color: Colors.grey[500])),
                    // ),

                    Visibility(
                      visible: isVisible,
                      child: Column(
                        children: [
                          const SizedBox(height: 10),

                          PasswordField(
                            controller: passwordController,
                          ),
                          // TextField(
                          //   controller: passwordController,
                          //   obscureText: true,
                          //   textInputAction: TextInputAction.done,
                          //   cursorColor: Colors.white,
                          //   decoration: InputDecoration(
                          //       enabledBorder: const OutlineInputBorder(
                          //         borderSide: BorderSide(color: Colors.white),
                          //       ),
                          //       focusedBorder: OutlineInputBorder(
                          //         borderSide:
                          //             BorderSide(color: Colors.grey.shade400),
                          //       ),
                          //       fillColor: Colors.grey.shade200,
                          //       filled: true,
                          //       hintText: 'Password',
                          //       hintStyle: TextStyle(color: Colors.grey[500])),
                          // ),
                        ],
                      ),
                    ),
                    isLoading
                        ? const CircularProgressIndicator()
                        : const SizedBox.shrink(),
                    const SizedBox(height: 10),

                    // forgot password?
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.end,
                    //     children: [
                    //       Text(
                    //         'Forgot Password?',
                    //         style: TextStyle(color: Colors.grey[600]),
                    //       ),
                    //     ],
                    //   ),
                    // ),

                    const SizedBox(height: 15),

                    MyButton(
                      onTap: () {
                        // final form = formKey.currentState!;
                        // if (form.validate()) {
                        //   final email = emailController.text;

                        setState(() {
                          isVisible = true;
                        });
                        signIn();

                        // ScaffoldMessenger.of(context)
                        //   ..removeCurrentSnackBar()
                        //   ..showSnackBar(
                        //       SnackBar(content: Text('Signed in as $email')));
                        // }
                      },
                      label: isVisible ? 'Sign In' : 'Next',
                    )
                  ])),
        ),
      );
}
