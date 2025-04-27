import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:xlo/stores/page_stores.dart';

import 'codes.dart';
import 'screens/base_screens/base_screen.dart';
void setupLocator(){
  GetIt.I.registerSingleton(PageStores());
}
void main()async {
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
      ),
      home: BaseScreen(),
    );
  }
}
