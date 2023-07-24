//import 'package:bci/constands/constands.dart';
import 'package:flutter/material.dart';

import '../../../../../constant/constans.dart';

class AddSubtractScreen extends StatefulWidget {
  @override
  _AddSubtractScreenState createState() => _AddSubtractScreenState();
}

class _AddSubtractScreenState extends State<AddSubtractScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    if (_counter != 0) {
      setState(() {
        _counter--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
              color: kwhite, borderRadius: BorderRadius.circular(5)),
          height: 40,
          width: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: _incrementCounter,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: kgrey,
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '+',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              Text(
                '$_counter',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
              ),
              InkWell(
                onTap: _decrementCounter,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: kgrey,
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '-',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
