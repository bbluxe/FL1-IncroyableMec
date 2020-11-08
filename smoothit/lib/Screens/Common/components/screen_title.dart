import 'package:flutter/material.dart';

class ScreenTitle extends StatefulWidget {
  final String title;

  const ScreenTitle({
    @required this.title,
  }) : super();

  @override
  _ScreenTitleState createState() => _ScreenTitleState();
}

class _ScreenTitleState extends State<ScreenTitle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Text(widget.title,
          style: TextStyle(color: Colors.white, fontSize: 40)),
    );
  }
}
