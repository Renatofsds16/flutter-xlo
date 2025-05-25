import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo/components/custom_drawer/custom_drawer.dart';
import 'package:xlo/components/error_boxes/error_boxes.dart';
import 'package:xlo/stores/page_stores.dart';

import '../../stores/create_store.dart';
import 'components/categore_fileds.dart';
import 'components/cep_field.dart';
import 'components/hide_phone_field.dart';
import 'components/image_fields.dart';

class CreateScreen extends StatefulWidget {
  CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final CreateStore _createStore = CreateStore();

  @override
  void initState() {
    super.initState();
    when((_) => _createStore.savedAd, () {
      GetIt.I<PageStores>().setPage(0);
    });
  }

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
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Observer(
                builder: (_) {
                  if (_createStore.loading) {
                    return Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text(
                            'Salvando anuncio',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.purple,
                            ),
                          ),
                          SizedBox(height: 16),
                          CircularProgressIndicator(color: Colors.purple),
                        ],
                      ),
                    );
                  } else {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ImageField(createStore: _createStore),
                        Observer(
                          builder: (_) {
                            return TextFormField(
                              onChanged: _createStore.setTitle,
                              decoration: InputDecoration(
                                labelText: 'Titulo *',
                                labelStyle: labelStyle,
                                errorText: _createStore.errorTitle,
                                contentPadding: contentPadding,
                              ),
                            );
                          },
                        ),
                        sizedBox,
                        Observer(
                          builder: (_) {
                            return TextFormField(
                              onChanged: _createStore.setDescription,
                              decoration: InputDecoration(
                                labelText: 'Descricao *',
                                labelStyle: labelStyle,
                                errorText: _createStore.descriptionError,
                                contentPadding: contentPadding,
                              ),
                              maxLines: null,
                            );
                          },
                        ),
                        sizedBox,
                        CategoryFiled(createStore: _createStore),
                        sizedBox,
                        CepField(createStore: _createStore),
                        sizedBox,
                        Observer(
                          builder: (_) {
                            return TextFormField(
                              onChanged: _createStore.setPrice,
                              decoration: InputDecoration(
                                prefixText: 'R\$ ',
                                labelText: 'Preço *',
                                labelStyle: labelStyle,
                                errorText: _createStore.priceError,
                                contentPadding: contentPadding,
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                CentavosInputFormatter(moeda: true),
                              ],
                            );
                          },
                        ),
                        HidePhoneField(createStore: _createStore),
                        Observer(
                          builder: (_) {
                            return ErrorBoxes(
                              message: _createStore.resultError,
                            );
                          },
                        ),
                        Observer(
                          builder: (_) {
                            return ElevatedButton(
                              onPressed: _createStore.sendPressed,

                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.purple,
                                disabledBackgroundColor: Colors.purple
                                    .withAlpha(50),
                              ),
                              child: Text(
                                'Cadastrar',
                                style: TextStyle(color: Colors.white),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
