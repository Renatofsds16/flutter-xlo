import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo/components/error_boxes/error_boxes.dart';
import 'package:xlo/stores/cep_store.dart';

class CepField extends StatelessWidget {
  CepField({super.key});
  final CepStore _cepStore = CepStore();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          keyboardType: TextInputType.number,
          onChanged: _cepStore.setCep,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            CepInputFormatter(),
          ],
          decoration: InputDecoration(
            labelText: 'CEP *',
            contentPadding: EdgeInsets.fromLTRB(16, 10, 12, 10),
            labelStyle: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
        ),
        Observer(
          builder: (_) {
            if (_cepStore.clearCep == null &&
                _cepStore.errorText == null &&
                !_cepStore.loading) {
              return Container();
            } else if (_cepStore.clearCep == null &&
                _cepStore.errorText == null) {
              return LinearProgressIndicator(color: Colors.white);
            } else if (_cepStore.errorText != null) {
              return ErrorBoxes(message: '${_cepStore.errorText}');
            } else if (_cepStore.address != null) {
              final a = _cepStore.address;
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
