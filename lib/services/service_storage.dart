import 'dart:html';

import 'package:camera/camera.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../models/model_storage.dart';

class ServiceStorage {
  static Future<ModelStorage?> saveStorageModel(ModelStorage modelStorage) async {
    late Reference storageReference;
    String pathFirebase =
        '${modelStorage.propietario}/${modelStorage.fileName}';
    try {
      if (modelStorage.fileType == 'image') {
        storageReference =
            FirebaseStorage.instance.ref().child("images/$pathFirebase");
      }
      if (modelStorage.fileType == 'audio') {
        storageReference =
            FirebaseStorage.instance.ref().child("storage/audio/$pathFirebase");
      }
      if (modelStorage.fileType == 'video') {
        storageReference =
            FirebaseStorage.instance.ref().child("videos/$pathFirebase");
      }
      if (modelStorage.fileType == 'pdf') {
        storageReference =
            FirebaseStorage.instance.ref().child("pdf/$pathFirebase");
      }
      if (modelStorage.fileType == 'others') {
        storageReference =
            FirebaseStorage.instance.ref().child("others/$pathFirebase");
      }

      final UploadTask uploadTask =
          storageReference.putFile(modelStorage.file!);
      final TaskSnapshot downloadUrl = (await uploadTask);
      final ref = downloadUrl.ref;
      final String url = await ref.getDownloadURL();
      final metadata = await ref.getMetadata();
      final DateTime? fecha = metadata.timeCreated;
      final filetype = metadata.contentType;
      modelStorage.size = metadata.size;
      modelStorage.fechacrea = fecha;
      modelStorage.fileType = filetype;
      modelStorage.url = url;
      return modelStorage;
    } catch (e) {
      return null;
    }
  }


  static Future<ModelStorage> saveVideo(XFile blob, String name) async {
    ModelStorage modelStorage = ModelStorage(fileName: name, propietario: "pragma", url: "no url");
try{
    late Reference storageReference;
    String pathFirebase =
        'pragmasa/$name.mp4';
    storageReference =
        FirebaseStorage.instance.ref().child("videos/$pathFirebase");

      final bytes = await blob.readAsBytes();
      final UploadTask uploadTask =
      storageReference.putBlob(Blob([bytes]));
      final TaskSnapshot downloadUrl = (await uploadTask);
      final ref = downloadUrl.ref;
      final String url = await ref.getDownloadURL();
      final metadata = await ref.getMetadata();
      final DateTime? fecha = metadata.timeCreated;
      final filetype = blob.mimeType;
      modelStorage.size = metadata.size;
      modelStorage.fechacrea = fecha;
      modelStorage.fileType = filetype;
      modelStorage.url = url;
      return modelStorage;
    } catch (e) {
      return modelStorage;
    }
  }


}
