
import 'package:flutter/material.dart';

import '../../../../constant/constans.dart';

//import '../../../constands/constands.dart';

class Dropdown_hotel extends StatefulWidget {
  final String label;
  final List<String> options;

  Dropdown_hotel({required this.label, required this.options});

  @override
  _Dropdown_hotelState createState() => _Dropdown_hotelState();
}

class _Dropdown_hotelState extends State<Dropdown_hotel> {
  var _selectedOption;
  final List<String> options = [
    'AC',
    'Non AC',
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Container(
        height: 50,
        color: Colors.white,
        child: DropdownButtonFormField<String>(
          style: TextStyle(color: Colors.grey),
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            fillColor: kwhite,
            focusColor: kwhite,
            isDense: true,
            //  enabledBorder: ,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(2),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(2),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(2),
            ),
            labelText: widget.label,
            labelStyle: TextStyle(color: Colors.black),
          ),
          value: _selectedOption,
          onChanged: (newValue) {
            setState(() {
              _selectedOption = newValue!;
            });
          },
          items: options.map(
            (option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(
                  option,
                  style: TextStyle(color: Colors.black),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
