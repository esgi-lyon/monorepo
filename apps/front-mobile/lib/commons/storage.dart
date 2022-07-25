import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

Future<Directory?> createAuthorizedStorage(String storagePath) async {
  if (kIsWeb) return null;

  Directory appDocDirectory = await getApplicationDocumentsDirectory();

  var dir =
      Directory('${appDocDirectory.path}/$storagePath').create(recursive: true);

  return dir;
}
