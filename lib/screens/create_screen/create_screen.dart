import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xlo/components/custom_drawer/custom_drawer.dart';

import '../../stores/create_store.dart';
import 'components/image_fields.dart';

class CreateScreen extends StatelessWidget {
  CreateScreen({super.key});
  final CreateStore _createStore = CreateStore();

  @override
  Widget build(BuildContext context) {
    final labelStyle = TextStyle(
      fontWeight: FontWeight.w800,
      color: Colors.grey,
      fontSize: 16,
    );
    final contentPadding = EdgeInsets.fromLTRB(16, 10, 12, 10);
    final sizedBox = SizedBox(height: 8);
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Inserir Anuncio'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ImageField(createStore: _createStore),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Titulo *',
                    labelStyle: labelStyle,
                    contentPadding: contentPadding,
                  ),
                ),
                sizedBox,
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Descricao *',
                    labelStyle: labelStyle,
                    contentPadding: contentPadding,
                  ),
                  maxLines: null,
                ),
                sizedBox,
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Categoria *',
                    labelStyle: labelStyle,
                    contentPadding: contentPadding,
                  ),
                ),
                sizedBox,
                TextFormField(
                  decoration: InputDecoration(
                    prefixText: 'R\$ ',
                    labelText: 'Preço *',
                    labelStyle: labelStyle,
                    contentPadding: contentPadding,
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CentavosInputFormatter(moeda: true),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
