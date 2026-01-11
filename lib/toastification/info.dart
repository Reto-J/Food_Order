import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

void showInfoMessage(BuildContext context, String message){
  toastification.show(
	  context: context,
	  type: ToastificationType.info,
	  style: ToastificationStyle.flatColored,
	  title: Text("Information"),
	  description: Text(message),
	  alignment: Alignment.topCenter,
	  autoCloseDuration: const Duration(seconds: 4),
     animationBuilder: (context, animation, alignment, child) {
	    return ScaleTransition(scale: animation, child: child);
	  },
	  backgroundColor: Color(0xFF47AFFF),
	  icon: Icon(Icons.info_outline_rounded),
	  borderRadius: BorderRadius.circular(12.0),
	  boxShadow: lowModeShadow,
	  dragToClose: true,
	);
}