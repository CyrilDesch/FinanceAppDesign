import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testapp/screens/MainScreen.dart';
import 'package:testapp/utilities/constants.dart';
import 'package:testapp/widgets/SignForm.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  void _handleSubmit(email, password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
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
      body: SignForm(signType: SignType.SignIn, handleSumbit: _handleSubmit),
    );
  }
}
