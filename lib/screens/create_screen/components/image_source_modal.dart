import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceModal extends StatelessWidget {
  const ImageSourceModal({super.key, required this.onImageSelected});
  final Function(File file) onImageSelected;

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return BottomSheet(
        onClosing: () {},
        builder: (_) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  getPhoto(true);
                },
                child: Text('Camera'),
              ),
              ElevatedButton(
                onPressed: () {
                  getPhoto(false);
                },
                child: Text('Galeria'),
              ),
            ],
          );
        },
      );
    } else {
      return CupertinoActionSheet(
        title: Text('Selecionar foto para o anuncio'),
        message: Text('Escolha a origem da foto'),
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancelar'),
        ),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              getPhoto(true);
            },
            child: Text('Camera'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              getPhoto(false);
            },
            child: Text('Camera'),
          ),
        ],
      );
    }
  }

  Future<void> getPhoto(bool camera) async {
    if (camera) {
      //camera
      final XFile? file = await ImagePicker().pickImage(
        source: ImageSource.camera,
      );

      if (file != null) {
        File image = File(file.path);
        onImageSelected(image);
      }
    } else {
      // galeria
      final XFile? file = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (file != null) {
        File image = File(file.path);
        onImageSelected(image);
      }
    }
  }
}
