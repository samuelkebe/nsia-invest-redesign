import 'package:flutter/material.dart';
import '../utils/nsia_theme.dart';

/// Type de fonds
enum FundType {
  diversifie('FCP - Fonds Diversifié'),
  obligataire('FCP - Fonds Obligataire'),
  action('FCP - Fonds Actions');

  const FundType(this.label);
  final String label;
}

/// Représente un Fonds Commun de Placement
class FcpModel {
  final String name;
  final FundType fundType;
  final double vl;
  final String date;
  final double perf12;
  final double perf6;
  final Color color;
  final Color lightColor;

  FcpModel({
    required this.name,
    required this.fundType,
    required this.vl,
    required this.date,
    required this.perf12,
    required this.perf6,
    required this.color,
    required this.lightColor,
  });

  /// VL formatée, ex: "5 748,6231 FCFA"
  String get formattedVl {
    return '${vl.toStringAsFixed(4)} FCFA';
  }

  /// Performance 12 mois formatée, ex: "+2.19%"
  String get formattedPerf12 {
    final sign = perf12 >= 0 ? '+' : '';
    return '$sign${perf12.toStringAsFixed(2)}%';
  }

  /// Performance 6 mois formatée, ex: "+3.50%"
  String get formattedPerf6 {
    final sign = perf6 >= 0 ? '+' : '';
    return '$sign${perf6.toStringAsFixed(2)}%';
  }
}
