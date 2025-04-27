import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
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
    reaction((_)=>_pageStores.page, (page)=> _pageController.jumpToPage(page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          HomeScreen(),
          Container(color: Colors.white),
          Container(color: Colors.red),
          Container(color: Colors.grey),
          Container(color: Colors.green),
        ],
      ),
    );
  }
}
