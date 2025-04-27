import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({super.key,this.label,this.iconData,this.onTap,required  this.highlighted});
  final String? label;
  final IconData? iconData;
  final VoidCallback? onTap;
  final bool highlighted;



  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('$label',style: TextStyle(fontWeight:FontWeight.w700,color: highlighted ? Colors.purple: Colors.black54,),),
      leading: Icon(iconData,color: highlighted ? Colors.purple: Colors.black54,),
      onTap: onTap,
    );
  }
}
