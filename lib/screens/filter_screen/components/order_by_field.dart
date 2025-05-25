import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo/screens/filter_screen/components/section_title.dart';
import 'package:xlo/stores/filter_store.dart';

class OrderByField extends StatelessWidget {
  const OrderByField({super.key, required this.filter});
  final FilterStore filter;

  @override
  Widget build(BuildContext context) {
    ElevatedButton lButton(title, OrderBy option) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor:
              filter.orderBy == option ? Colors.white : Colors.purple,
          backgroundColor:
              filter.orderBy == option ? Colors.purple : Colors.white,
        ),
        onPressed: () {
          filter.setOrderBy(option);
        },
        child: Text(title),
      );
    }

    return Observer(
      builder: (_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SectionTitle(title: 'Ordenar por'),
            Row(
              children: [
                lButton('Data', OrderBy.DATA),
                const SizedBox(width: 32),
                lButton('Preço', OrderBy.PRICE),
              ],
            ),
          ],
        );
      },
    );
  }
}
