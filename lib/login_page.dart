import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/api_service.dart';
import 'package:untitled/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'edit_profile_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  Future<void> login() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      var response = await ApiService().login(
        username: emailController.text,
        password: passwordController.text,
      );
      // print(ApiService().token);
      if (response != null) {
        if (response.apiStatus == 200) {
          print('here');
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => EditProfile(
                    token: response.accessToken!,
                  )));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Invalid credentials '),
          ));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Invalid credentials '),
        ));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Blank Field not allowed'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          textDirection: TextDirection.ltr,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(alignment: AlignmentDirectional.topStart, children: [
              ClipPath(
                clipper: CustomClipPath(),
                child: Container(
                  color: Color(0xffEBF0FF),
                  height: 400,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 125),
                          const Text(
                            'Welcome to',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 125),
                          Text(
                            'RAKTAPP',
                            style: GoogleFonts.rubik(
                              fontSize: 52,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 45,
                      ),
                      Center(
                        child: const Text(
                          ' Sign in to continue',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 22.0, right: 22, top: 320, bottom: 22),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 26),
                        child: buildTextField(
                          controller: emailController,
                          label: 'Username/Email',
                          icon: SvgPicture.asset(
                            'assets/images/username.svg',
                            height: 10,
                            width: 10,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 26),
                        child: buildTextField(
                          controller: passwordController,
                          label: 'Password',
                          icon: SvgPicture.asset(
                            'assets/images/Lock.svg',
                            height: 16,
                            width: 16,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: login,
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          side: const BorderSide(color: Colors.yellow),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                        ),
                        child: const Text(
                          'Sign in',
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 1,
                            width: 150,
                            color: kAccentColor,
                          ),
                          const Text(
                            '    OR    ',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: kPrimaryColor,
                            ),
                          ),
                          Container(
                            height: 1,
                            width: 150,
                            color: kAccentColor,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      buildSocialLoginButton(
                        icon: 'assets/images/Group.svg',
                        title: 'Login with Google',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      buildSocialLoginButton(
                        icon: 'assets/images/Frame.svg',
                        title: 'Login with Facebook',
                      ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account?",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff9098B1),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Sign up',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: kPrimaryColor,
                              ),
                            ),
                          ),
                        ],
                      )
                    ]),
              ),
            ]),
          ],
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
              (30),
            ),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kAccentColor),
          borderRadius: BorderRadius.all(
            Radius.circular(
              (30),
            ),
          ),
        ),
        prefixIcon: icon,
        hintText: label,
      ),
    );
  }

  ElevatedButton buildSocialLoginButton(
      {required String title, required String icon}) {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: const Color(
            0xffEBF0FF,
            // linear-gradient(0deg, #EBF0FF, #EBF0FF);
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
        child: ListTile(
          leading: SvgPicture.asset(icon),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: kPrimaryColor,
            ),
          ),
        ));
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    Path path0 = Path();
    path0.moveTo(size.width*0.0037500,size.height*0.0060000);
    path0.lineTo(size.width*0.0025000,size.height*0.9860000);
    path0.quadraticBezierTo(size.width*0.0871750,size.height*0.7344800,size.width*0.2375000,size.height*0.6980000);
    path0.cubicTo(size.width*0.3640969,size.height*0.6975550,size.width*0.6172906,size.height*0.6966650,size.width*0.7438875,size.height*0.6962200);
    path0.quadraticBezierTo(size.width*0.9373000,size.height*0.6663600,size.width*0.9958375,size.height*0.4968800);
    path0.lineTo(size.width*0.9950000,size.height*0.0080000);
    path0.lineTo(size.width*0.0037500,size.height*0.0060000);
    path0.close();


    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

// Path path0 = Path();
// path0.moveTo(size.width * 0.0012500, size.height * 0.0080000);
// path0.lineTo(size.width * 0.0037500, size.height * 0.9860000);
// path0.quadraticBezierTo(size.width * 0.1079250, size.height * 0.6927000,
// size.width * 0.2513375, size.height * 0.7029800);
// path0.cubicTo(
// size.width * 0.3760375,
// size.height * 0.7028400,
// size.width * 0.6243969,
// size.height * 0.6992450,
// size.width * 0.7487500,
// size.height * 0.6980000);
// path0.quadraticBezierTo(size.width * 0.9754250, size.height * 0.6779600,
// size.width * 0.9950000, size.height * 0.4580000);
// path0.lineTo(size.width * 0.9962500, size.height * 0.0060000);
// path0.lineTo(size.width * 0.0012500, size.height * 0.0080000);
// path0.close();
