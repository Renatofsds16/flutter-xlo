import 'package:flutter/material.dart';

class FieldTitle extends StatelessWidget {
  const FieldTitle({super.key,this.title,this.subTitle});
  final String? title;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 3,bottom: 4),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.end,
        children: [
          Text('$title',style: TextStyle(color: Colors.grey[800],fontSize: 16,fontWeight: FontWeight.w700),),
          SizedBox(width: 8,),
          Text('$subTitle',style: TextStyle(color: Colors.grey,fontSize: 12),),
        ],
      ),
    );
  }
}
