class BmiInfo{
   double val;

  late  bool isMale;

  late double height ;

  late double weight ;

  late  double age;
  late  String bmi;

  late  int?result;

  BmiInfo({required this.age,required this.weight, this.result,required this.bmi,required this.isMale,required this.height,required this.val});
}