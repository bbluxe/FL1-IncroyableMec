import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as _path;
import 'package:path_provider/path_provider.dart';

class DatabaseService {
  Future<void> uploadProfilPicture(File picture, String uid) async {
    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String newName = _path.join(dir, '$uid.png');
    final File file = await picture.copy(newName);
    final StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('profilPicture/$uid');
    final StorageUploadTask uploadTask = firebaseStorageRef.putFile(file);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    taskSnapshot.ref.getDownloadURL().then(
          (value) => print("Done: $value"),
        );
  }

  Future<String> loadImage(String image) async {
    final ref = FirebaseStorage.instance.ref().child('profilPicture/' + image);
    var url = await ref.getDownloadURL();
    print(url);
    return url;
  }
}
