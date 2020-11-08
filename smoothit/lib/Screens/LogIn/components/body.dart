import 'package:flutter/material.dart';
import 'package:smoothit/Screens/LogIn/components/background.dart';
import 'package:smoothit/Screens/LogIn/components/logInfForm.dart';
import 'package:smoothit/Screens/Register/Register_view.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Background(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        LogInForm(size: size),
        SizedBox(height: 20),
        Center(
            child: Text('Pas encore inscrit ? Cliquez sur la graine',
                style: TextStyle(fontSize: 16))),
        Center(
            child: IconButton(
                icon: Image.asset('images/seeds.png', width: 40),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterView())))),
      ],
    ));
  }
}
