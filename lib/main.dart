import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1, rightDiceNumber = 1;
  void changeDice() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
    //setState method calls the build method again , which looks for part of code that
    // use what is inside this method and reevaluates or re render them with the new state
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: TextButton(
              onPressed: () {
                changeDice();
              },
              child: Image.asset('images/dice$leftDiceNumber.png'),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                changeDice();
              },
              child: Image.asset('images/dice$rightDiceNumber.png'),
            ),
          ),
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.red,
          appBar: AppBar(
            title: Center(child: Text("Dicee")),
            backgroundColor: Colors.red,
          ),
          body: DicePage(),
        ),
      ),
    );
  }
}

//THe images we have here are too large for the screen to fit. So either we can change the width of the images , but that is
//hardcoded. So we use a widget named Expanded which can be only used inside a row column or flex
//Using an Expanded widget makes a child of a Row, Column, or Flex expand to fill the available space along the main axis (e.g., horizontally for a Row or vertically for a Column).
// If multiple children are expanded, the available space is divided among them according to the flex factor.

//Expanded is single child widget

//Instead of using a Image() widget and then providing the image property and then providing it with a path using an
// Image Provider like AssetImage() we can directly use the constructor Image.asset() , Image.network()

//the TextButton already comes with some padding hence padding widget removed, also the onPressed property is required with a
//button and it expects a void VoidCallback ()
//Signature of callbacks that have no arguments and return no data.
//onPressed: (){
// }  it's just like a callback in JavaScript, anonymous function

//Insights about dart
//Note it is a statically typed language
//var a = 'Dhruv'; a = 123 ; is not possible , here a is a statically typed variable
//Also it can be used as dynamically typed language
// var a; //Declare a dynamically typed variable
//a = 'Dhruv';
//a = 123; //Works fine

//String a; , int a; double a; //Other ways to create static data types

//StateFul and Stateless widgets : stless are those which remain as they are wheras stateful widgets change
