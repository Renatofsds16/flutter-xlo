import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo/screens/filter_screen/components/price_field.dart';
import 'package:xlo/screens/filter_screen/components/section_title.dart';
import 'package:xlo/stores/filter_store.dart';

class PriceRangeField extends StatelessWidget {
  const PriceRangeField({super.key, required this.filterStore});
  final FilterStore filterStore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: 'Price'),
        Row(
          children: [
            PriceField(
              label: 'Min',
              onChange: filterStore.setMinPrice,
              initialValue: filterStore.minPrice,
            ),
            const SizedBox(width: 16),
            PriceField(
              label: 'Preço Max',
              onChange: filterStore.setMaxPrice,
              initialValue: filterStore.minPrice,
            ),
          ],
        ),
        Observer(
          builder: (_) {
            if (filterStore.priceError != null) {
              return Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  '${filterStore.priceError}',
                  style: TextStyle(color: Colors.redAccent, fontSize: 12),
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
