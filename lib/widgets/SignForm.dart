import 'package:flutter/material.dart';
import 'package:testapp/screens/Auth/SigninScreen.dart';
import 'package:testapp/screens/Auth/SignupScreen.dart';
import 'package:testapp/utilities/constants.dart';
import 'package:animate_do/animate_do.dart';

class SignForm extends StatefulWidget {
  final SignType signType;
  final Function(String, String) handleSumbit;

  const SignForm({Key? key, required this.signType, required this.handleSumbit})
      : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String _email = '', _password = '';

  bool _obscureText = true;

  _handleSubmit() {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      widget.handleSumbit(_email, _password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlue,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowGlow();
            return true;
          },
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(height: 70),
                    FadeInUp(
                      delay: Duration(milliseconds: 500),
                      duration: Duration(milliseconds: 800),
                      from: 10,
                      child: Image(
                        image: AssetImage('assets/icon.png'),
                        width: 90,
                      ),
                    ),
                    SizedBox(height: 70),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          FadeInUp(
                            delay: Duration(milliseconds: 1000),
                            duration: Duration(milliseconds: 800),
                            from: 10,
                            child: Container(
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 2,
                                    blurRadius: 6,
                                    offset: Offset(
                                        0, 4), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(25, 20, 25, 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Email Address',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                        color: gray,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                    TextFormField(
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                      validator: (input) => input != null &&
                                              input.contains('@') &&
                                              input.contains('.') &&
                                              input.length > 6
                                          ? null
                                          : 'Email incorrect',
                                      onSaved: (input) => input != null
                                          ? _email = input
                                          : _email = '',
                                      decoration: InputDecoration(
                                        isDense: true,
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 3, 8, 0),
                                          child: Icon(
                                            Icons.mail_outline_rounded,
                                            size: 22,
                                            color: gray,
                                          ),
                                        ),
                                        prefixIconConstraints:
                                            BoxConstraints(minWidth: 20),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          FadeInUp(
                            delay: Duration(milliseconds: 1500),
                            duration: Duration(milliseconds: 800),
                            from: 10,
                            child: Container(
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 2,
                                    blurRadius: 6,
                                    offset: Offset(
                                        0, 4), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(25, 20, 25, 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 3),
                                      child: Text(
                                        'Password',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          color: gray,
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                            validator: (input) => input !=
                                                        null &&
                                                    input.length >= 6
                                                ? null
                                                : 'Mot de passe trop faible',
                                            obscureText: _obscureText,
                                            onSaved: (input) => input != null
                                                ? _password = input
                                                : _password = '',
                                            decoration: InputDecoration(
                                              isDense: true,
                                              prefixIcon: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 6),
                                                child: Icon(
                                                  Icons.lock_outline,
                                                  size: 22,
                                                  color: gray,
                                                ),
                                              ),
                                              prefixIconConstraints:
                                                  BoxConstraints(minWidth: 15),
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              _obscureText = !_obscureText;
                                            });
                                          },
                                          icon: _obscureText
                                              ? Icon(Icons.visibility_outlined)
                                              : Icon(Icons
                                                  .visibility_off_outlined),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          FadeInUp(
                            delay: Duration(milliseconds: 2000),
                            duration: Duration(milliseconds: 800),
                            from: 10,
                            child: SizedBox(
                              width: double.infinity,
                              child: TextButton(
                                onPressed: () => _handleSubmit(),
                                child: Text(widget.signType == SignType.SignIn
                                    ? "Sign In"
                                    : "Sign Up"),
                                style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  padding: EdgeInsets.all(20),
                                  primary: white,
                                  backgroundColor: blue,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          FadeInUp(
                            delay: Duration(milliseconds: 2500),
                            duration: Duration(milliseconds: 800),
                            from: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 40),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        PageRouteBuilder(
                                          pageBuilder: (context, animation,
                                                  anotherAnimation) =>
                                              widget.signType == SignType.SignIn
                                                  ? SignupScreen()
                                                  : SigninScreen(),
                                          transitionDuration:
                                              Duration(milliseconds: 1000),
                                          transitionsBuilder: (context,
                                                  animation,
                                                  anotherAnimation,
                                                  child) =>
                                              FadeInUp(child: child),
                                        ),
                                      );
                                    },
                                    child: Text(
                                        widget.signType == SignType.SignIn
                                            ? "Sign Up"
                                            : "Sign In"),
                                    style: TextButton.styleFrom(
                                      textStyle: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      primary: gray,
                                      padding: EdgeInsets.zero,
                                      alignment: Alignment.centerLeft,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text('Forgot Password ?'),
                                    style: TextButton.styleFrom(
                                      textStyle: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      primary: gray,
                                      padding: EdgeInsets.zero,
                                      alignment: Alignment.centerRight,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
