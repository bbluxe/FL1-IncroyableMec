import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:smoothit/Screens/constant.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  File _image;
  final picker = ImagePicker();

  Future takePhoto() async {
    final pickedPhoto = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedPhoto != null) {
        _image = File(pickedPhoto.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future openGalery() async {
    final PickedFile pickedPhoto =
        await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedPhoto != null) {
        _image = File(pickedPhoto.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  border: Border.all(color: kPrimaryColor, width: 2),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: _image != null ? BoxFit.fill : BoxFit.none,
                      image: _image == null
                          ? AssetImage("images/noPhoto.png")
                          : Image.file(_image).image))),
          SizedBox(height: 30),
          FloatingActionButton(
            backgroundColor: kPrimaryColor,
            onPressed: takePhoto,
            tooltip: 'Pick Image',
            child: Icon(Icons.add_a_photo),
          ),
          SizedBox(height: 20),
          Container(
            width: 180,
            child: RaisedButton(
                animationDuration: Duration(seconds: 0),
                child: Text('Or click here to access your galery',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: kPrimaryColor, fontSize: 16)),
                onPressed: openGalery,
                color: Colors.transparent,
                elevation: 0.0),
          )
        ],
      ),
    );
  }
}
