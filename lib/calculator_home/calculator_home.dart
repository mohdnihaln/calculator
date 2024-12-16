import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/calculator_controller.dart';


// ignore: must_be_immutable
class CalculatorHome extends StatelessWidget {
  
  CalculatorController calculatorController = Get.put(CalculatorController());

  CalculatorHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text(style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white ), 'Calculator'),
      centerTitle: true,
      backgroundColor: Colors.grey.withOpacity(.2),),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      
                  Obx(() => Text(
                        calculatorController.input.value,
                        style: const TextStyle(fontSize: 30, color: Colors.white),
                      )),
                      FloatingActionButton(
                                       onPressed: () { 
                      calculatorController.backspace();
                      },
                        backgroundColor: Colors.grey.withOpacity(.3), // Set background color to grey
                        foregroundColor: Colors.white, // Set text/icon color to white
                        child: Text("<-"), 
                      ),
                      ],
                      ),
                      Obx(() => Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Text(
                                    calculatorController.result.value,
                                    style: const TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                            ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: Text( style: TextStyle(color: Colors.white.withOpacity(.5), fontSize: 40 ), "="),
                                )
                          ],
                        )
                            ),
                       
                ],
              ),
            ),
          ),
          Column(
            children: [
                           Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildButton('AC', backgroundColor: Colors.grey.withOpacity(.3), textColor: Colors.black),
                buildButton('C', backgroundColor: Colors.grey.withOpacity(.3), textColor: Colors.black),
                buildButton('%', backgroundColor: Colors.grey.withOpacity(.3), textColor: Colors.black),
                buildButton('/', backgroundColor: Colors.amber, textColor: Colors.white),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildButton('7', backgroundColor: Colors.grey.withOpacity(.3), textColor: Colors.white),
                buildButton('8', backgroundColor: Colors.grey.withOpacity(.3), textColor: Colors.white),
                buildButton('9', backgroundColor: Colors.grey.withOpacity(.3), textColor: Colors.white),
                buildButton('x', backgroundColor: Colors.amber, textColor: Colors.white),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildButton('4', backgroundColor: Colors.grey.withOpacity(.3), textColor: Colors.white),
                buildButton('5', backgroundColor: Colors.grey.withOpacity(.3), textColor: Colors.white),
                buildButton('6', backgroundColor: Colors.grey.withOpacity(.3), textColor: Colors.white),
                buildButton('-', backgroundColor: Colors.amber, textColor: Colors.white),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildButton('1', backgroundColor: Colors.grey.withOpacity(.3), textColor: Colors.white),
                buildButton('2', backgroundColor: Colors.grey.withOpacity(.3), textColor: Colors.white),
                buildButton('3', backgroundColor: Colors.grey.withOpacity(.3), textColor: Colors.white),
                buildButton('+', backgroundColor: Colors.amber, textColor: Colors.white),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
               buildButton('0', backgroundColor:  Colors.grey.withOpacity(.3), textColor:  Colors.white),
               buildButton('00',backgroundColor:  Colors.grey.withOpacity(.3), textColor: Colors.white),
               buildButton('.', backgroundColor:  Colors.grey.withOpacity(.3), textColor:  Colors.white),
               buildButton('=',backgroundColor:  Colors.amber, textColor:  Colors.white),
              ],
            ),
           
        ],
      ),
        ]
      )
    );
  }
    Widget buildButton(String text, {Color? backgroundColor, Color? textColor}) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          if (text == 'C') {
            calculatorController.clear();
          } else if (text == 'AC'){
            calculatorController.clearAll();
          } else if (text == "<-"){
            calculatorController.backspace();
          } else if (text == '=') {
            calculatorController.calculate();
          } else {
            calculatorController.appendInput(text);
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor:  backgroundColor ?? Colors.blue,
          padding: const EdgeInsets.all(20),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 24 , color: Colors.white),
        ),
      ),
    );
  }
}

