import 'dart:io';

// import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';


class ImageInterface {
  // FirebaseStorage storage = FirebaseStorage.instance;
  static Future<XFile?> pickImage(ImageSource source) async {
    XFile? pickedImage;

    if (source == ImageSource.camera) {
      PermissionStatus status = await Permission.camera.status;
      if (status.isGranted) {
        return pickedImage = await ImagePicker().pickImage(source: source);
      } else {
        PermissionStatus requestStatus = await Permission.camera.request();
        if (requestStatus.isGranted) {
          await pickImage(source);
        } else {
          return null;
        }
      }
    } else if (source == ImageSource.gallery) {
      PermissionStatus status = await Permission.storage.status;

      if (status.isGranted) {
        return pickedImage = await ImagePicker().pickImage(source: source);
      } else {
        PermissionStatus requestStatus = await Permission.storage.request();
        if (requestStatus.isGranted) {
          await pickImage(source);
        } else {
          return null;
        }
      }
    }
    return pickedImage;
  }

  Future<String> uploadFile(
    // UserModel user,
    // ClinicaModel clinica,
    String type,
    File file,
  ) async {
    try {
      // Reference ref = storage
          // .ref()
          // .child('users')
          // .child('user_id: ${user.uid}')
          // .child('clinica: ${clinica.uid}')
          // .child('quirurgicos')
          // .child(DateFormat('dd-MM-yyyy H:m:s').format(DateTime.now()))
          // .child(type);

      // UploadTask uploadTask = ref.putFile(file);

      // TaskSnapshot snapshot = await uploadTask;

      // String downloadUrl = await snapshot.ref.getDownloadURL();

      return 'downloadUrl';
    } catch (e) {
      // ignore: avoid_print
      print('Error al subir el archivo: $e');
      return '';
    }
  }
}