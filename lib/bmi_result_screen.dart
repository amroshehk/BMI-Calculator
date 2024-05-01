import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
 // const ResultScreen({super.key});

  final double result;
  final double age;
  final String gender;

  ResultScreen({
    required this.result,
    required this.age,
    required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.keyboard_arrow_left), onPressed: () {
          Navigator.pop(context);
        },),
        title: Text("Result"),

      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Gender : $gender",style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),),
            Text("Result: ${result.round()}",style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
            Text("Age: ${age.round()}",style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
