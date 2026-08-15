import 'package:flutter/material.dart';

enum FundType {
  diversifie('FCP - Fonds Diversifié'),
  obligataire('FCP - Fonds Obligataire'),
  action('FCP - Fonds Actions'),
  monetaire('FCP - Fonds Monetaire');

  final String label;
  const FundType(this.label);

  static FundType fromString(String value) {
    return FundType.values.firstWhere(
          (type) => type.label == value,
      orElse: () => FundType.diversifie,
    );
  }

  Color get color {
    switch (this) {
      case FundType.diversifie:
        return const Color(0xFF003B7A);
      case FundType.obligataire:
        return const Color(0xFF15966A);
      case FundType.action:
        return const Color(0xFFD5B23A);
      case FundType.monetaire:
        return const Color(0xFF6C63B5);
    }
  }

  Color get lightColor {
    switch (this) {
      case FundType.diversifie:
        return const Color(0xFFE8F0F8);
      case FundType.obligataire:
        return const Color(0xFFE8F5F0);
      case FundType.action:
        return const Color(0xFFF9F3E8);
      case FundType.monetaire:
        return const Color(0xFFEDEBF7);
    }
  }
}

class FcpModel {
  final String name;
  final FundType fundType;
  final String date;
  final double vl;
  final double perf12;
  final double perf6;
  final String urlImage;

  FcpModel({
    required this.name,
    required this.fundType,
    required this.date,
    required this.vl,
    required this.perf12,
    required this.perf6,
    required this.urlImage,
  });

  Color get color => fundType.color;
  Color get lightColor => fundType.lightColor;

  factory FcpModel.fromJson(Map<String, dynamic> json) {
    return FcpModel(
      name: json['name'] as String,
      fundType: FundType.fromString(json['fundType'] as String),
      date: json['date'] as String,
      urlImage: json['urlImage'] as String,
      vl: (json['vl'] as num).toDouble(),
      perf12: (json['perf12'] as num).toDouble(),
      perf6: (json['perf6'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'fundType': fundType.label,
      'urlImage': urlImage,
      'date': date,
      'vl': vl,
      'perf12': perf12,
      'perf6': perf6,
    };
  }

  @override
  String toString() {
    return 'FcpModel(name: $name, fundType: ${fundType.label}, date: $date, vl: $vl, perf12: $perf12, perf6: $perf6)';
  }
}