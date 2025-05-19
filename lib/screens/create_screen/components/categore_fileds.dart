import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo/models/category.dart';
import 'package:xlo/screens/category_screen/category_screen.dart';

import '../../../stores/create_store.dart';

class CategoryFiled extends StatelessWidget {
  const CategoryFiled({super.key, required this.createStore});
  final CreateStore createStore;
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Column(
          children: [
            //
            ListTile(
              title: Text(
                'Categoria *',
                style: TextStyle(
                  fontSize: createStore.category != null ? 14 : 18,
                  fontWeight: FontWeight.w800,
                  color: Colors.grey,
                ),
              ),
              subtitle:
                  createStore.category != null
                      ? Text(
                        '${createStore.category?.name}',
                        style: TextStyle(color: Colors.black87, fontSize: 17),
                      )
                      : null,
              trailing: Icon(Icons.keyboard_arrow_down),
              onTap: () async {
                final category =
                    await showDialog(
                          context: context,
                          builder:
                              (_) => CategoryScreen(
                                showAll: false,
                                categorySelected: createStore.category,
                              ),
                        )
                        as Category;
                if (category != null) {
                  createStore.setCategory(category);
                }
              },
            ),
            if (createStore.categoryError != null)
              Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.red)),
                ),
                child: Text(
                  '${createStore.categoryError}',
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              )
            else
              Container(
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey)),
                ),
              ),
            //
          ],
        );
      },
    );
  }
}
