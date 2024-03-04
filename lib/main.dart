
import 'package:flutter/material.dart';
import 'package:task_4/secondPage.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double height = 100;
  double weight = 50;
  double age = 20;
  Color maleColor =Colors.lightGreen;
  Color femaleColor =Colors.lightGreen;
  bool isMale = true;
  double result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.5,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "BMI Calculator",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () { setState(() {
                  maleColor = Colors.lightBlue;
                  femaleColor =Colors.lightGreen;
                  isMale = true ;
                }); },
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: maleColor),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.male,
                        size: 100.0,
                      ),
                      Text(
                        "Male",
                        textAlign: TextAlign.center,
                        style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              TextButton(
                onPressed: () { setState(() {
                  femaleColor = Colors.pinkAccent;
                  maleColor =Colors.lightGreen;
                  isMale = false;
                }); },
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: femaleColor),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.female,
                        size: 100.0,
                      ),
                      Text(
                        "Female",
                        textAlign: TextAlign.center,
                        style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Container(
            width: 350,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.lightGreen),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Height",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  height.round().toString() + " cm",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Slider(
                  value: height,
                  onChanged: (newValue) {
                    setState(() {
                      height = newValue;
                    });
                  },
                  min: 100,
                  max: 220,
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.lightGreen),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Weight",
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      weight.round().toString() + " Kg",
                      style:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Slider(
                      value: weight,
                      onChanged: (newValue) {
                        setState(() {
                          weight = newValue;
                        });
                      },
                      min: 50,
                      max: 150,
                    )
                  ],
                ),
              ),
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.lightGreen),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Age",
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      age.round().toString(),
                      style:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Slider(
                      value: age,
                      onChanged: (newValue) {
                        setState(() {
                          age = newValue;
                        });
                      },
                      min: 10,
                      max: 80,
                    )
                  ],
                ),
              )
            ],
          ),
          ElevatedButton(onPressed: () {
            result = weight / pow(height/100, 2);
            Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage(result,isMale,age)));
          }, child: Text("Calculate"))
        ],
      ),
    );
  }
}
