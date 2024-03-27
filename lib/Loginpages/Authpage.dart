import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:techinzoapp/Screens/HomePage.dart';
import 'package:techinzoapp/Loginpages/login_register.dart';




class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is logged in
          if (snapshot.hasData) {
            return HomePage();
          }

          // user is NOT logged in
          else {
            return LoginorRegister();
          }
        },
      ),
    );
  }
}