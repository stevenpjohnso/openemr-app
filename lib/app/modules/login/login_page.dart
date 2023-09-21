import 'package:get/get.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:openemr/util/auth.dart';
import 'package:openemr/util/login.dart';
import '../../../../util/square_tile.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;
  bool isVisible = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // sign user in method
  Future<void> signIn() async {
    // show loading circle
    setState(() {
      isLoading = true;
    });

    // try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      // Handle errors
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
    Get.toNamed('/home');
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),

                // logo
                Image.asset(
                  'assets/logo.png',
                  height: 100,
                ),

                const SizedBox(height: 50),

                // welcome back, you've been missed!
                Text(
                  'hello'.tr,
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 24,
                      fontWeight: FontWeight.w300),
                ),

                const SizedBox(height: 25),
                Login(),
                // Loading indicator
                isLoading
                    ? const CircularProgressIndicator()
                    : const SizedBox.shrink(), // Hide if not loading
                const SizedBox(height: 25),

                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 50),

                // google + apple sign in buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // google button
                    TextButton(
                      onPressed: () {
                        signInWithGoogle();
                        const AuthPage();
                      },
                      child: const SquareTile(imagePath: 'assets/img/G.png'),
                    ),

                    const SizedBox(width: 25),

                    // apple button
                    TextButton(
                      onPressed: () {
                        const AuthPage();
                      },
                      child: const SquareTile(imagePath: 'assets/img/A.png'),
                    ),
                  ],
                ),

                // const SizedBox(height: 50),

                // not a member? register now
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       'Not a member?',
                //       style: TextStyle(color: Colors.grey[700]),
                //     ),
                //     const SizedBox(width: 4),
                //     const Text(
                //       'Register now',
                //       style: TextStyle(
                //         color: Colors.blue,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
