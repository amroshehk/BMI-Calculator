import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        children: [
          Container(color: Colors.red,
            
          ),
          Container(color: Colors.red,

          ),
          Container(color: Colors.red,

          ),
          MaterialButton(onPressed: (){},child: Text("Calculator"),)
        ],
      ),
    );
  }
}
