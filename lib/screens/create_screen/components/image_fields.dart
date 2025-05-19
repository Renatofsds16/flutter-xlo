import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo/screens/create_screen/components/image_source_modal.dart';

import '../../../stores/create_store.dart';
import 'image_dialog.dart';

class ImageField extends StatelessWidget {
  const ImageField({super.key, required this.createStore});
  final CreateStore createStore;

  @override
  Widget build(BuildContext context) {
    void onImageSelected(File image) {
      createStore.addImage(image);
      Navigator.of(context).pop();
    }

    return Column(
      children: [
        Container(
          color: Colors.grey[200],
          height: 120,
          child: Observer(
            builder: (_) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:
                    createStore.image.isNotEmpty
                        ? createStore.image.length + 1
                        : 1,
                itemBuilder: (_, index) {
                  print('index: $index');
                  if (createStore.image.isNotEmpty) {
                    //depois da foto

                    if (index == createStore.image.length) {
                      return Padding(
                        padding: EdgeInsets.all(4),
                        child: GestureDetector(
                          onTap: () {
                            if (Platform.isAndroid) {
                              showModalBottomSheet(
                                context: context,
                                builder: (_) {
                                  return ImageSourceModal(
                                    onImageSelected: onImageSelected,
                                  );
                                },
                              );
                            } else {
                              showCupertinoModalPopup(
                                context: context,
                                builder: (_) {
                                  return ImageSourceModal(
                                    onImageSelected: onImageSelected,
                                  );
                                },
                              );
                            }
                          },
                          child: CircleAvatar(
                            radius: 44,
                            backgroundColor: Colors.grey[300],
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_a_photo,
                                  size: 35,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Padding(
                        padding: EdgeInsets.all(4),
                        child: GestureDetector(
                          onTap: () {
                            if (Platform.isAndroid) {
                              showModalBottomSheet(
                                context: context,
                                builder: (_) {
                                  return ImageSourceModal(
                                    onImageSelected: onImageSelected,
                                  );
                                },
                              );
                            } else {
                              showCupertinoModalPopup(
                                context: context,
                                builder: (_) {
                                  return ImageSourceModal(
                                    onImageSelected: onImageSelected,
                                  );
                                },
                              );
                            }
                          },
                          child: GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return ImageDialog(
                                    image: createStore.image[index],
                                    onDelete:
                                        () => createStore.image.removeAt(index),
                                  );
                                },
                              );
                            },
                            child: CircleAvatar(
                              radius: 44,
                              backgroundColor: Colors.grey[300],
                              backgroundImage: FileImage(
                                createStore.image[index],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(null, size: 35, color: Colors.white),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  } else {
                    return Padding(
                      padding: EdgeInsets.all(4),
                      child: GestureDetector(
                        onTap: () {
                          if (Platform.isAndroid) {
                            showModalBottomSheet(
                              context: context,
                              builder: (_) {
                                return ImageSourceModal(
                                  onImageSelected: onImageSelected,
                                );
                              },
                            );
                          } else {
                            showCupertinoModalPopup(
                              context: context,
                              builder: (_) {
                                return ImageSourceModal(
                                  onImageSelected: onImageSelected,
                                );
                              },
                            );
                          }
                        },
                        child: CircleAvatar(
                          radius: 44,
                          backgroundColor: Colors.grey[300],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_a_photo,
                                size: 35,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                },
              );
            },
          ),
        ),
        Observer(
          builder: (_) {
            if (createStore.errorMessage != null) {
              return Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.red)),
                ),
                child: Text(
                  '${createStore.errorMessage}',
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ],
    );
  }

  void onDelete() {}
}
