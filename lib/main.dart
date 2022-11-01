import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:groupie/helper/helper_function.dart';
import 'package:groupie/pages/auth/login_page.dart';
import 'package:groupie/pages/home_page.dart';
import 'package:groupie/shared/constants.dart';

void main() async {
  // initialise all widgets
  WidgetsFlutterBinding.ensureInitialized();

  // check if current platform is web
  if (kIsWeb) {
    // initialise Firebase for IOS, Android
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: Constants.apiKey,
            appId: Constants.appId,
            messagingSenderId: Constants.messagingSenderId,
            projectId: Constants.projectId));
  } else {
    // initialise Firebase for Web
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSignedIn = false; // init signed in key value to false

  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() async {
    await HelperFunctions.getUserLoggedInStatus().then((value) {
      // value is either true or false but not null
      if (value != null) {
        _isSignedIn = value; // set to true or false
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Constants().primaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: _isSignedIn
          ? const HomePage()
          : const LoginPage(), // if signedin display homepage else render login page
    );
  }
}
