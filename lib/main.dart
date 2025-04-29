import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo/stores/category_store.dart';
import 'package:xlo/stores/page_stores.dart';
import 'package:xlo/stores/user_manage_store.dart';

import 'codes.dart';
import 'screens/base_screens/base_screen.dart';

void setupLocator() {
  GetIt.I.registerSingleton(PageStores());
  GetIt.I.registerSingleton(UserManageStore());
  GetIt.I.registerSingleton(CategoryStore());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CodesParse.initializeParse();
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'xlo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.purple,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        primaryColor: Colors.purple,
      ),
      home: BaseScreen(),
    );
  }
}
