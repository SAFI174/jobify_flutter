import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

enum UserType {
  freelancer,
  projectManager,
}
Map<int, Widget> userTypeMap = {
  0: const Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        FluentIcons.laptop_16_regular,
        color: Colors.black,
      ),
      Text(' Freelancer')
    ],
  ),
  1: const Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        Icons.business_center_outlined,
        color: Colors.black,
      ),
      Text(' Project Manager')
    ],
  ),
};
