import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class FHPickerImage extends StatefulWidget {
  @override
  _HYHomePageState createState() => _HYHomePageState();
}

class _HYHomePageState extends State<FHPickerImage> {
  File _imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("选择照片"),
              onPressed: _pickImage,
            ),
            _imageFile == null? Text("请选择一张照片"): Image.file(_imageFile)
          ],
        ),
      ),
    );
  }

  void _pickImage() async {
    //  camera: 相册
    //  gallery: 相册
    File file = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = file;
    });
  }
}