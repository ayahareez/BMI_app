import 'package:flutter/material.dart';

class PlusMinus extends StatefulWidget {
   int num;
   final  heroTag1;
   final  heroTag2;
   final String name;
   PlusMinus({super.key,  required this.num,required this.heroTag2,required this.heroTag1,required this.name});
  @override
  State<PlusMinus> createState() => _PlusMinusState();
}

class _PlusMinusState extends State<PlusMinus> {
  @override
  Widget build(BuildContext context) {
    return  Expanded(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsetsDirectional.all(16),
            child: Column(
              children: [
                Text(
                  widget.name,
                  style:
                  const TextStyle(fontSize: 22.0, color: Colors.white),
                ),
                Text(
                  '${widget.num}',
                  style: const TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      heroTag: widget.heroTag1,
                      onPressed: () {
                        setState(() {
                          widget.num--;
                        });
                      },
                      child: const Icon(
                        Icons.remove,
                        size: 35,
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.grey,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    FloatingActionButton(
                      heroTag: widget.heroTag2,
                      onPressed: () {
                        setState(() {
                         widget.num++;
                        });
                      },
                      child: const Icon(
                        Icons.add,
                        size: 35,
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.grey,
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
