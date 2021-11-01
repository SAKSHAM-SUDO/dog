
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'image_model.dart';
import 'package:http/http.dart' as http;

class ImageList extends StatelessWidget {
 final ImageModel images;
 ImageList(this.images);
  @override
  Widget build(BuildContext context) {
    return Image.network(images.message);
  }

}
