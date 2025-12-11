import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../main.dart';

enum ImageSourceType { camera, gallery }

class StorageService {
  final String bucketId = 'avatars';

  // get image from storage or camera
  Future<File?> pickerImage(ImageSourceType sourceType) async {
    final ImageSource source = (sourceType == ImageSourceType.camera) ? ImageSource.camera : ImageSource.gallery;

    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  Future<String?> uploadImage(File imageFile, String userId) async {
    final fileExtension = imageFile.path.split('.').last;
    final fileName = 'public/$userId/${DateTime.now().millisecondsSinceEpoch}.$fileExtension';
    try {
      await supabase.storage
          .from(bucketId)
          .upload(
            fileName,
            imageFile,
            fileOptions: const FileOptions(
              cacheControl: '3600',
              upsert: true,
            ), // upsert: true - override  existing file
          );
      return supabase.storage.from(bucketId).getPublicUrl(fileName);
    } catch (e) {
      debugPrint(e.toString());
      return null;

    }
  }
}
