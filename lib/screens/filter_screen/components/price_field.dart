import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PriceField extends StatelessWidget {
  const PriceField({
    super.key,
    required this.label,
    required this.onChange,
    required this.initialValue,
  });
  final String label;
  final Function(num?) onChange;
  final num? initialValue;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        initialValue: initialValue?.toString(),
        decoration: InputDecoration(
          prefixText: 'R\$ ',
          label: Text(label),
          border: OutlineInputBorder(),
          isDense: true,
        ),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          RealInputFormatter(),
        ],
        keyboardType: TextInputType.number,
        onChanged: (text) {
          onChange(num.tryParse(text.replaceAll('.', '')));
        },
      ),
    );
  }
}
