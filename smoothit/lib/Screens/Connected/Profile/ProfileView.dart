import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smoothit/Models/user.dart';
import 'package:smoothit/Screens/Common/components/screen_title.dart';
import 'package:smoothit/Screens/Connected/Profile/components/body.dart';
import 'package:smoothit/Screens/constant.dart';
import 'package:smoothit/services/auth.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<LocalUser>(context);

    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          title: ScreenTitle(title: "Profile"),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.red,
              ),
              onPressed: () async {
                await _auth.signOut();
              },
            )
          ],
        ),
        body: Body(user: user));
  }
}
