import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as _path;

class DatabaseService {
  Future<void> uploadProfilPicture(File picture, String uid) async {
    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String newName = _path.join(dir, '$uid.png');
    final File file = await picture.copy(newName);
    final StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('profilPicture/$uid');
    final StorageUploadTask uploadTask = firebaseStorageRef.putFile(file);
    final StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    taskSnapshot.ref.getDownloadURL().then(
          (dynamic value) => print('Done: $value'),
        );
  }

  Future<dynamic> loadImage(String image) async {
    final StorageReference ref =
        FirebaseStorage.instance.ref().child('profilPicture/' + image);
    final dynamic url = await ref.getDownloadURL();
    return url;
  }

  Future<File> urlToFile(dynamic imageUrl) async {
    final Random rng = Random();
    final Directory tempDir = await getTemporaryDirectory();
    final String tempPath = tempDir.path;
    final File file = File(tempPath + rng.nextInt(100).toString() + '.png');

    final http.Response response = await http.get(imageUrl);
    await file.writeAsBytes(response.bodyBytes);
    return file;
  }
}
