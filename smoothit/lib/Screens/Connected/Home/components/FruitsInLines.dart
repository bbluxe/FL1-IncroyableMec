import 'package:flutter/material.dart';

class FruitsInLines extends StatefulWidget {
  const FruitsInLines({
    Key key,
  }) : super(key: key);

  @override
  _FruitsInLinesState createState() => _FruitsInLinesState();
}

class _FruitsInLinesState extends State<FruitsInLines> {
  final Map<String, String> firstLinefruits = <String, String>{
    'watermelon.png': 'Watermelon',
    'pear.png': 'Pear',
    'strawberry.png': 'Strawberry',
    'apple.png': 'Apple',
    'coconut.png': 'Coconut',
  };
  final Map<String, String> secondLinefruits = <String, String>{
    'bananas.png': 'Bananas',
    'mango.png': 'Mango',
    'pineapple.png': 'Pineapple',
    'blueberry.png': 'Blueberry',
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: firstLinefruits.keys.map((String fruit) {
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
              children: secondLinefruits.keys.map((String fruit) {
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
