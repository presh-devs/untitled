import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:untitled/constants.dart';

import 'api_service.dart';

class EditProfile extends StatefulWidget {
  final String token;
  const EditProfile({Key? key, required this.token}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _newPasswordController = TextEditingController();
  final _currentPasswordController = TextEditingController();
  final _emailController = TextEditingController();
  final _userNameController = TextEditingController();
  final _nameController = TextEditingController();
  final _numberController = TextEditingController();
  final _genderController = TextEditingController();

  Future<void> updateData(String token) async {
    await ApiService().updateUserData(
      token: token,
      username: _userNameController.text,
      newPassword: _newPasswordController.text,
      currentPassword: _currentPasswordController.text,
      email: _emailController.text,
      phoneNumber: _numberController.text,
      gender: _genderController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: kAccentColor,
                      height: height * 0.1,
                      width: double.infinity,
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: const CircleAvatar(
                            radius: 40,
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'MrNiB',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: kPrimaryColor,
                                  ),
                                ),
                                Text(
                                  'Profile Setting',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w400,
                                    color: kPrimaryColor,
                                  ),
                                ),
                              ],
                            )),
                      ]),
                    ),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    buildTextField(
                        controller: _userNameController, label: 'Username'),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    buildTextField(controller: _nameController, label: 'Name'),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    buildTextField(
                        controller: _emailController, label: 'Email'),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    buildTextField(
                        controller: _numberController, label: 'Phone Number'),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    buildTextField(
                        controller: _newPasswordController,
                        label: 'New Password'),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    buildTextField(
                        controller: _currentPasswordController,
                        label: 'Current Password'),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    buildTextField(
                        controller: _genderController, label: 'Gender'),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: kPrimaryColor,
                        side: const BorderSide(color: kPrimaryColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      onPressed: () {
                        updateData(widget.token);
                        if (_newPasswordController.text.isNotEmpty &&
                            _currentPasswordController.text.isNotEmpty &&
                            _emailController.text.isNotEmpty &&
                            _userNameController.text.isNotEmpty &&
                            _numberController.text.isNotEmpty &&
                            _genderController.text.isNotEmpty) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Update Successful'),
                          ));
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Empty Fields not allowed'),
                          ));
                        }
                      },
                      child: const Text('Save'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextField buildTextField({
    required TextEditingController controller,
    required String label,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kAccentColor),
          borderRadius: BorderRadius.all(
            Radius.circular(
              (18),
            ),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kAccentColor),
          borderRadius: BorderRadius.all(
            Radius.circular(
              (18),
            ),
          ),
        ),
        hintText: label,
        labelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: kAccentColor,
        ),
      ),
    );
  }
}
