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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: kAccentColor,
                    height: 100,
                    width: double.infinity,
                    child: Row(children: [
                      const CircleAvatar(
                        radius: 40,
                      ),
                      Column(
                        children: const [
                          Text(
                            'MrNiB',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
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
                      )
                    ]),
                  ),
                  const Text(
                    'Username',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: kPrimaryColor,
                    ),
                  ),
                  buildTextField(
                      icon: const Text(''),
                      controller: _userNameController,
                      label: ''),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Name',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: kPrimaryColor,
                    ),
                  ),
                  buildTextField(
                      icon: const Text(''),
                      controller: _nameController,
                      label: ''),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: kPrimaryColor,
                    ),
                  ),
                  buildTextField(
                      icon: const Text(''),
                      controller: _emailController,
                      label: ''),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Phone Number',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: kPrimaryColor,
                    ),
                  ),
                  buildTextField(
                      icon: const Text(''),
                      controller: _numberController,
                      label: ''),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'New Password',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: kPrimaryColor,
                    ),
                  ),
                  buildTextField(
                      icon: const Text(''),
                      controller: _newpasswwordController,
                      label: ''),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Phone Number',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: kPrimaryColor,
                    ),
                  ),
                  buildTextField(
                      icon: const Text(''),
                      controller: _currentpasswwordController,
                      label: ''),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Gender',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: kPrimaryColor,
                    ),
                  ),
                  buildTextField(
                      icon: const Text(''),
                      controller: _genderController,
                      label: ''),
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
    );
  }

  TextField buildTextField(
      {required TextEditingController controller,
      required String label,
      required Widget icon}) {
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
        prefixIcon: icon,
        hintText: label,
      ),
    );
  }
}
