import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quiz2/data/models/bmi_info.dart';
import 'package:quiz2/representation/pages/result_page.dart';
import 'package:quiz2/representation/widgets/gender.dart';
import 'package:quiz2/representation/widgets/plus_minus.dart';

class BmiPage extends StatefulWidget {
  const BmiPage({super.key});

  @override
  State<BmiPage> createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {

  BmiInfo bmiInfo =BmiInfo(age: 20, weight: 50,  bmi: 'normal', isMale: true, height: 160, val: 180);


  // double val = 180;
  //
  // bool isMale = true;
  //
  // double height = 160;
  //
  // double weight = 50;
  //
  // double age = 20;
  // String bmi = 'normal';
  //
  // var result;

  int calculateBMI(double weight, double height) {
    // Convert height from centimeters to meters
    double heightInMeters = height / 100;

    // Calculate BMI using the formula: weight / (height * height)
    double bmi = weight / (heightInMeters * heightInMeters);

    // Return the calculated BMI
    return bmi.round();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff14213d),
        elevation: 10,
        title: const Text(
          'BMI CALCULATOR',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: const Color(0xff14213d),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Gender(
                        func: () {
                          setState(() {
                            bmiInfo.isMale = true;
                          });
                        },
                        isMale: bmiInfo.isMale,
                        gender: 'MALE',
                        icon: Icons.male,
                      flag: 1,
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Gender(
                        func: () {
                          setState(() {
                            bmiInfo.isMale = false;
                          });
                        },
                        isMale: bmiInfo.isMale,
                        gender: 'FEMALE',
                        icon: Icons.female,
                      flag: 2,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: Colors.black26,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Height',
                        style: TextStyle(fontSize: 24.0, color: Colors.white),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '${bmiInfo.height.round()}',
                            style: const TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const Text(
                            'cm',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      Slider(
                        value: bmiInfo.height,
                        min: 80,
                        max: 220,
                        onChanged: (value) {
                          setState(() {
                            bmiInfo.height = value;
                          });
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  PlusMinus(
                    heroTag1: 'w--',
                    heroTag2: 'w++',
                    name: 'WEIGHT',
                    func1: () {
                      setState(() {
                        bmiInfo.weight--;
                      });
                    },
                    func2: () {
                      setState(() {
                        bmiInfo.weight++;
                      });
                    },
                    num: bmiInfo.weight,
                  ),
                  PlusMinus(
                    heroTag1: 'age--',
                    heroTag2: 'age++',
                    name: 'AGE',
                    func1: () {
                      setState(() {
                        bmiInfo.age--;
                      });
                    },
                    func2: () {
                      setState(() {
                        bmiInfo.age++;
                      });
                    },
                    num:bmiInfo.age,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                if (kDebugMode) {
                  print('hello');
                }
                bmiInfo.result = calculateBMI(bmiInfo.weight, bmiInfo.height);
                if (bmiInfo.result! > 25) {
                  bmiInfo.bmi = 'OVERWEIGHT';
                } else if (bmiInfo.result! < 18.5) {
                  bmiInfo.bmi = 'UNDERWEIGHT';
                } else {
                  bmiInfo.bmi = 'NORMAL';
                }
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ResultPage(result: bmiInfo.result!, bmi: bmiInfo.bmi)));
              },
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.pink,
                alignment: Alignment.center,
                child: const Text(
                  'CALCULATE',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
