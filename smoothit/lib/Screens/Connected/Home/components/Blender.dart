import 'package:flutter/material.dart';
import 'package:smoothit/Screens/constant.dart';

class Blender extends StatefulWidget {
  const Blender({
    @required this.ingredients,
  }) : super();

  final Map<String, int> ingredients;

  @override
  _BlenderState createState() => _BlenderState();
}

class _BlenderState extends State<Blender> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: DragTarget<String>(
            builder: (BuildContext context, List<String> candidateData,
                List<dynamic> rejectedData) {
              return Image.asset('blender.png');
            },
            onAccept: (String data) {
              setState(() {
                widget.ingredients.update(data, (int value) => value + 1);
              });
              print(widget.ingredients);
            },
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Ingredients :',
                style: TextStyle(color: kPrimaryColor, fontSize: 16)),
            const SizedBox(height: 20),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.ingredients.keys.map((String fruit) {
                  return Text(
                    widget.ingredients[fruit].toString() + '  ' + fruit,
                    style: const TextStyle(color: kPrimaryColor, fontSize: 16),
                  );
                }).toList()),
          ],
        ),
      ],
    );
  }
}
