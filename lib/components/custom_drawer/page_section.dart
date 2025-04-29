import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo/components/custom_drawer/page_title.dart';

import '../../stores/page_stores.dart';
class PageSection extends StatelessWidget {
  PageSection({super.key});
  final PageStores _pageStores = GetIt.I<PageStores>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_){
        return Column(
          children: [
            PageTitle(
              label: 'Anuncios',
              iconData: Icons.list,
              onTap: (){
                _pageStores.setPage(0);
              },
              highlighted: _pageStores.page == 0,
            ),
            PageTitle(
              label: 'Inserir Anuncio',
              iconData: Icons.edit,
              onTap: (){
                _pageStores.setPage(1);
              },
              highlighted: _pageStores.page == 1,
            ),
            PageTitle(
              label: 'Chat',
              iconData: Icons.chat,
              onTap: (){
                _pageStores.setPage(2);
              },
              highlighted: _pageStores.page == 2,
            ),
            PageTitle(
              label: 'Favoritos',
              iconData: Icons.favorite,
              onTap: (){
                _pageStores.setPage(3);
              },
              highlighted: _pageStores.page == 3,
            ),
            PageTitle(
              label: 'Minha Conta',
              iconData: Icons.person,
              onTap: (){
                _pageStores.setPage(4);
              },
              highlighted: _pageStores.page == 4,
            ),
          ],
        );
      },

    );
  }
}
