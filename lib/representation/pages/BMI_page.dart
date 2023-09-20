import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quiz2/representation/pages/result_page.dart';
import 'package:quiz2/representation/widgets/gender.dart';
import 'package:quiz2/representation/widgets/plus_minus.dart';

class BmiPage extends StatefulWidget {
  const BmiPage({super.key});

  @override
  State<BmiPage> createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  double val = 180;

  bool isMale = true;

  double height = 160;

  double weight = 50;

  double age = 20;
  String bmi = 'normal';

  var result;

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
                            isMale = true;
                          });
                        },
                        isMale: isMale,
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
                            isMale = false;
                          });
                        },
                        isMale: isMale,
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
                            '${height.round()}',
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
                        value: height,
                        min: 80,
                        max: 220,
                        onChanged: (value) {
                          setState(() {
                            height = value;
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
                        weight--;
                      });
                    },
                    func2: () {
                      setState(() {
                        weight++;
                      });
                    },
                    num: weight,
                  ),
                  PlusMinus(
                    heroTag1: 'age--',
                    heroTag2: 'age++',
                    name: 'AGE',
                    func1: () {
                      setState(() {
                        age--;
                      });
                    },
                    func2: () {
                      setState(() {
                        age++;
                      });
                    },
                    num: age,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                print('hello');
                result = calculateBMI(weight, height);
                if (result > 25) {
                  bmi = 'OVERWEIGHT';
                } else if (result < 18.5) {
                  bmi = 'UNDERWEIGHT';
                } else {
                  bmi = 'NORMAL';
                }
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ResultPage(result: result, bmi: bmi)));
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
