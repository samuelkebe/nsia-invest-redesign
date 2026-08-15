// import 'package:flutter/material.dart';
// import '../components/card_fcp.dart';
// import '../utils/nsia_theme.dart';
// import '../views_models/FcpViewModel.dart';
//
// class FcpView extends StatefulWidget {
//   const FcpView({super.key});
//
//   @override
//   State<FcpView> createState() => _FcpViewState();
// }
//
// class _FcpViewState extends State<FcpView> {
//   late final FcpViewModel _viewModel;
//   int _selectedBottomNavIndex = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     _viewModel = FcpViewModel();
//     _viewModel.addListener(_onViewModelChanged);
//   }
//
//   void _onViewModelChanged() => setState(() {});
//
//   @override
//   void dispose() {
//     _viewModel.removeListener(_onViewModelChanged);
//     _viewModel.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: NsiaColors.background,
//       appBar: _buildAppBar(),
//       body: SafeArea(
//         top: false,
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _Banner(),
//               const SizedBox(height: 20),
//               _buildFilterChips(),
//               const SizedBox(height: 20),
//               _buildFundsHeader(),
//               const SizedBox(height: 12),
//               _buildFundsList(),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: _buildBottomNav(),
//     );
//   }
//
//   PreferredSizeWidget _buildAppBar() {
//     return AppBar(
//       backgroundColor: NsiaColors.background,
//       elevation: 0,
//       leading: IconButton(
//         icon: const Icon(Icons.menu_rounded),
//         onPressed: _viewModel.onMenuTap,
//       ),
//       title: Row(
//         children: [
//           Container(
//             padding: const EdgeInsets.all(4),
//             decoration: const BoxDecoration(
//               color: NsiaColors.primaryBlue,
//               shape: BoxShape.circle,
//             ),
//             child: const Icon(
//               Icons.show_chart_rounded,
//               color: Colors.white,
//               size: 14,
//             ),
//           ),
//           const SizedBox(width: 8),
//           const Text(
//             'NSIA',
//             style: TextStyle(
//               color: NsiaColors.primaryBlue,
//               fontWeight: FontWeight.w900,
//               fontSize: 16,
//               letterSpacing: 0.5,
//             ),
//           ),
//           const Text(
//             ' INVEST',
//             style: TextStyle(
//               color: NsiaColors.gold,
//               fontWeight: FontWeight.w900,
//               fontSize: 16,
//               letterSpacing: 0.5,
//             ),
//           ),
//         ],
//       ),
//       actions: [
//         IconButton(
//           icon: const Icon(Icons.notifications_none_rounded),
//           onPressed: _viewModel.onNotificationTap,
//         ),
//         const SizedBox(width: 4),
//       ],
//     );
//   }
//
//   Widget _Banner() {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         gradient: const LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [NsiaColors.primaryBlue, NsiaColors.primaryBlueDark],
//         ),
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: NsiaTheme.cardShadow,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'NSIA ASSET MANAGEMENT',
//             style: TextStyle(
//               color: Colors.white70,
//               fontSize: 11,
//               fontWeight: FontWeight.w700,
//               letterSpacing: 1.2,
//             ),
//           ),
//           const SizedBox(height: 8),
//           const Text(
//             'OFFREZ-VOUS LES CHANCES DE MIEUX FRUCTIFIER VOTRE ÉPARGNE',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 16,
//               fontWeight: FontWeight.w800,
//               height: 1.3,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildFilterChips() {
//     return Wrap(
//       spacing: 8,
//       runSpacing: 8,
//       children: List.generate(_viewModel.filters.length, (index) {
//         final isSelected = index == _viewModel.selectedFilterIndex;
//         return GestureDetector(
//           onTap: () => _viewModel.selectFilter(index),
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//             decoration: BoxDecoration(
//               color: isSelected ? NsiaColors.primaryBlue : NsiaColors.cardWhite,
//               borderRadius: BorderRadius.circular(20),
//               border: Border.all(
//                 color: isSelected ? NsiaColors.primaryBlue : const Color(0xFFE6EAF0),
//                 width: 1,
//               ),
//               boxShadow: isSelected ? NsiaTheme.cardShadow : null,
//             ),
//             child: Text(
//               _viewModel.filters[index],
//               style: TextStyle(
//                 color: isSelected ? Colors.white : NsiaColors.textDark,
//                 fontSize: 12,
//                 fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
//               ),
//             ),
//           ),
//         );
//       }),
//     );
//   }
//
//   Widget _buildFundsHeader() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         const Text(
//           'Fonds',
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.w900,
//             color: NsiaColors.textDark,
//             letterSpacing: -0.5,
//           ),
//         ),
//         TextButton(
//           onPressed: _viewModel.onSeeAllFunds,
//           style: TextButton.styleFrom(foregroundColor: NsiaColors.primaryBlue),
//           child: const Text(
//             'Voir tout',
//             style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildFundsList() {
//     final funds = _viewModel.getFilteredFunds();
//     return Column(
//       children: funds.map((fund) {
//         return CardFcp(
//           fund: fund,
//           onTap: () => _viewModel.onFundTap(fund),
//         );
//       }).toList(),
//     );
//   }
//
//   Widget _buildBottomNav() {
//     return Container(
//       decoration: BoxDecoration(
//         color: NsiaColors.cardWhite,
//         boxShadow: NsiaTheme.cardShadow,
//       ),
//       child: SafeArea(
//         top: false,
//         child: BottomNavigationBar(
//           currentIndex: _selectedBottomNavIndex,
//           onTap: (index) {
//             setState(() {
//               _selectedBottomNavIndex = index;
//             });
//           },
//           type: BottomNavigationBarType.fixed,
//           backgroundColor: NsiaColors.cardWhite,
//           selectedItemColor: NsiaColors.primaryBlue,
//           unselectedItemColor: NsiaColors.textGrey,
//           showUnselectedLabels: true,
//           selectedLabelStyle: const TextStyle(
//             fontSize: 11, fontWeight: FontWeight.w600),
//           unselectedLabelStyle: const TextStyle(fontSize: 11),
//           elevation: 0,
//           items: const [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home_rounded),
//               label: 'Accueil',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.account_balance_wallet_rounded),
//               label: 'Portefeuille',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.trending_up_rounded),
//               label: 'Investir',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.history_rounded),
//               label: 'Historique',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.person_rounded),
//               label: 'Profil',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }