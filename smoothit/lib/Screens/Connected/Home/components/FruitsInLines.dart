import 'package:flutter/material.dart';
import 'package:smoothit/Screens/Connected/Home/components/Blender.dart';
import 'package:smoothit/Screens/constant.dart';

class FruitsInLines extends StatefulWidget {
  const FruitsInLines({
    Key key,
  }) : super(key: key);

  @override
  _FruitsInLinesState createState() => _FruitsInLinesState();
}

class _FruitsInLinesState extends State<FruitsInLines> {
  final Map firstLinefruits = {
    'images/watermelon.png': "Watermelon",
    'images/pear.png': "Pear",
    'images/strawberry.png': "Strawberry",
    'images/apple.png': "Apple",
    'images/coconut.png': "Coconut",
  };
  final Map secondLinefruits = {
    'images/bananas.png': "Bananas",
    'images/mango.png': "Mango",
    'images/pineapple.png': "Pineapple",
    'images/blueberry.png': "Blueberry",
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: firstLinefruits.keys.map((fruit) {
                return Draggable<String>(
                  data: firstLinefruits[fruit],
                  child: Image.asset(fruit, width: 50),
                  feedback: Image.asset(fruit, width: 50),
                  childWhenDragging: Image.asset(fruit, width: 50),
                );
              }).toList()),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: secondLinefruits.keys.map((fruit) {
                return Draggable<String>(
                    data: secondLinefruits[fruit],
                    child: Image.asset(fruit, width: 50),
                    feedback: Image.asset(fruit, width: 50),
                    childWhenDragging: Image.asset(fruit, width: 50));
              }).toList()),
        ),
      ],
    );
  }
}