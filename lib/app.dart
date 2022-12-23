import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'calculator_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

@override
Widget build(BuildContext context) {
	return MaterialApp(
	debugShowCheckedModeBanner: false,
	home: HomePage(),
	); 
}
}