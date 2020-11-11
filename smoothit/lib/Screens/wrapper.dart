import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smoothit/Models/user.dart';
import 'package:smoothit/Screens/Connected/TabBar.dart';
import 'package:smoothit/Screens/LogIn/LogIn_view.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LocalUser user = Provider.of<LocalUser>(context);
    if (user == null) {
      return LogInView();
    } else {
      return CustomTabBar();
    }
  }
}
