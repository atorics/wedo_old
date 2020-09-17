import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wedo/dashboard.dart';
import 'package:wedo/shared/services/firebase_auth.dart';
import 'package:wedo/ui/login.dart';
import 'package:wedo/ui/splash.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      //initialData: Firebase.initializeApp(),
      stream: AuthProvider().authStateChanges(),
      builder: (context, AsyncSnapshot<User> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Splash();
        }

        if (!snapshot.hasData || snapshot == null) {
          return Login();
        }

        return Dashboard();
      },
    );
  }
}
