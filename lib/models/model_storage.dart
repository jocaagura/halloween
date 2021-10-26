import 'dart:convert';
import 'dart:io';

class ModelStorage {
  String? fileType;
  String? fileName;
  int? size;
  DateTime? fechacrea;
  String? url;
  String? propietario;
  File? file;

  ModelStorage(
      {this.fileType,
      this.fileName,
      this.size,
      this.fechacrea,
      this.url,
      this.propietario,
      this.file});

  factory ModelStorage.fromJson(Map<String, dynamic> json) => ModelStorage(
      fileType: json["fileType"],
      fileName: json["fileName"],
      size: json["size"],
      fechacrea: json["fechacrea"] != null
          ? DateTime.parse(json["fechacrea"]).toLocal()
          : null,
      url: json["result"],
      propietario: json["propietario"]);

  Map<String, dynamic> toJson() {
    Map tmp = <String, dynamic>{};
    if (fileType != null) {
      tmp["fileType"] = fileType;
    }
    if (fileName != null) {
      tmp["fileName"] = fileName;
    }
    if (size != null) {
      tmp["size"] = size;
    } else {
      size = 1000000;
    }
    if (fechacrea != null) {
      tmp["fechacrea"] = fechacrea!.toIso8601String();
    }
    if (url != null) {
      tmp["url"] = url;
    }
    if (propietario != null) {
      tmp["propietario"] = propietario;
    }
    return tmp as Map<String, dynamic>;
  }

  String getId() {
    return '$propietario$fileName';
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
