import 'dart:io';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';

// --------------------------------------------------------------------------
Future<String?> readFileAsString(String fileName) async {
  final file = File(fileName);

  if (await file.exists()) {
    return await file.readAsString();
  }

  return null;
}

// --------------------------------------------------------------------------
Future<void> launchInBrowser(Uri url) async {
  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw 'Could not launch $url';
  }
}
// --------------------------------------------------------------------------

