import 'package:flutter/material.dart';
import 'package:xlo/models/ad.dart';

class AdTile extends StatelessWidget {
  const AdTile({super.key, required this.ad});
  final Ad? ad;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2, vertical: 1),
      height: 135,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 8,
        child: Row(
          children: [
            if (ad?.images != null)
              SizedBox(
                height: 135,
                width: 127,
                child: Image.network(ad?.images?.first, fit: BoxFit.cover),
              ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${ad?.title}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'R\$ ${ad?.price?.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),

                  Text(
                    '${ad?.address?.city?.name} -'
                    ' ${ad?.address?.uf?.initials}',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
