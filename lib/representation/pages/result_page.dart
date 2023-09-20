import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String bmi;
  final int result;
  const ResultPage({super.key, required this.result,required this.bmi});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff14213d),
        elevation: 10,
        title: const Text(
          'BMI CALCULATOR',
          style: TextStyle(
              color: Colors.white
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: const Color(0xff14213d),
        child: Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 8,
            end: 8,
            top: 32
          ),
          child: Column(
            children: [
              Text(
                'Your Result',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16,),
              Container(
                padding: const EdgeInsetsDirectional.all(32),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.black26
                ),
                child: Column(
                  children: [
                    Text(
                       bmi ,
                      style: const TextStyle(
                        color: Colors.orangeAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 16,),
                    Text(
                      '${result}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 52,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(height: 16,),
                    const Text(
                        'Normal BMI range :',
                      style: TextStyle(
                        color: Colors.white,

                      ),
                    ),
                    const SizedBox(height: 16,),
                    const Text(
                      '18.5-25 kg/m^2',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18
                      ),
                    ),
                    const SizedBox(height: 16,),
                    result>25?
                    const Text('You have a higher than normal body weight',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),):
                    result<18.5?
                    const Text('You have a lower than normal body weight',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),):
                    const Text('You have a normal body weight',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
                    result>25?
                    const Text('Try to eat less',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),):
                    result<18.5?
                    const Text('Try to eat more',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),):
                    const Text('Nice',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
                    const SizedBox(height: 32,),
                    ElevatedButton(
                        onPressed: (){},
                        child: const Text('SAVE RESULT',style: TextStyle(color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[600],
                      ),
                    ),

                  ],
                ),
              ),
              const SizedBox(height: 64,),
              GestureDetector(
                onTap: () {
                  print('hello');
                  Navigator.pop(context);
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
      ),
    );
  }
}
