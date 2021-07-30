import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testapp/utilities/constants.dart';
import 'package:testapp/widgets/SignForm.dart';

import '../MainScreen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  void _handleSubmit(email, password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (context, animation, anotherAnimation) => MainScreen(),
          transitionDuration: Duration(milliseconds: 2000),
          transitionsBuilder: (context, animation, anotherAnimation, child) =>
              FadeInRight(child: child),
        ),
      );
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlue,
      body: SignForm(signType: SignType.SignUp, handleSumbit: _handleSubmit),
    );
  }
}
