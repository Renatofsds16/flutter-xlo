import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo/components/error_boxes/error_boxes.dart';
import 'package:xlo/stores/category_store.dart';

import '../../models/category.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key, this.showAll = false, this.categorySelected});
  final CategoryStore _categoryStore = GetIt.I<CategoryStore>();
  final Category? categorySelected;
  final bool showAll;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Categorias'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: EdgeInsets.fromLTRB(32, 12, 32, 32),
          child: Observer(
            builder: (_) {
              if (_categoryStore.error != null) {
                return ErrorBoxes(message: _categoryStore.error);
              } else if (_categoryStore.listCategory.isEmpty) {
                return CircularProgressIndicator(color: Colors.white);
              } else {
                return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (_, index) {
                    final category =
                        showAll
                            ? _categoryStore.allCategoryList[index]
                            : _categoryStore.listCategory[index];

                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pop(category);
                      },
                      child: Container(
                        height: 50,
                        color:
                            category.id == categorySelected?.id
                                ? Colors.purple.withAlpha(50)
                                : null,
                        child: Text(
                          '${category.name}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight:
                                category.id == categorySelected?.id
                                    ? FontWeight.w700
                                    : null,
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, __) {
                    return Divider(height: 0.1, color: Colors.grey);
                  },
                  itemCount:
                      showAll
                          ? _categoryStore.listCategory.length + 1
                          : _categoryStore.listCategory.length,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
