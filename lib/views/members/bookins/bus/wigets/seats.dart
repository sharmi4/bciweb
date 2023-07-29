import 'package:bciweb/constant/constans.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Busseats {
  final String name;
  final String description;
  final double price;

   Busseats(this.name, this.description, this.price);
}

List< Busseats> sampleBuses = [
 
   Busseats(" Busseats 3", "Description for  Busseats 3", 15.0),
   Busseats(" Busseats 1", "Description for  Busseats 1", 10.0),
   Busseats(" Busseats 2", "Description for  Busseats 2", 12.0),
   Busseats(" Busseats 3", "Description for  Busseats 3", 15.0),
   Busseats(" Busseats 1", "Description for  Busseats 1", 10.0),
   Busseats(" Busseats 2", "Description for  Busseats 2", 12.0),
   Busseats(" Busseats 3", "Description for  Busseats 3", 15.0),
   Busseats(" Busseats 1", "Description for  Busseats 1", 10.0),
   Busseats(" Busseats 2", "Description for  Busseats 2", 12.0),
   Busseats(" Busseats 3", "Description for  Busseats 3", 15.0),
   Busseats(" Busseats 1", "Description for  Busseats 1", 10.0),
   Busseats(" Busseats 1", "Description for  Busseats 1", 10.0),
 
];

class BusBookingGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: sampleBuses.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              color: kblue, borderRadius: BorderRadius.circular(5)),
        );
      },
    );
  }
}
