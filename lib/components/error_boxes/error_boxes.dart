import 'package:flutter/material.dart';

class ErrorBoxes extends StatelessWidget {
  const ErrorBoxes({super.key,this.message});
  final String? message;

  @override
  Widget build(BuildContext context) {
    if(message != null){
      return Container(
        color: Colors.red,
        child: Row(
          children: [
            Icon(Icons.error_outline,color: Colors.white,size: 40,),
            SizedBox(width: 16,),
            Expanded(child: Text('Oops! $message} tente novamente',style: TextStyle(color: Colors.white,fontSize: 14),))
          ],
        ),
      );
    }
    return Container();
  }
}
