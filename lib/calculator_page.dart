import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'calci_button.dart';
import 'providers/calculator_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userInput = '';
  var answer = '';

// Array of button
  final List<String> buttons = [
    '9',
    '8',
    '7',
    '+',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    'x',
    'AC',
    '0',
    '=',
    '/',
  ];

  @override
  Widget build(BuildContext context) {
    final calculatorProvider = Provider.of<CalculatorProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ),
       backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        calculatorProvider.userInput,
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      alignment: Alignment.centerRight,
                      child: Text(
                        calculatorProvider.answer,
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ]),
            ),
          ),
          Expanded(
            flex: 2,
            child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (BuildContext context, int index) {
                  // Equal Button
                  if (index == 14) {
                    return MyButton(
                      buttontapped: () {
                        calculatorProvider.equalPressed();
                      },
                      buttonText: buttons[index],
                      color: Colors.blue,
                    );
                  }
                  else if(index == 12){
                    return MyButton(
                      buttontapped: () {
                        calculatorProvider.clear();
                      },
                      buttonText: buttons[index],
                      color: Colors.blue,
                    );
                  }
                  // Number Buttons
                  else {
                    return MyButton(
                      buttontapped: () {
                        // print(buttons[index]);
                        calculatorProvider.buttonPressed(buttons[index]);
                      },
                      buttonText: buttons[index],
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}
