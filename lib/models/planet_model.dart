import 'package:flutter/material.dart';

class PlanetModel {
  final double planetSize;
  final Color planetColor;
  final double remoteness;
  final int orbitalSpeed;

  const PlanetModel({
    required this.orbitalSpeed,
    required this.planetSize,
    required this.planetColor,
    required this.remoteness,
  });
}
