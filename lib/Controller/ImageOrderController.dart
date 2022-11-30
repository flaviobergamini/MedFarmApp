import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImageOrderController{

  File? _image;

  Future<dynamic> getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);

    if (image == null) return;

    return File(image.path);
  }
}