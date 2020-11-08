import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smoothit/Models/user.dart';
import 'package:smoothit/Screens/constant.dart';
import 'package:smoothit/services/database.dart';

class Body extends StatefulWidget {
  final LocalUser user;

  const Body({
    @required this.user,
  }) : super();

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  File _image;
  final picker = ImagePicker();
  final DatabaseService _database = DatabaseService();

  @override
  void initState() {
    downLoadPicture(widget.user.uid);
    super.initState();
  }

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

  Future downLoadPicture(uid) async {
    final url = await _database.loadImage(uid);
    final image = await _database.urlToFile(url);

    setState(() {
      this._image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<LocalUser>(context);

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
                      image: _image != null
                          ? Image.file(_image).image
                          : AssetImage("noPhoto.png")))),
          SizedBox(height: 30),
          FloatingActionButton(
            backgroundColor: kPrimaryColor,
            onPressed: takePhoto,
            tooltip: 'Pick Image',
            child: Icon(Icons.add_a_photo),
          ),
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
          ),
          SizedBox(height: 40),
          Container(
            width: 250,
            height: 40,
            child: RaisedButton(
                child: const Text('Upload my profile picture',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                color: kPrimaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: kStrokeButtonColor)),
                onPressed: () {
                  _database.uploadProfilPicture(this._image, user.uid);
                }),
          ),
        ],
      ),
    );
  }
}
