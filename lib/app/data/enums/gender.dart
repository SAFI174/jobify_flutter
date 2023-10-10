import 'package:flutter/material.dart';
enum Gender { male, female }

Map<dynamic, Widget> genderMap = {
  0: const Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        Icons.male,
        color: Colors.black,
      ),
      Text(' Male')
    ],
  ),
  1: const Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        Icons.female_rounded,
        color: Colors.black,
      ),
      Text(' Female')
    ],
  ),
};
