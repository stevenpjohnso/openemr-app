import 'package:flutter/material.dart';
import '../../util/constants.dart';
import '../user_data.dart';

class EditIDFormPage extends StatefulWidget {
  const EditIDFormPage({Key? key}) : super(key: key);

  @override
  EditIDFormPageState createState() {
    return EditIDFormPageState();
  }
}

class EditIDFormPageState extends State<EditIDFormPage> {
  final _formKey = GlobalKey<FormState>();
  final idController = TextEditingController();
  var user = UserData.myUser;

  @override
  void dispose() {
    idController.dispose();
    super.dispose();
  }

  void updateUserValue(String id) {
    user.id = id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: backButton,
          backgroundColor: appBarColor,
          elevation: appBarElevation,
        ),
        body: Form(
          key: _formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                    width: 320,
                    child: Text(
                      "Update your ID",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    )),
                Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: SizedBox(
                        height: 100,
                        width: 320,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your id.';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              labelText: 'Your id address'),
                          controller: idController,
                        ))),
                Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: 320,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                            },
                            child: const Text(
                              'Update',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        )))
              ]),
        ));
  }
}
