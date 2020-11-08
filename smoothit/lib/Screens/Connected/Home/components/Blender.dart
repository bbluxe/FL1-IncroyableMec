import 'package:flutter/material.dart';
import 'package:smoothit/Screens/constant.dart';

class Blender extends StatefulWidget {
  final Map ingredients;

  const Blender({
    @required this.ingredients,
  }) : super();

  @override
  _BlenderState createState() => _BlenderState();
}

class _BlenderState extends State<Blender> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: DragTarget(
            builder: (context, List<String> candidateData, rejectedData) {
              return Image.asset("blender.png");
            },
            onAccept: (data) {
              setState(() {
                widget.ingredients.update(data, (value) => value + 1);
              });
              print(widget.ingredients);
            },
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Ingredients :",
                style: TextStyle(color: kPrimaryColor, fontSize: 16)),
            SizedBox(height: 20),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.ingredients.keys.map((fruit) {
                  return Text(
                      widget.ingredients[fruit].toString() + "  " + fruit,
                      style: TextStyle(color: kPrimaryColor, fontSize: 16));
                }).toList()),
          ],
        ),
      ],
    );
  }
}
