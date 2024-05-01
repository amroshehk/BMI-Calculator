import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  var value1 = 120.0;
  var weghitValue = 60.0;
  var ageValue = 28.0;
  var isMale = true;
  var isFeMale = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
               children: [
                 Expanded(
                   child: GestureDetector(
                     onTap: () {
                       isMale =true;
                       setState(() {

                       });
                     },
                     child: Container(
                       decoration: BoxDecoration(
                         color: isMale? Colors.purple[200] :Colors.grey[400],
                        borderRadius:BorderRadius.circular(20)
                       ),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Image(image: AssetImage('assets/images/male.webp')
                           ,height: 90.0,width: 90.0,),
                           SizedBox(height: 10.0,),
                           Text("MALE"   ,style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20.0),)
                         ],
                       ),
                     ),
                   ),
                 ),
                 SizedBox(width: 20.0),
                 Expanded(
                   child: GestureDetector(
                     onTap: () {
                       isMale = false;
                       setState(() {

                       });
                     },
                     child: Container(
                       decoration: BoxDecoration(
                           color: isMale? Colors.grey[400] :Colors.purple[200],
                           borderRadius:BorderRadius.circular(20)
                       ),
                       child: const Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Image(image: AssetImage('assets/images/female.webp')
                             ,height: 90.0,width: 90.0,),
                           SizedBox(height: 10.0,),
                           SizedBox(height: 10.0,),
                           Text("FEMALE"   ,style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20.0),)
                         ],
                       ),
                     ),
                   ),
                 )
               ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius:BorderRadius.circular(20)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("HEIGHT"  ,style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20.0),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text("${value1.round()}"   ,style: TextStyle(fontWeight:FontWeight.w900,fontSize: 50.0),),
                      SizedBox(width: 10,),
                      Text("CM"   ,style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20.0),)
                    ],
                  ),
                  Slider(value: value1,
                      max: 220.0,
                      min: 80.0,
                      activeColor: Colors.purple,
                      onChanged: (value) {
                        value1 = value;
                        setState(() {

                        });
                      },)
                ],
                ),
              ),
            ),
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius:BorderRadius.circular(20)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("WEIGHT"   ,style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20.0),),
                            Text("${weghitValue.round()}"   ,style: TextStyle(fontWeight:FontWeight.w900,fontSize: 50.0),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(onPressed: (){
                                  weghitValue--;
                                  setState(() {

                                  });
                                },child:  Icon(Icons.remove),
                                mini: true,),
                                SizedBox(width: 10,),
                                FloatingActionButton(onPressed: (){
                                  weghitValue++;
                                  setState(() {

                                  });
                                }, mini: true,child:    Icon(Icons.add),),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius:BorderRadius.circular(20)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("AGE"   ,style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20.0),),
                            Text("${ageValue.round()}"   ,style: TextStyle(fontWeight:FontWeight.w900,fontSize: 50.0),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(onPressed: (){
                                  ageValue--;
                                  setState(() {

                                  });
                                },child:  Icon(Icons.remove),
                                  mini: true,),
                                SizedBox(width: 10,),
                                FloatingActionButton(onPressed: (){
                                  ageValue++;
                                  setState(() {

                                  });
                                }, mini: true,child:    Icon(Icons.add),),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          Container(
              height: 50.0,
              width: double.infinity,
              color: Colors.purple,
              child: MaterialButton(
                onPressed: () {},
                child: Text(
                  "CALCULATE",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,),
                ),

              ))
        ],
      ),
    );
  }
}
