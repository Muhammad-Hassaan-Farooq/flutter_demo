import 'package:flutter/material.dart';
import 'package:flutter_demo/views/button.dart';

class Keypad extends StatelessWidget{


    @override
        Widget build(BuildContext context) {

            return Column(
                    children: [
                    Row1(),
                    Row2(),
                    Row3(),
                    Row4(),
                    Row5()
                    ],
                    );
        }
}


class Row1 extends StatelessWidget{
    @override
        Widget build(BuildContext context) {
            return const Padding(
                    padding:EdgeInsets.only(bottom: 8),
                    child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                        CustomButton(symbol:"AC" , textColor: Colors.black, bgColor: Color(0xffa5a5a5),),
                        CustomButton(symbol:"+/-" , textColor: Colors.black, bgColor: Color(0xffa5a5a5),),
                        CustomButton(symbol:"%" , textColor: Colors.black, bgColor: Color(0xffa5a5a5),),
                        CustomButton(symbol:"÷" , textColor: Colors.white, bgColor: Color(0xffff9f0b),),

                        ],));
        }
}

class Row2 extends StatelessWidget{
    @override
        Widget build(BuildContext context) {
            return const Padding(
                    padding:EdgeInsets.only(bottom: 8),
                    child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                        CustomButton(symbol:"7", textColor: Colors.white, bgColor: Color(0xff333333),),
                        CustomButton(symbol:"8" , textColor: Colors.white, bgColor: Color(0xff333333),),
                        CustomButton(symbol:"9" , textColor: Colors.white, bgColor: Color(0xff333333),),
                        CustomButton(symbol:"×" , textColor: Colors.white,bgColor: Color(0xffff9f0b), ),

                        ],));
        }
}
class Row3 extends StatelessWidget{
    @override
        Widget build(BuildContext context) {
            return const Padding(
                    padding:EdgeInsets.only(bottom: 8),
                    child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                        CustomButton(symbol:"4" , textColor: Colors.white, bgColor: Color(0xff333333),),
                        CustomButton(symbol:"5" , textColor: Colors.white, bgColor: Color(0xff333333),),
                        CustomButton(symbol:"6" , textColor: Colors.white, bgColor: Color(0xff333333),),
                        CustomButton(symbol:"-" , textColor: Colors.white,bgColor: Color(0xffff9f0b),),

                        ],));
        }
}
class Row4 extends StatelessWidget{
    @override
        Widget build(BuildContext context) {
            return const Padding(
                    padding:EdgeInsets.only(bottom: 8),
                    child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                        CustomButton(symbol:"1" , textColor: Colors.white, bgColor: Color(0xff333333),),
                        CustomButton(symbol:"2" , textColor: Colors.white, bgColor: Color(0xff333333),),
                        CustomButton(symbol:"3" , textColor: Colors.white, bgColor: Color(0xff333333),),
                        CustomButton(symbol:"+", textColor: Colors.white, bgColor: Color(0xffff9f0b),),

                        ],));
        }
}

class Row5 extends StatelessWidget{
    @override
        Widget build(BuildContext context) {
            return const Padding(
                    padding:EdgeInsets.only(bottom: 20),
                    child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                        ZeroButton(symbol:"0",textColor: Colors.white, bgColor: Color(0xff333333),),
                        CustomButton(symbol:"." , textColor: Colors.white, bgColor: Color(0xff333333),),
                        CustomButton(symbol:"=" , textColor: Colors.white,bgColor: Color(0xffff9f0b),),
                        ],));
        }
}
