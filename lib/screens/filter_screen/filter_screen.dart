import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo/stores/filter_store.dart';
import 'package:xlo/stores/home_store.dart';

import 'components/order_by_field.dart';
import 'components/price_range_field.dart';
import 'components/vendor_type_field.dart';

class FilterScreen extends StatelessWidget {
  FilterScreen({super.key});
  final FilterStore filterStore = GetIt.I<HomeStore>().cloneFilter;

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
                Observer(
                  builder: (_) {
                    return Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: 16),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.purple,
                                disabledBackgroundColor: Colors.purple
                                    .withAlpha(120),
                              ),
                              onPressed:
                                  filterStore.isFormValid
                                      ? () {
                                        filterStore.save();
                                        Navigator.of(context).pop();
                                      }
                                      : null,
                              child: Text(
                                'Filtra',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
