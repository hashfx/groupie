import 'package:flutter/material.dart';
import 'package:groupie/service/auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthService authService = AuthService();// init auth service
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(child: Text("LOGOUT"), onPressed: (){
          authService.signOut();
        },),
      ),
    );
  }
}
