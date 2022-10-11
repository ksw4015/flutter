import 'package:flutter/material.dart';
import 'package:flutteractual/common/component/common_text_form_field.dart';
import 'package:flutteractual/intro/view/splash_screen.dart';
import 'package:flutteractual/login/view/login_screen.dart';

void main() {
  runApp(_App());
}

class _App extends StatelessWidget {
  const _App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'NotoSans'
      ),
      home: Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}

