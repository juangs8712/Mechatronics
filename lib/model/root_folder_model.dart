import 'package:flutter/material.dart';

import 'package:file_picker/file_picker.dart';
import 'package:mechatronics/share_prefs/share_prefs.dart';
import 'package:permission_handler/permission_handler.dart';

class RootFolderModel with ChangeNotifier {
  String? _pathName;

  RootFolderModel() {
    final prefs = SharedPrefs();

    _pathName = prefs.getString('root');

    if (_pathName == null) {
      pickDirectory();
    }
  }

  String? get pathName => _pathName;

  set pathName(String? path) {
    _pathName = path;
    final prefs = SharedPrefs();

    if (_pathName != null) {
      prefs.setString('root', _pathName!);
      notifyListeners();
    }
  }

  // seleccionar el directorio raiz de la documentacion
  Future<String?> pickDirectory() async {
    if (await Permission.storage.request().isGranted) {
      // Either the permission was already granted before or the user just granted it.
    } else {
      return null;
    }

    String? selectedDirectory = await FilePicker.platform.getDirectoryPath();

    if (selectedDirectory == null) return null;

    pathName = selectedDirectory;
    return pathName;
  }
}
