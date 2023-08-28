import 'dart:io';

import 'package:path/path.dart';
import 'package:uuid/uuid.dart';
import 'package:path_provider/path_provider.dart';

///Utility class for creating a temporary file.
///
/// Returns the path, but creates the file itself using CreateSync
/// {@category App}
Future<String> tempFile({String? suffix}) async {
  suffix ??= 'tmp'; // if null

  if (!suffix.startsWith('.')) {
    suffix = '.$suffix';
  }
  var uuid = Uuid();
  String path; // what we will be returning.

  var tmpDir = await getTemporaryDirectory();
  path = '${join(tmpDir.path, uuid.v4())}$suffix';
  var parent = dirname(path);
  Directory(parent).createSync(recursive: true);

  return path;
}
