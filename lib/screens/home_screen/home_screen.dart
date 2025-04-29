import 'package:flutter/material.dart';

import '../../components/custom_drawer/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Xlo'),
        centerTitle: true,
      ),
      body: Container(width: 200, height: 200, color: Colors.purple),
    );
  }
}
