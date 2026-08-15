import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../utils/nsia_theme.dart';

/// ViewModel de l'écran d'accueil "Cards & Transactions".
/// Expose l'état (carte, actions, transactions, navigation) à la vue
/// et centralise la logique métier / les callbacks.
class HomeViewModel extends ChangeNotifier {
  int _selectedTabIndex = 1; // "Cards" sélectionné par défaut (cf. maquette)

  int get selectedTabIndex => _selectedTabIndex;

  void selectTab(int index) {
    _selectedTabIndex = index;
    notifyListeners();
  }

  /// Carte bancaire à afficher dans la section "Cards"
  final BankCard card = const BankCard(
    holderLabel: 'Business debit',
    brandName: 'Levro',
    badge: 'VISA',
    startColor: NsiaColors.primaryBlue,
    endColor: NsiaColors.primaryBlueDark,
  );

  /// Actions rapides affichées sous la carte
  List<QuickAction> get quickActions => [
    QuickAction(
      label: 'Transfer',
      icon: Icons.compare_arrows_rounded,
      onTap: () => debugPrint('Transfer tapped'),
    ),
    QuickAction(
      label: 'Pay',
      icon: Icons.credit_card_rounded,
      onTap: () => debugPrint('Pay tapped'),
    ),
    QuickAction(
      label: 'Request',
      icon: Icons.replay_rounded,
      onTap: () => debugPrint('Request tapped'),
    ),
    QuickAction(
      label: 'More',
      icon: Icons.grid_view_rounded,
      onTap: () => debugPrint('More tapped'),
    ),
  ];

  /// Liste des transactions récentes
  final List<Transaction> transactions = const [
    Transaction(
      id: 't1',
      name: 'Stripe',
      amount: -370.00,
      icon: Icons.bolt_rounded,
      iconBackground: Color(0xFF1C1C28),
    ),
    Transaction(
      id: 't2',
      name: 'Spotify',
      amount: -70.00,
      icon: Icons.music_note_rounded,
      iconBackground: Color(0xFF1DB954),
    ),
    Transaction(
      id: 't3',
      name: 'Hubspot',
      amount: -230.00,
      icon: Icons.change_history_rounded,
      iconBackground: Color(0xFFFF7A59),
    ),
    Transaction(
      id: 't4',
      name: 'Robert Fox',
      amount: -400.00,
      icon: Icons.person_rounded,
      iconBackground: NsiaColors.gold,
    ),
  ];

  void onSeeAllTransactions() {
    debugPrint('See all transactions tapped');
  }

  void onNotificationTap() {
    debugPrint('Notification tapped');
  }

  void onMenuTap() {
    debugPrint('Menu tapped');
  }
}
