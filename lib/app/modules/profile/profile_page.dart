// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:openemr/theme/theme_service.dart';
import '../../../util/constants.dart';
import '../../../usr/cstm/edit_email.dart';
import '../../../usr/cstm/edit_id.dart';
import '../../../usr/cstm/edit_image.dart';
import '../../../usr/cstm/edit_name.dart';
import '../../../usr/cstm/edit_phone.dart';
import '../../../usr/user_data.dart';
import '../../../util/profile_pic.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserData.myUser;
    return Scaffold(
      appBar: AppBar(
        leading: backButton,
        backgroundColor: appBarColor,
        elevation: appBarElevation,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const Center(
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ))),
          InkWell(
              onTap: () {
                navigateIDPage(const EditImagePage());
              },
              child: DisplayImage(
                imagePath: user.image,
                onPressed: () {},
              )),
          buildUserInfoDisplay(user.name, 'Name', const EditNameFormPage()),
          buildUserInfoDisplay(user.phone, 'Phone', const EditPhoneFormPage()),
          buildUserInfoDisplay(user.email, 'Email', const EditEmailFormPage()),
          buildUserInfoDisplay(user.id, 'ID', const EditIDFormPage()),
          const SizedBox(
            height: 20,
          ),
          IconButton(
              icon: Icon(ThemeService().isSavedDarkMode()
                  ? Icons.nightlight_round
                  : Icons.wb_sunny),
              onPressed: () {
                ThemeService().changeThemeMode();
              }),
          IconButton(
              onPressed: () async {
                await GoogleSignIn().signOut();
                await FirebaseAuth.instance.signOut();
                Get.toNamed('/login');
              },
              icon: const Icon(Icons.logout)),
        ]),
      ),
    );
  }

  Widget buildUserInfoDisplay(String getValue, String title, Widget editPage) =>
      Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              Container(
                  width: 350,
                  height: 40,
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ))),
                  child: Row(children: [
                    Expanded(
                        child: TextButton(
                            onPressed: () {
                              navigateIDPage(editPage);
                            },
                            child: Text(
                              getValue,
                              style: const TextStyle(fontSize: 16, height: 1.4),
                            ))),
                    const Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.grey,
                      size: 40.0,
                    )
                  ]))
            ],
          ));

  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  void navigateIDPage(Widget editForm) {
    Route route = MaterialPageRoute(builder: (context) => editForm);
    Navigator.push(context, route).then(onGoBack);
  }
}
