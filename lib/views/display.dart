import 'package:flutter/material.dart';
import 'package:flutter_demo/main.dart';
import 'package:flutter_demo/provider/calculator_provider.dart';
import 'package:provider/provider.dart';

class Display extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String displayText = context.watch<CalculatorProvider>().displayText;
    double result = context.watch<CalculatorProvider>().previousNum;

    return Column(
      children: [
          Container(
              alignment: Alignment.centerRight,
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  child: Padding(
                      padding: EdgeInsets.only(right: 35),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                              Text(
                                  result.toString(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                  ),
                              )
                          ]))))
          ,
        Container(
            alignment: Alignment.centerRight,
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                reverse: true,
                child: Padding(
                    padding: EdgeInsets.only(right: 35),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            displayText,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 75,
                            ),
                          )
                        ]))))
      ],
    );
  }
}
