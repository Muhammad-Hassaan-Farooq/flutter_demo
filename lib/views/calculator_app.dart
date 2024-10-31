import 'package:flutter/material.dart';
import 'package:flutter_demo/views/display.dart';
import 'package:flutter_demo/views/keypad.dart';
import 'package:flutter_demo/views/button.dart';

class CalculatorApp extends StatelessWidget{

    const CalculatorApp({super.key});

    @override
        Widget build(BuildContext context) {
            return Center(child: Column(
                        children: [
                            Spacer(),
                            Display(),
                            Keypad(),

                        ],),);
        }
}
