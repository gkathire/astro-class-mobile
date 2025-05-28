import 'dart:convert';
import 'dart:io';
import 'dart:math' as Math;
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_app/framework/infrastructure/log/logger_service.dart';
import 'package:http/http.dart' as http;
import 'package:open_filex/open_filex.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

class FileUtils {
  static String formatBytes(int bytes, int decimals) {
    if (bytes == 0) {
      return '0 Bytes';
    }
    const int k = 1024;
    final int dm = decimals <= 0 ? 0 : decimals;
    const List<String> sizes = [
      'Bytes',
      'KB',
      'MB',
      'GB',
      'TB',
      'PB',
      'EB',
      'ZB',
      'YB'
    ];
    final int i = (Math.log(bytes) / Math.log(k)).floor();
    final double size = bytes / Math.pow(k, i);
    return '${size.toStringAsFixed(dm)} ${sizes[i]}';
  }

  static Future<String>? convertPlatformFileToBase64(PlatformFile? file) async {
    try {
      if (file == null) return "";
      File fileToSend = File(file.path!);
      // Read file as bytes
      List<int> fileBytes = await fileToSend.readAsBytes();
      // Convert to base64 string
      return base64Encode(fileBytes);
    } catch (e, stackTrace) {
      throw Exception(e);
    }
  }

  static Future<List<int>?> convertPlatformFileToBytes(
      PlatformFile? file) async {
    try {
      if (file == null) return [];
      File fileToSend = File(file.path!);
      // Read file as bytes
      List<int> fileBytes = await fileToSend.readAsBytes();
      // Convert to base64 string
      return fileBytes;
    } catch (e, stackTrace) {
      LoggerService()
          .error("Unable to convert PlatformFile file to bytes", e, stackTrace);
      return [];
    }
  }

  static Future<http.MultipartFile?> convertPlatformFileToMultipartFile(
      PlatformFile? file) async {
    try {
      if (file == null) throw Exception("File is not valid");
      File fileToSend = File(file.path!);
      // Read file as bytes
      List<int> fileBytes = await fileToSend.readAsBytes();

      return http.MultipartFile.fromBytes(
        'UploadedFile',
        fileBytes, // Convert to base64 string
        filename: '${file.name}',
      );
    } catch (e, stackTrace) {
      LoggerService()
          .error("Unable to convert PlatformFile file to bytes", e, stackTrace);
      throw Exception("File is not valid");
    }
  }

  static Future<Directory> getDownloadDirectory() async {
    if (Platform.isAndroid) {
      bool permissionGranted = await Permission.storage.request().isGranted;
      if (permissionGranted == false) {
        return await getApplicationSupportDirectory();
        throw Exception("Storage permission not granted");
      }
      return Directory(
          '/storage/emulated/0/Download'); // Android Download folder
    } else {
      return await getApplicationDocumentsDirectory(); // iOS/MacOS default directory
    }
  }

  static Future<void> downloadAndShareFile(
      {required File file,
      required bool isShareImage,
      required String description}) async {
    try {
      if (isShareImage == true) {
        // Share or save the file
        await Share.shareXFiles([XFile(file.path)], text: description);
      } else {
        OpenFilex.open(file.path);
      }
    } catch (e, stackTrace) {
      throw Exception(e);
    }
  }

  static String getFileExtension({required String filePath}) {
    return path.extension(filePath);
  }

  static Uint8List convertStringToUint8List(String binaryString) {
    // Convert the string to a list of bytes
    return Uint8List.fromList(binaryString.codeUnits);
  }
}
