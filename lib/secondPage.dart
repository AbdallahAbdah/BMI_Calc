import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SecondPage extends StatelessWidget {
  double result = 0;
  String gender = "";
  double age = 0;
  SecondPage(double result, bool isMale, double age) {
    this.result = result.roundToDouble();
    this.age = age.roundToDouble();
    if (isMale) {
      gender = "Male";
    } else {
      gender = "Female";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Results',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40),)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("BMI : " + result.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),SizedBox(height: 15,),
            Text(gender,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),SizedBox(height: 15,),
            Text(age.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
          ],
        ),
      ),
    );
  }
}
