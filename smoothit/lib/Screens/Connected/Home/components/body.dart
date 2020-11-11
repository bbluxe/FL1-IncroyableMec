// import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:smoothit/Screens/Connected/Home/components/Blender.dart';
import 'package:smoothit/Screens/Connected/Home/components/FruitsInLines.dart';
import 'package:smoothit/Screens/constant.dart';
import 'package:dart_random_choice/dart_random_choice.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final AudioCache _audioController = AudioCache();
  // AudioCache _audioController = AudioCache();
  Map<String, int> ingredients = <String, int>{
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
    final Map<int, String> musics = <int, String>{
      1: 'DESFRUITS.mp3',
      2: 'TOUTDEDANS.mp3'
    };

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const SizedBox(height: 40),
              const FruitsInLines(),
              const SizedBox(height: 40),
              Blender(ingredients: ingredients)
            ],
          ),
          const SizedBox(height: 40),
          Container(
            width: 150,
            child: RaisedButton(
                child: const Text('Mix',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                color: kPrimaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: kStrokeButtonColor)),
                onPressed: () {
                  _audioController.play(musics[randomChoice(musics.keys)]);
                  final AlertDialog dialog = AlertDialog(
                    title: const Text('Sorry..',
                        style: TextStyle(color: kPrimaryColor)),
                    content: const Text(
                        "We didn't have the time to go further... but don't forget to enable your sound ",
                        style: TextStyle(color: kPrimaryColor, fontSize: 16)),
                    backgroundColor: kBackgroundColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    actions: <Widget>[
                      FlatButton(
                        child: const Text(
                          "Let's go!",
                        ),
                        textColor: kPrimaryColor,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                  showDialog<BuildContext>(
                      context: context,
                      builder: (BuildContext context) => dialog);
                }),
          ),
        ],
      ),
      resizeToAvoidBottomPadding: false,
      backgroundColor: kBackgroundColor,
      floatingActionButton: FloatingActionButton(
          tooltip: 'Refresh ingredients',
          backgroundColor: kPrimaryColor,
          child: const Icon(Icons.refresh),
          onPressed: () {
            setState(() {
              ingredients.clear();
              ingredients = <String, int>{
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
