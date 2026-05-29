import 'dart:typed_data';

import 'package:http/http.dart' as http;

import '../../../core/config/app_config.dart';

class ImageUploadService {
  ImageUploadService._();

  static Future<String> uploadBoardImage(Uint8List bytes, String ext) async {
    if (kGcsBucket.isEmpty || kGcsApiKey.isEmpty) {
      throw Exception(
        'GCS not configured — set GCS_BUCKET and GCS_API_KEY via --dart-define',
      );
    }

    final ts = DateTime.now().millisecondsSinceEpoch;
    final objectName = 'board/${ts}_${bytes.lengthInBytes}.${ext.toLowerCase()}';

    final uri = Uri.parse(
      'https://storage.googleapis.com/upload/storage/v1/b'
      '/$kGcsBucket/o'
      '?uploadType=media'
      '&name=${Uri.encodeComponent(objectName)}'
      '&key=$kGcsApiKey',
    );

    final res = await http.post(
      uri,
      headers: {'Content-Type': _mimeFor(ext)},
      body: bytes,
    );

    if (res.statusCode != 200) {
      throw Exception('GCS upload failed (${res.statusCode}): ${res.body}');
    }

    return 'https://storage.googleapis.com/$kGcsBucket/${Uri.encodeComponent(objectName)}';
  }

  static String _mimeFor(String ext) {
    switch (ext.toLowerCase()) {
      case 'png':
        return 'image/png';
      case 'gif':
        return 'image/gif';
      case 'webp':
        return 'image/webp';
      default:
        return 'image/jpeg';
    }
  }
}
