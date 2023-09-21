import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:openemr/util/auth.dart';
import 'email_field.dart';

// ignore: use_key_in_widget_constructors
class Login extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
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

  @override
  Widget build(BuildContext context) => Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // email textfield
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

                          // password textfield
                          TextField(
                            controller: passwordController,
                            obscureText: true,
                            textInputAction: TextInputAction.done,
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade400),
                                ),
                                fillColor: Colors.grey.shade200,
                                filled: true,
                                hintText: 'Password',
                                hintStyle: TextStyle(color: Colors.grey[500])),
                          ),
                        ],
                      ),
                    ),
                    // Loading indicator
                    isLoading
                        ? const CircularProgressIndicator()
                        : const SizedBox.shrink(), // Hide if not loading
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

                    const SizedBox(height: 25),

                    // sign in button
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        final form = formKey.currentState!;
                        if (form.validate()) {
                          final email = emailController.text;

                          ScaffoldMessenger.of(context)
                            ..removeCurrentSnackBar()
                            ..showSnackBar(
                                SnackBar(content: Text('Signed in as $email')));
                        }
                      },
                      child: const Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Colors.white, // Set the text color to white
                        ),
                      ),
                    )

                    // MyButton(
                    //     // onTap: signIn,
                    //     onTap: () {
                    //   // setState(() {
                    //   //   isVisible = true;
                    //   // });
                    //   signIn();
                    // }),
                  ])),
        ),
      );

  // sign user in method
  Future signIn() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    // try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      // Handle errors
      Get.until((route) => route.isFirst);

      if (e.code == 'user-not-found') {
        // Show error to user
        wrongEmailMessage();
      } else if (e.code == 'wrong-password') {
        // Show error to user
        wrongPasswordMessage();
      }
    } finally {
      // Pop the loading circle (whether login succeeded or failed)
      setState(() {
        isLoading = false;
      });
    }
    const AuthPage();
  }

  // wrong email message popup
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

  // wrong password message popup
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
}
