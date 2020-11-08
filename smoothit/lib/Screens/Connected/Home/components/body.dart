import 'dart:ffi';

import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:smoothit/Screens/Connected/Home/components/Blender.dart';
import 'package:smoothit/Screens/Connected/Home/components/FruitsInLines.dart';
import 'package:smoothit/Screens/constant.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  AudioCache _audioController = AudioCache();

  Map ingredients = {
    'Watermelon': 0,
    'Pear': 0,
    'Strawberry': 0,
    'Apple': 0,
    'Coconut': 0,
    'Bananas': 0,
    'Mango': 0,
    'Pineapple': 0,
    'Blueberry': 0
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 40),
              FruitsInLines(),
              SizedBox(height: 40),
              Blender(ingredients: ingredients)
            ],
          ),
          SizedBox(height: 40),
          Container(
            width: 150,
            child: RaisedButton(
                child: const Text('Mixer',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                color: kPrimaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: kStrokeButtonColor)),
                onPressed: () {}),
          ),
        ],
      ),
      resizeToAvoidBottomPadding: false,
      backgroundColor: kBackgroundColor,
      floatingActionButton: FloatingActionButton(
          tooltip: 'Refresh ingredients',
          backgroundColor: kPrimaryColor,
          child: Icon(Icons.refresh),
          onPressed: () {
            setState(() {
              ingredients.clear();
              ingredients = {
                'Watermelon': 0,
                'Pear': 0,
                'Strawberry': 0,
                'Apple': 0,
                'Coconut': 0,
                'Bananas': 0,
                'Mango': 0,
                'Pineapple': 0,
                'Blueberry': 0
              };
            });
          }),
    );
  }
}
