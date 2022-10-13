import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutteractual/common/const/colors.dart';
import 'package:flutteractual/common/const/data_key.dart';
import 'package:flutteractual/common/layout/default_layout.dart';
import 'package:flutteractual/root/view/root_tab.dart';

import '../../common/component/common_text_form_field.dart';

class LoginScreen extends StatefulWidget {

  const LoginScreen({
    Key? key
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    final dio = Dio();

    return DefaultLayout(
      child: SingleChildScrollView(  // 화면을 스크롤이 가능하도록 만듬. (키보드 올라오면서 짤리는 현상 방지)
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,   // 기본값은 manual, onDrag로 할 경우 Input창 외에 다른 부분 터치하면 키보드 Hide
        child: SafeArea(
          top: true,
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _Title(),
                const SizedBox(height: 16.0),
                _SubTitle(),
                Image.asset(
                  'assets/img/misc/logo.png',
                  width: MediaQuery.of(context).size.width / 3 * 2,
                ),
                CommonTextFormField(
                  hintText: '이메일을 입력해주세요.',
                  onChanged: (String s) {
                    email = s;
                  },
                ),
                const SizedBox(height: 8.0),
                CommonTextFormField(
                  hintText: '비밀번호를 입력해주세요.',
                  onChanged: (String s) {
                    password = s;
                  },
                  obscureText: true,
                ),
                const SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: () async {
                    final response = await dio.post(
                      '$apiUrl$userApi',
                      data: {
                        'email': email,
                        'password': password
                      }
                    );

                    final accessToken = response.data['accessToken'];
                    final refreshToken = response.data['refreshToken'];

                    await storage.write(key: ACCESS_TOKEN_KEY, value: accessToken);
                    await storage.write(key: REFRESH_TOKEN_KEY, value: refreshToken);

                    // Move Screen
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (_) => RootTab()
                      ), (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: PRIMARY_COLOR   // primary -> backgroundColor로 속성 이름 변경됨.
                  ),
                  child: Text('로그인'),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black  // primary -> foregroundColor로 속성 이름 변경됨.
                  ),
                  child: Text('회원가입'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '환영합니다!',
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w500
      ),
    );
  }
}

class _SubTitle extends StatelessWidget {

  const _SubTitle({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '이메일과 비밀번호를 입력해서 로그인 해주세요!\n오늘도 성공적인 주문이 되길! :)',
      style: TextStyle(
        fontSize: 14,
        color: BODY_TEXT_COLOR
      ),
    );
  }
}


