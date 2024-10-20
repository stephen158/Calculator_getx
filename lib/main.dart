import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'calculator_controller.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatelessWidget {
  final CalculatorController calculatorController = Get.put(CalculatorController());

  CalculatorScreen({Key? key}) : super(key: key);

  Widget _values(String text, {Color? color}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          calculatorController.onButtonClick(text);
        },
        child: Container(
          margin: const EdgeInsets.all(8),
          height: 64,
          decoration: BoxDecoration(
            color: color ?? Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Calculator'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                alignment: Alignment.bottomRight,
                child: Obx(
                      () => Text(
                    calculatorController.displayText.value,
                    style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    _values('7'),
                    _values('8'),
                    _values('9'),
                    _values('/', color: Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    _values('4'),
                    _values('5'),
                    _values('6'),
                    _values('*', color: Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    _values('1'),
                    _values('2'),
                    _values('3'),
                    _values('-', color: Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    _values('0'),
                    _values('.'),
                    _values('='),
                    _values('+', color: Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    _values('C', color: Colors.redAccent),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
