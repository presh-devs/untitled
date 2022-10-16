import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme:GoogleFonts.latoTextTheme(Theme.of(context).textTheme,),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return LoginPage();
  }
}

//
// bottomNavigationBar: ClipRRect(
// borderRadius: BorderRadius.all(
// Radius.circular(10),
// ),
// child: BottomNavigationBar(
// elevation: 1,
// showUnselectedLabels: false,
// showSelectedLabels: false,
// backgroundColor: Colors.blue, //TOD0: change color
//
// items: [
// BottomNavigationBarItem(
// icon: Icon(Icons.close), // TODO: change icon
// label: 'Home',
// ),
// BottomNavigationBarItem(
// label: 'Chat',
// icon: Icon(Icons.close),
// ), // TODO: change icon),
// BottomNavigationBarItem(
// label: 'Home',
// icon: Icon(Icons.close),
// ), // TODO: change icon),
// BottomNavigationBarItem(
// label: 'Home',
// icon: Icon(Icons.close),
// ), // TODO: change icon),
// BottomNavigationBarItem(
// label: 'Home',
// icon: Icon(Icons.close),
// ), // TODO: change icon),
// ],
// ),
// ),
