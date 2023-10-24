import 'package:cripto_app/config/colors/colors.dart';
import 'package:flutter/material.dart';

List<Category> categories = [
  Category(
      name: 'trezor retailer',
      colorPrimary: ColorsApp.colorGreenPistac,
      colorSecondary: ColorsApp.colorGreenPistac10,
      icon: Icons.vpn_key),
  Category(
      name: 'atm',
      colorPrimary: ColorsApp.colorYelloeEgg,
      colorSecondary: ColorsApp.colorYelloeEgg10,
      icon: Icons.local_atm_sharp),
  Category(
      name: 'attraction',
      colorPrimary: ColorsApp.colorPink,
      colorSecondary: ColorsApp.colorPink10,
      icon: Icons.attractions),
  Category(
      name: 'cafe',
      colorPrimary: ColorsApp.colorRed,
      colorSecondary: ColorsApp.colorRed10,
      icon: Icons.local_cafe),
  Category(
      name: 'food',
      colorPrimary: ColorsApp.colorYelloeEgg,
      colorSecondary: ColorsApp.colorYelloeEgg10,
      icon: Icons.restaurant),
  Category(
      name: 'grocery',
      colorPrimary: ColorsApp.colorPink,
      colorSecondary: ColorsApp.colorPink10,
      icon: Icons.local_grocery_store),
  Category(
      name: 'lodging',
      colorPrimary: ColorsApp.colorGreenPistac,
      colorSecondary: ColorsApp.colorGreenPistac10,
      icon: Icons.hotel),
  Category(
      name: 'nightlife',
      colorPrimary: ColorsApp.colorPink,
      colorSecondary: ColorsApp.colorPink10,
      icon: Icons.nightlife),
  Category(
      name: 'shopping',
      colorPrimary: ColorsApp.colorRed,
      colorSecondary: ColorsApp.colorRed10,
      icon: Icons.shopping_bag),
  Category(
      name: 'sports',
      colorPrimary: ColorsApp.colorYelloeEgg,
      colorSecondary: ColorsApp.colorYelloeEgg10,
      icon: Icons.fitness_center),
  Category(
      name: 'transport',
      colorPrimary: ColorsApp.colorPink,
      colorSecondary: ColorsApp.colorPink10,
      icon: Icons.time_to_leave)
];

class Category {
  String name;
  Color colorPrimary;
  Color colorSecondary;
  IconData icon;

  Category(
      {required this.name,
      required this.colorPrimary,
      required this.colorSecondary,
      required this.icon});
}
