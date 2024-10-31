import 'package:flutter/material.dart';
import 'package:flutter_demo/provider/calculator_provider.dart';
import 'package:provider/provider.dart';

class CustomButton extends StatelessWidget{
    final String symbol;
    final Color textColor;
    final Color bgColor;

    const CustomButton({required this.symbol,required this.textColor,required this.bgColor,super.key});


    @override
        Widget build(BuildContext context) {

            return ElevatedButton(
                onPressed: ()=>{
                        context.read<CalculatorProvider>().insert(symbol)
                    },
                style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(8),
                    backgroundColor: bgColor,
                    fixedSize: Size(80, 80)

                    ),
                child: Text(
                    symbol,
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.normal,
                        color: textColor,
                        ),
                    ));

        }
}

class ZeroButton extends StatelessWidget{
  final String symbol;
  final Color textColor;
  final Color bgColor;

  const ZeroButton({required this.symbol,required this.textColor,required this.bgColor,super.key});


  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
      onPressed: ()=>{
            context.read<CalculatorProvider>().insert(symbol)

          },
      style: ElevatedButton.styleFrom(
        shape: StadiumBorder(),
        padding: EdgeInsets.only(left: 68, top: 8, right: 68, bottom: 8),
        backgroundColor: bgColor,
          fixedSize: Size(180, 80)
      ),
      child: Text(
        symbol,
        style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.normal,
          color:textColor
        ),
      ),
    );

  }
}
