import 'package:flutter/material.dart';
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
      await ApiService().login(
        username: emailController.text,
        password: passwordController.text,
      );
      print(ApiService().token);
      if (ApiService().token != null) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const EditProfile()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Invalid Credentials'),
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
            ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                color: kAccentColor,
                height: 400,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Welcome to',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      'RAKTAPP',
                      style: TextStyle(
                        fontSize: 52,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Sign in to continue',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Column(children: [
                buildTextField(
                  controller: emailController,
                  label: 'Username/Email',
                  icon: SvgPicture.asset('assets/images/username.svg'),
                ),
                const SizedBox(
                  height: 10,
                ),
                buildTextField(
                  controller: passwordController,
                  label: 'Password',
                  icon: SvgPicture.asset('assets/images/Lock.svg'),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 1,
                      width: 150,
                      color: Colors.black,
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
                      color: Colors.black,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                buildSocialLoginButton(
                  icon: 'assets/images/Frame',
                  title: 'Login with Google',
                ),
                const SizedBox(
                  height: 20,
                ),
                buildSocialLoginButton(
                  icon: 'assets/images/Frame',
                  title: 'Login with Facebook',
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Forgot Password?'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: kAccentColor,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Sign up',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ],
                )
              ]),
            ),
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
          title: Text(title),
        ));
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    Path path0 = Path();
    path0.moveTo(size.width * 0.0012500, size.height * 0.0080000);
    path0.lineTo(size.width * 0.0037500, size.height * 0.9860000);
    path0.quadraticBezierTo(size.width * 0.1079250, size.height * 0.6927000,
        size.width * 0.2513375, size.height * 0.7029800);
    path0.cubicTo(
        size.width * 0.3760375,
        size.height * 0.7028400,
        size.width * 0.6243969,
        size.height * 0.6992450,
        size.width * 0.7487500,
        size.height * 0.6980000);
    path0.quadraticBezierTo(size.width * 0.9754250, size.height * 0.6779600,
        size.width * 0.9950000, size.height * 0.4580000);
    path0.lineTo(size.width * 0.9962500, size.height * 0.0060000);
    path0.lineTo(size.width * 0.0012500, size.height * 0.0080000);
    path0.close();

    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
// class RPSCustomPainter extends CustomPainter{
//
//   @override
//   void paint(Canvas canvas, Size size) {
//
//
//
//     Paint paint0 = Paint()
//       ..color = const Color.fromARGB(255, 33, 150, 243)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 1;
//
//
//     Path path0 = Path();
//     path0.moveTo(size.width*0.0012500,size.height*0.0080000);
//     path0.lineTo(size.width*0.0037500,size.height*0.9860000);
//     path0.quadraticBezierTo(size.width*0.1079250,size.height*0.6927000,size.width*0.2513375,size.height*0.7029800);
//     path0.cubicTo(size.width*0.3760375,size.height*0.7028400,size.width*0.6243969,size.height*0.6992450,size.width*0.7487500,size.height*0.6980000);
//     path0.quadraticBezierTo(size.width*0.9754250,size.height*0.6779600,size.width*0.9950000,size.height*0.4580000);
//     path0.lineTo(size.width*0.9962500,size.height*0.0060000);
//     path0.lineTo(size.width*0.0012500,size.height*0.0080000);
//     path0.close();
//
//     canvas.drawPath(path0, paint0);
//
//
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
//
// }
