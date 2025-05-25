import 'package:flutter/material.dart';
import 'package:xlo/stores/filter_store.dart';

import 'components/order_by_field.dart';
import 'components/price_range_field.dart';
import 'components/vendor_type_field.dart';

class FilterScreen extends StatelessWidget {
  FilterScreen({super.key});
  final FilterStore filterStore = FilterStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Filtra Busca'), centerTitle: true),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 8,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                OrderByField(filter: filterStore),
                PriceRangeField(filterStore: filterStore),
                VendorTypeField(filter: filterStore),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
