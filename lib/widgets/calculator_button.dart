import 'package:flutter/material.dart';

// creating Stateless Widget for buttons
class MyButton extends StatelessWidget {

// declaring variables

final String buttonText;
final void Function()? buttontapped;
final Color? color;
//Constructor
MyButton({required this.buttonText, this.buttontapped,this.color});

@override
Widget build(BuildContext context) {
	return GestureDetector(
	onTap:buttontapped, 
	child: Padding(
		padding: const EdgeInsets.all(3.2),
		child: ClipRRect(
		borderRadius: BorderRadius.circular(5),
		child: Container(
			color: color ?? Colors.white,
			child: Center(
			child: Text(
				buttonText,
				style: TextStyle(
				color: Colors.black,
				fontSize: 25,
				fontWeight: FontWeight.bold,
				),
			),
			),
		),
		),
	),
	);
}
}
