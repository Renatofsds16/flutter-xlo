import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo/stores/home_store.dart';

import '../../components/custom_drawer/custom_drawer.dart';
import 'components/search_dialog.dart';
import 'components/top_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeStore homeStore = GetIt.I<HomeStore>();

  _openSearch(BuildContext context) async {
    final search = await showDialog(
      context: context,
      builder: (_) => SearchDialog(currentSearch: homeStore.search),
    );
    if (search != null) {
      homeStore.setSearch(search);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.purple,
        title: Observer(
          builder: (_) {
            if (homeStore.search.isEmpty) {
              return Text('Xlo');
            } else {
              return GestureDetector(
                onTap: () => _openSearch(context),
                child: LayoutBuilder(
                  builder: (_, constrains) {
                    return SizedBox(
                      width: constrains.biggest.width,
                      child: Text(homeStore.search),
                    );
                  },
                ),
              );
            }
          },
        ),
        centerTitle: true,
        actions: [
          Observer(
            builder: (_) {
              if (homeStore.search.isEmpty) {
                return IconButton(
                  onPressed: () {
                    _openSearch(context);
                  },
                  icon: Icon(Icons.search),
                );
              } else {
                return IconButton(
                  onPressed: () {
                    homeStore.setSearch('');
                  },
                  icon: Icon(Icons.close),
                );
              }
            },
          ),
        ],
      ),
      body: Column(children: [TopBar()]),
    );
  }
}
