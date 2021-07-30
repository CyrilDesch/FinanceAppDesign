import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:testapp/screens/SplashScreen.dart';

import 'screens/screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    if (Platform.isIOS || Platform.isAndroid) {
      await Firebase.initializeApp();
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
      ));
    }
  } catch (err) {}

  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'TestApp',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: _handleAuth(),
        ));
  }

  Widget _handleAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting &&
            FirebaseAuth.instance.currentUser == null) {
          return SplashScreen();
        }
        return !kIsWeb && !snapshot.hasData ? SigninScreen() : MainScreen();
      },
    );
  }
}
