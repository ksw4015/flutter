import 'package:flutter/material.dart';

/**
 * Screen들에 공통으로 적용해야 할 사항들을 위해 미리 만들어놓는 Layout
 */
class DefaultLayout extends StatelessWidget {
  final Color? backgroundColor;
  final String? title;
  final BottomNavigationBar? bottomNavigationBar;
  final Widget child;

  const DefaultLayout({
    this.backgroundColor,
    this.title,
    this.bottomNavigationBar,
    required this.child,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? Colors.white,
      appBar: renderAppBar(),
      body: SafeArea(
        child: child
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  AppBar? renderAppBar() {
    if(title == null) {
      return null;
    } else {
      return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          title!,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500
          ),
        ),
        foregroundColor: Colors.black,
      );
    }
  }
}
