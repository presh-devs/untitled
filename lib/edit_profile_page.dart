import 'package:flutter/material.dart';
import 'package:untitled/constants.dart';

import 'api_service.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _newpasswwordController = TextEditingController();
  final _currentpasswwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _userNameController = TextEditingController();
  final _nameController = TextEditingController();
  final _numberController = TextEditingController();
  final _genderController = TextEditingController();

  Future<void> updateData() async {
    await ApiService().updateUserData(
      username: _userNameController.text,
      newPassword: _newpasswwordController.text,
      currentPassword: _currentpasswwordController.text,
      email: _emailController.text,
      phoneNumber: _numberController.text,
      gender: _genderController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
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
                      height: 100,
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
                    const SizedBox(
                      height: 15,
                    ),
                    buildTextField(
                        controller: _userNameController, label: 'Username'),
                    const SizedBox(
                      height: 15,
                    ),
                    buildTextField(controller: _nameController, label: 'Name'),
                    const SizedBox(
                      height: 15,
                    ),
                    buildTextField(
                        controller: _emailController, label: 'Email'),
                    const SizedBox(
                      height: 15,
                    ),
                    buildTextField(
                        controller: _numberController, label: 'Phone Number'),
                    const SizedBox(
                      height: 15,
                    ),
                    buildTextField(
                        controller: _newpasswwordController,
                        label: 'New Password'),
                    const SizedBox(
                      height: 15,
                    ),
                    buildTextField(
                        controller: _currentpasswwordController,
                        label: 'Current Password'),
                    const SizedBox(
                      height: 15,
                    ),
                    buildTextField(
                        controller: _genderController, label: 'Gender'),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: kPrimaryColor,
                        side: const BorderSide(color: kPrimaryColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      onPressed: updateData,
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
