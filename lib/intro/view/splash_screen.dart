import 'package:flutter/material.dart';
import 'package:flutteractual/common/const/colors.dart';
import 'package:flutteractual/common/const/data_key.dart';
import 'package:flutteractual/common/layout/default_layout.dart';
import 'package:flutteractual/login/view/login_screen.dart';
import 'package:flutteractual/root/view/root_tab.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // 처음 실행됐을 때 호출
  @override
  void initState() {
    super.initState();
    checkToken();  // await를 쓰기위해 따로 함수로 분리
  }

  void checkToken() async {
    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    print('accessToken = $accessToken');
    print('refreshToken = $refreshToken');
    
    if(refreshToken == null || accessToken == null) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => LoginScreen()
        ), (route) => false
      );
    } else {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => RootTab()
        ), (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      backgroundColor: PRIMARY_COLOR,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img/logo/logo.png',
              width: MediaQuery.of(context).size.width / 2,
            ),
            const SizedBox(height: 16.0),
            CircularProgressIndicator(
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
