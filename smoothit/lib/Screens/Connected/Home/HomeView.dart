import 'package:flutter/material.dart';
import 'package:smoothit/Screens/Common/components/screen_title.dart';
import 'package:smoothit/Screens/Connected/Home/components/body.dart';
import 'package:smoothit/Screens/constant.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          title: ScreenTitle(title: "Smooth'IT"),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Body());
  }
}
