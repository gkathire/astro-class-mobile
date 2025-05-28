import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Base64ImageFile extends StatefulWidget {
  final String base64String;

  const Base64ImageFile({super.key, required this.base64String});

  @override
  State<Base64ImageFile> createState() => _Base64ImageFileState();
}

class _Base64ImageFileState extends State<Base64ImageFile> {
  File? _imageFile;

  @override
  void initState() {
    super.initState();
    _convertBase64ToFile();
  }

  Future<void> _convertBase64ToFile() async {
    try {
      Uint8List bytes = base64Decode(widget.base64String);
      Directory tempDir = await getTemporaryDirectory();
      File file = File('${tempDir.path}/image.png');
      await file.writeAsBytes(bytes);
      setState(() {
        _imageFile = file;
      });
    } catch (e) {
      debugPrint("Error decoding base64: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return _imageFile != null
        ? Image.file(_imageFile!)
        : const CircularProgressIndicator();
  }
}
