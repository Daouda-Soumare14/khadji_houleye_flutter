import 'package:email_validator_flutter/email_validator_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

import '../controllers/user_controller.dart';
import 'user_info.dart';

class MyBody extends StatefulWidget {
  const MyBody({super.key});

  @override
  State<MyBody> createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  final _nameController = TextEditingController();
  final _prenomController = TextEditingController();
  final _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final _userController = Get.put(UserController());

  @override
  void dispose() {
    _nameController.dispose();
    _prenomController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "name required";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    hintText: "saisir name ",
                    label: Text("Nom"),
                    border: OutlineInputBorder()),
              ),
              TextFormField(
                controller: _prenomController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "prenom required";
                  }
                  return null;
                },
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              TextFormField(
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "email required";
                  }
                  if (!EmailValidatorFlutter().validateEmail(value)) {
                    return "email non valide";
                  }
                  return null;
                },
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _userController.updateUser(
                          newName: _nameController.text,
                          newPrenom: _prenomController.text,
                          newEmail: _emailController.text);

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => UserInfo()));
                    }
                  },
                  child: Text("Envoyer"))
            ],
          )),
    );
  }
}
