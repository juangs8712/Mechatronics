import 'dart:io';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:mechatronics/utils/jn_snackbar.dart';

class CustomPathProvider {
// --------------------------------------------------------------------------
  static Future<bool> existsDirectory(BuildContext context, String path,
      {String? root}) async {
    final directory = join(root: root ?? '', fileName: path);

    // preguntar si el directorio existe
    if (await Directory(directory).exists()) {
      return true;
    }
    JnSnackBar.showSnackBar(context,
        'El directorio especificado no existe o los permisos de acceso han sido revocados.');

    return false;
  }

// --------------------------------------------------------------------------
  static Future<bool> existsFile(BuildContext context, String fileName,
      {String? root}) async {
    final file = join(root: root ?? '', fileName: fileName);

    // preguntar si el directorio existe
    if (await File(file).exists()) {
      return true;
    }
    JnSnackBar.showSnackBar(context,
        'El fichero especificado no existe o los permisos de acceso han sido revocados.');

    return false;
  }

// --------------------------------------------------------------------------
  static String join({required String root, required String fileName}) {
    String strValue;

    if (fileName[0] == Platform.pathSeparator) {
      strValue = '$root$fileName';
    } else {
      strValue = '$root/$fileName';
    }

    return strValue;
  }
// --------------------------------------------------------------------------
}
