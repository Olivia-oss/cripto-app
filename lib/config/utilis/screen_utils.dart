import 'package:flutter/material.dart';

bool isScreenVertical(BuildContext context) {
  final Size sizeScreen = MediaQuery.of(context).size;

  return (sizeScreen.width < 650);
}
