import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo/screens/login_screen/login_screen.dart';
import 'package:xlo/stores/user_manage_store.dart';

import '../../stores/page_stores.dart';

class CustomDrawerHeader extends StatelessWidget {
  CustomDrawerHeader({super.key});
  final UserManageStore _userManageStore = GetIt.I<UserManageStore>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(_userManageStore.isLoggedIn) {
          GetIt.I<PageStores>().setPage(4);
        }else{
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => LoginScreen()));
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        height: 100,
        color: Colors.purple,
        child: Row(
          children: [
            Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8
                ),
                child: Icon(Icons.person, color: Colors.white, size: 40)),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _userManageStore.isLoggedIn
                        ? '${_userManageStore.user?.name}'
                        : 'Acessa sua conta',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _userManageStore.isLoggedIn
                        ? '${_userManageStore.user?.email}'
                        : 'clique aqui',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
