import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo/stores/home_store.dart';

import '../../components/custom_drawer/custom_drawer.dart';
import '../../models/ad.dart';
import 'components/ad_tile.dart';
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
      body: Column(
        children: [
          TopBar(),
          Expanded(
            child: Observer(
              builder: (_) {
                if (homeStore.error != null) {
                  return onErrorOrEmpty(false);
                }
                if (homeStore.loading) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularProgressIndicator(color: Colors.white),
                        SizedBox(height: 8),
                        Text(
                          'Carregando...',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                  );
                }
                if (homeStore.adList.isEmpty || homeStore.adList[0].isEmpty) {
                  return onErrorOrEmpty(true);
                }
                return ListView.builder(
                  itemCount: homeStore.adList[0].length,
                  itemBuilder: (context, index) {
                    Ad item = homeStore.adList[0][index];
                    return AdTile(ad: item);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget onErrorOrEmpty(bool empty) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          empty ? Icons.border_clear : Icons.error,
          color: Colors.white,
          size: 100,
        ),
        SizedBox(height: 8),
        Text(
          empty ? 'Humm... Nenhum anuncio encontrado' : 'Ocorreu um erro!',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
