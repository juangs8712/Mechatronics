import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

class ListFileModel {
  static Future<List<File>> listFiles(String path) async {
    if (await _requestPermission(Permission.storage) == false) return [];

    final List<FileSystemEntity> list = await Directory(path).list().toList();

    final files = list.whereType<File>().toList();
    // sorting files list by name.
    files.sort((a, b) => a.path.toLowerCase().compareTo(b.path.toLowerCase()));

    return files;
  }

  static Future<List<Directory>> listFolders(String path) async {
    if (await _requestPermission(Permission.storage) == false) return [];

    final List<FileSystemEntity> list = await Directory(path).list().toList();

    // making list of only folders.
    final dirs = list.whereType<Directory>().toList();
    // sorting folder list by name.
    dirs.sort((a, b) => a.path.toLowerCase().compareTo(b.path.toLowerCase()));

    return dirs;
  }

  // solicitud de permisos
  static Future<bool> _requestPermission(Permission permission) async {
    return await permission.request().isGranted;
  }
}
