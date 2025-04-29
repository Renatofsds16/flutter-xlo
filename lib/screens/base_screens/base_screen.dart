import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo/screens/create_screen/create_screen.dart';
import 'package:xlo/screens/login_screen/login_screen.dart';
import 'package:xlo/stores/page_stores.dart';

import '../home_screen/home_screen.dart';
class BaseScreen extends StatefulWidget {
  BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final PageController _pageController = PageController();
  final PageStores _pageStores = GetIt.I<PageStores>();

  @override
  void initState() {
    super.initState();
    autorun((_){
      _pageController.jumpToPage(_pageStores.page);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_){
          return PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: [
              HomeScreen(),
              CreateScreen(),
              Container(color: Colors.red),
              Container(color: Colors.grey),
              Container(color: Colors.green),
            ],
          );
        },
      ),
    );
  }
}
