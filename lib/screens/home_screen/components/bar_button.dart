import 'package:flutter/material.dart';

class BarButton extends StatelessWidget {
  const BarButton({
    super.key,
    required this.label,
    required this.decoration,
    this.onTap,
  });
  final String label;
  final VoidCallback? onTap;
  final BoxDecoration decoration;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 50,
          alignment: Alignment.center,
          decoration: decoration,
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
