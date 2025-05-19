import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo/components/error_boxes/error_boxes.dart';

import '../../../stores/cep_store.dart';
import '../../../stores/create_store.dart';

class CepField extends StatelessWidget {
  CepField({super.key, required this.createStore})
    : cepStore = createStore.cepStore;
  final CreateStore createStore;
  final CepStore? cepStore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Observer(
          builder: (_) {
            return TextFormField(
              keyboardType: TextInputType.number,
              onChanged: cepStore?.setCep,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CepInputFormatter(),
              ],
              decoration: InputDecoration(
                labelText: 'CEP *',
                errorText: createStore.addressError,
                contentPadding: EdgeInsets.fromLTRB(16, 10, 12, 10),
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            );
          },
        ),
        Observer(
          builder: (_) {
            if (cepStore?.clearCep == null &&
                cepStore?.errorText == null &&
                !cepStore!.loading) {
              return Container();
            } else if (cepStore?.clearCep == null &&
                cepStore?.errorText == null) {
              return LinearProgressIndicator(color: Colors.white);
            } else if (cepStore?.errorText != null) {
              return ErrorBoxes(message: '${cepStore?.errorText}');
            } else if (createStore.address != null) {
              final a = createStore.address;
              return Container(
                color: Colors.purple.withAlpha(50),
                height: 50,
                padding: EdgeInsets.all(8),
                child: Text(
                  textAlign: TextAlign.center,
                  'Localização: ${a?.rua} ${a?.district} ${a?.city?.name} ${a?.uf?.initials}',
                ),
              );
            }
            return Container();
          },
        ),
      ],
    );
  }
}
