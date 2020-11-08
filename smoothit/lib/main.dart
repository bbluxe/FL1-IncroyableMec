import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:smoothit/Models/user.dart';
import 'package:smoothit/Screens/constant.dart';
import 'package:smoothit/Screens/wrapper.dart';
import 'package:smoothit/services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<LocalUser>.value(
      value: AuthService().user,
      child: MaterialApp(
          theme: ThemeData(fontFamily: 'Sunshiney'),
          home: Scaffold(
              backgroundColor: kBackgroundColor,
              resizeToAvoidBottomInset: false,
              body: Wrapper())),
    );
  }
}
