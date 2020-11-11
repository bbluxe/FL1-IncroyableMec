import 'package:flutter/material.dart';
import 'package:smoothit/Screens/Common/components/screen_title.dart';
import 'package:smoothit/Screens/Register/components/body.dart';
import 'package:smoothit/Screens/constant.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          title: const ScreenTitle(title: 'Register'),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Body());
  }
}
