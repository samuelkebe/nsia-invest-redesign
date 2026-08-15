import 'package:flutter/material.dart';

/// Représente une transaction affichée dans la liste
class Transaction {
  final String id;
  final String name;
  final double amount;
  final IconData icon;
  final Color iconBackground;
  final Color iconColor;

  const Transaction({
    required this.id,
    required this.name,
    required this.amount,
    required this.icon,
    required this.iconBackground,
    this.iconColor = Colors.white,
  });

  /// Montant formaté, ex: "-$370.00"
  String get formattedAmount {
    final sign = amount < 0 ? '-' : '+';
    return '$sign\$${amount.abs().toStringAsFixed(2)}';
  }
}

/// Représente une carte bancaire (Cards section)
class BankCard {
  final String holderLabel; // ex: "Business debit"
  final String brandName; // ex: "Levro"
  final String badge; // ex: "VISA"
  final Color startColor;
  final Color endColor;

  const BankCard({
    required this.holderLabel,
    required this.brandName,
    required this.badge,
    required this.startColor,
    required this.endColor,
  });
}

/// Représente une action rapide (Transfer, Pay, Request, More)
class QuickAction {
  final String label;
  final IconData icon;
  final VoidCallback? onTap;

  const QuickAction({
    required this.label,
    required this.icon,
    this.onTap,
  });
}
