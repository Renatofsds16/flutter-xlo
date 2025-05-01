import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo/stores/create_store.dart';

class HidePhoneField extends StatelessWidget {
  const HidePhoneField({super.key, required this.createStore});
  final CreateStore createStore;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6),
      child: Row(
        children: [
          Observer(
            builder: (_) {
              return Checkbox(
                value: createStore.hidePhone,
                onChanged: (bool? value) {
                  if (value != null) {
                    createStore.setHidePhone(value);
                  }
                },
              );
            },
          ),
          Expanded(child: Text('Oculta meu telefone nesse anuncio')),
        ],
      ),
    );
  }
}
