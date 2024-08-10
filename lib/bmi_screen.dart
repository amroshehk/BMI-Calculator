import 'dart:math';

import 'package:bmi_calculator/bmi_result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}


class _BmiScreenState extends State<BmiScreen> {
  var height = 120.0;
  var weight = 70.0;
  var ageValue = 28.0;
  var isMale = true;
  static const platform = MethodChannel('samples.flutter.dev/battery');

  // Get battery level.
  String batteryLevel = 'Unknown battery level.';

  Future<void> getBatteryLevel() async {
    String batteryLevel;
    try {
      final result = await platform.invokeMethod<int>('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: Text("BMI Calculator"),
        titleTextStyle: TextStyle(
            fontSize: 23.0, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      body: Container(
        color: Colors.black87,
        child: Center(
          child: Column(
            // children: [
            //   Expanded(
            //     child: Padding(
            //       padding: const EdgeInsets.all(10.0),
            //       child: Row(
            //         children: [
            //           Expanded(
            //             child: GestureDetector(
            //               onTap: () {
            //                 isMale = true;
            //                 setState(() {});
            //               },
            //               child: Container(
            //                 decoration: BoxDecoration(
            //                     color:
            //                         isMale ? Colors.deepPurple[500] : Colors.black26,
            //                     borderRadius: BorderRadius.circular(20)),
            //                 child: Column(
            //                   mainAxisAlignment: MainAxisAlignment.center,
            //                   children: [
            //                     Image(
            //                       image: AssetImage('assets/images/male.webp'),
            //                       height: 90.0,
            //                       width: 90.0,
            //                     ),
            //                     SizedBox(
            //                       height: 10.0,
            //                     ),
            //                     Text(
            //                       "MALE",
            //                       style: TextStyle(
            //                           fontWeight: FontWeight.bold,
            //                           fontSize: 20.0,
            //                           color: Colors.white),
            //                     )
            //                   ],
            //                 ),
            //               ),
            //             ),
            //           ),
            //           SizedBox(width: 20.0),
            //           Expanded(
            //             child: GestureDetector(
            //               onTap: () {
            //                 isMale = false;
            //                 setState(() {});
            //               },
            //               child: Container(
            //                 decoration: BoxDecoration(
            //                     color:
            //                         isMale ? Colors.black26 : Colors.deepPurple[500],
            //                     borderRadius: BorderRadius.circular(20)),
            //                 child: const Column(
            //                   mainAxisAlignment: MainAxisAlignment.center,
            //                   children: [
            //                     Image(
            //                       image: AssetImage('assets/images/female.webp'),
            //                       height: 90.0,
            //                       width: 90.0,
            //                     ),
            //                     SizedBox(
            //                       height: 10.0,
            //                     ),
            //                     SizedBox(
            //                       height: 10.0,
            //                     ),
            //                     Text(
            //                       "FEMALE",
            //                       style: TextStyle(
            //                           fontWeight: FontWeight.bold,
            //                           fontSize: 20.0,
            //                           color: Colors.white),
            //                     )
            //                   ],
            //                 ),
            //               ),
            //             ),
            //           )
            //         ],
            //       ),
            //     ),
            //   ),
            //   Expanded(
            //     child: Padding(
            //       padding: const EdgeInsets.all(10.0),
            //       child: Container(
            //         decoration: BoxDecoration(
            //             color: Colors.black26,
            //             borderRadius: BorderRadius.circular(20)),
            //         child: Column(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             Text(
            //               "HEIGHT",
            //               style: TextStyle(
            //                   fontWeight: FontWeight.bold,
            //                   fontSize: 20.0,
            //                   color: Colors.white),
            //             ),
            //             Row(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               crossAxisAlignment: CrossAxisAlignment.baseline,
            //               textBaseline: TextBaseline.alphabetic,
            //               children: [
            //                 Text(
            //                   "${height.round()}",
            //                   style: TextStyle(
            //                       fontWeight: FontWeight.w900,
            //                       fontSize: 50.0,
            //                       color: Colors.white),
            //                 ),
            //                 SizedBox(
            //                   width: 10,
            //                 ),
            //                 Text(
            //                   "CM",
            //                   style: TextStyle(
            //                       fontWeight: FontWeight.bold,
            //                       fontSize: 20.0,
            //                       color: Colors.white),
            //                 )
            //               ],
            //             ),
            //             Slider(
            //               value: height,
            //               max: 220.0,
            //               min: 80.0,
            //               activeColor: Colors.deepPurple,
            //               onChanged: (value) {
            //                 height = value;
            //                 setState(() {});
            //               },
            //             )
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            //   Expanded(
            //     child: Padding(
            //       padding: const EdgeInsets.all(10.0),
            //       child: Row(
            //         children: [
            //           Expanded(
            //             child: Container(
            //               decoration: BoxDecoration(
            //                   color: Colors.black26,
            //                   borderRadius: BorderRadius.circular(20)),
            //               child: Column(
            //                 mainAxisAlignment: MainAxisAlignment.center,
            //                 children: [
            //                   Text(
            //                     "WEIGHT",
            //                     style: TextStyle(
            //                         fontWeight: FontWeight.bold,
            //                         fontSize: 20.0,
            //                         color: Colors.white),
            //                   ),
            //                   Text(
            //                     "${weight.round()}",
            //                     style: TextStyle(
            //                         fontWeight: FontWeight.w900,
            //                         fontSize: 50.0,
            //                         color: Colors.white),
            //                   ),
            //                   Row(
            //                     mainAxisAlignment: MainAxisAlignment.center,
            //                     children: [
            //                       FloatingActionButton(
            //                         onPressed: () {
            //                           weight--;
            //                           setState(() {});
            //                         },
            //                         child: Icon(Icons.remove),
            //                         mini: true,
            //                       ),
            //                       SizedBox(
            //                         width: 10,
            //                       ),
            //                       FloatingActionButton(
            //                         onPressed: () {
            //                           weight++;
            //                           setState(() {});
            //                         },
            //                         mini: true,
            //                         child: Icon(Icons.add),
            //                       ),
            //                     ],
            //                   )
            //                 ],
            //               ),
            //             ),
            //           ),
            //           SizedBox(width: 20.0),
            //           Expanded(
            //             child: Container(
            //               decoration: BoxDecoration(
            //                   color: Colors.black26,
            //                   borderRadius: BorderRadius.circular(20)),
            //               child: Column(
            //                 mainAxisAlignment: MainAxisAlignment.center,
            //                 children: [
            //                   Text(
            //                     "AGE",
            //                     style: TextStyle(
            //                         fontWeight: FontWeight.bold,
            //                         fontSize: 20.0,
            //                         color: Colors.white),
            //                   ),
            //                   Text(
            //                     "${ageValue.round()}",
            //                     style: TextStyle(
            //                         fontWeight: FontWeight.w900,
            //                         fontSize: 50.0,
            //                         color: Colors.white),
            //                   ),
            //                   Row(
            //                     mainAxisAlignment: MainAxisAlignment.center,
            //                     children: [
            //                       FloatingActionButton(
            //                         onPressed: () {
            //                           ageValue--;
            //                           setState(() {});
            //                         },
            //                         child: Icon(Icons.remove),
            //                         mini: true,
            //                       ),
            //                       SizedBox(
            //                         width: 10,
            //                       ),
            //                       FloatingActionButton(
            //                         onPressed: () {
            //                           ageValue++;
            //                           setState(() {});
            //                         },
            //                         mini: true,
            //                         child: Icon(Icons.add),
            //                       ),
            //                     ],
            //                   )
            //                 ],
            //               ),
            //             ),
            //           )
            //         ],
            //       ),
            //     ),
            //   ),
            //   Padding(
            //     padding: const EdgeInsets.only(top: 20.0),
            //     child: Container(
            //         height: 50.0,
            //         width: double.infinity,
            //         color: Colors.deepPurple,
            //         child: MaterialButton(
            //           onPressed: () {
            //             var result = weight / pow(height / 100, 2);
            //             var gender = isMale ? "Male" : "Female";
            //             Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                   builder: (context) => ResultScreen(
            //                       result: result, age: ageValue, gender: gender),
            //                 ));
            //           },
            //           child: Text(
            //             "CALCULATE",
            //             style: TextStyle(
            //               color: Colors.white,
            //               fontSize: 20.0,
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //         )),
            //   )
            // ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: getBatteryLevel,
                child: const Text('Get Battery Level'),
              ),
              Text(batteryLevel),
            ],
          ),
        ),
      ),
    );
  }
}
