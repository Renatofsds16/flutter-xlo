import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo/screens/category_screen/category_screen.dart';
import 'package:xlo/stores/home_store.dart';

import '../../filter_screen/filter_screen.dart';
import 'bar_button.dart';

class TopBar extends StatelessWidget {
  TopBar({super.key});
  final HomeStore homeStore = GetIt.I<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Observer(
          builder: (_) {
            return BarButton(
              label: homeStore.category?.name ?? 'Categoria',
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey)),
              ),
              onTap: () async {
                final category = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder:
                        (context) => CategoryScreen(
                          showAll: true,
                          categorySelected: homeStore.category,
                        ),
                  ),
                );
                if (category != null) {
                  homeStore.setCategory(category);
                }
              },
            );
          },
        ),
        BarButton(
          label: 'Filtros',
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey),
              left: BorderSide(color: Colors.grey),
            ),
          ),
          onTap: () async {
            final result = await Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (_) => FilterScreen()));
          },
        ),
      ],
    );
  }
}
