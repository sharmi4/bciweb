import 'package:flutter/material.dart';

class FlightPassengerModel {
  TextEditingController firstNameController;
  TextEditingController lastNameController;
  TextEditingController ageController;
  int gender;

  FlightPassengerModel(
      {required this.firstNameController,
      required this.lastNameController,
      required this.ageController,
      required this.gender});
}
