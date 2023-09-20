import 'package:flutter/material.dart';

class Gender extends StatelessWidget {
  final Function func;
  final bool isMale;
  final IconData icon;
  final String gender;
  final int flag;

  const Gender({super.key, required this.func,required this.isMale,required this.gender,required this.icon,required this.flag});


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => func(),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: flag==1?(isMale? Colors.black54: Colors.black26):(!isMale? Colors.black54: Colors.black26)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 55,
                color: Colors.white,
              ),
              Text(
                gender,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24.0,
                    color: Colors.white
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

