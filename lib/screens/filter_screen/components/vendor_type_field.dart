import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo/screens/filter_screen/components/section_title.dart';
import 'package:xlo/stores/filter_store.dart';

class VendorTypeField extends StatelessWidget {
  const VendorTypeField({super.key, required this.filter});
  final FilterStore filter;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: 'Tipo de Anunciante'),
        Observer(
          builder: (_) {
            return Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (filter.isTypeParticular) {
                        if (filter.isTypeProfessional) {
                          filter.resetVendorType(VENDOR_TYPE_PARTICULAR);
                        } else {
                          filter.selectorVendorType(VENDOR_TYPE_PROFESSIONAL);
                        }
                      } else {
                        filter.setVendorType(VENDOR_TYPE_PARTICULAR);
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color:
                              filter.isTypeParticular
                                  ? Colors.black54
                                  : Colors.purple,
                        ),
                        color:
                            filter.isTypeParticular
                                ? Colors.purple
                                : Colors.transparent,
                      ),
                      child: Text(
                        'Particular',
                        style: TextStyle(
                          color:
                              filter.isTypeParticular
                                  ? Colors.white
                                  : Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (filter.isTypeProfessional) {
                        if (filter.isTypeParticular) {
                          filter.resetVendorType(VENDOR_TYPE_PROFESSIONAL);
                        } else {
                          filter.selectorVendorType(VENDOR_TYPE_PARTICULAR);
                        }
                      } else {
                        filter.setVendorType(VENDOR_TYPE_PROFESSIONAL);
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color:
                              filter.isTypeProfessional
                                  ? Colors.black54
                                  : Colors.purple,
                        ),
                        color:
                            filter.isTypeProfessional
                                ? Colors.purple
                                : Colors.transparent,
                      ),
                      child: Text(
                        'Profissional',
                        style: TextStyle(
                          color:
                              filter.isTypeProfessional
                                  ? Colors.white
                                  : Colors.black54,
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
    );
  }
}
