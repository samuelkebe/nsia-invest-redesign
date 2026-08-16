import 'package:NsiaInvestreDesign/views_models/FcpViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton_ui/flutter_skeleton_ui.dart';
import 'package:provider/provider.dart';

import '../components/card_fcp.dart';
import '../utils/app_colors.dart';
import 'menu/menu_view.dart';

class AcceuilView extends StatefulWidget {
  const AcceuilView({super.key});

  @override
  State<AcceuilView> createState() => _AcceuilViewState();
}

class _AcceuilViewState extends State<AcceuilView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final viewModel = Provider.of<FcpViewModel>(context, listen: false);
      viewModel.getAllFunds();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      drawer: Drawer(child: MenuClientView()),
      // appBar: AppBar(
      //   backgroundColor: AppColors.primaryColor,
      //   elevation: 0,
      //   title: Row(
      //     mainAxisSize: MainAxisSize.min,
      //     children: [
      //       Container(
      //         padding: const EdgeInsets.all(4),
      //         decoration: const BoxDecoration(
      //           color: AppColors.white,
      //           shape: BoxShape.circle,
      //         ),
      //         child: const Icon(
      //           Icons.show_chart_rounded,
      //           color: AppColors.primaryColor,
      //           size: 14,
      //         ),
      //       ),
      //       const SizedBox(width: 6),
      //       const Text(
      //         'NSIA',
      //         style: Theme.of(context).textTheme.bodyMedium?.copyWith(
      //           color: AppColors.white,
      //           fontWeight: FontWeight.w900,
      //           fontSize: 18,
      //           letterSpacing: 0.5,
      //         ),
      //       ),
      //       const Text(
      //         ' INVEST',
      //         style: Theme.of(context).textTheme.bodyMedium?.copyWith(
      //           color: AppColors.nsiaGold,
      //           fontWeight: FontWeight.w900,
      //           fontSize: 18,
      //           letterSpacing: 0.5,
      //         ),
      //       ),
      //     ],
      //   ),
      //   centerTitle: true,
      //   leading: IconButton(
      //     icon: const Icon(Icons.menu, color: AppColors.white),
      //     onPressed: () {},
      //   ),
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.search_rounded, color: AppColors.white),
      //       onPressed: () {},
      //     ),
      //     IconButton(
      //       icon: const Icon(
      //         Icons.notifications_none_rounded,
      //         color: AppColors.white,
      //       ),
      //       onPressed: () {},
      //     ),
      //   ],
      // ),
      // drawer: Drawer(child: MenuClientView()),
      // body: Consumer<FcpViewModel>(
      //   builder: (context, fcpVm, child) {
      //     return SafeArea(
      //       child: RefreshIndicator(
      //         onRefresh: () async {
      //           fcpVm.getAllFunds();
      //         },
      //         child: Padding(
      //           padding: const EdgeInsets.all(16.0),
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               Expanded(
      //                 child: Skeleton(
      //                   isLoading: fcpVm.isLoadingFcp,
      //                   skeleton: SkeletonListView(),
      //                   child: fcpVm.funds.isEmpty
      //                       ? Center(
      //                     child: Column(
      //                       mainAxisAlignment: MainAxisAlignment.center,
      //                       children: [
      //                         Icon(
      //                           Icons.trending_up_rounded,
      //                           size: 80,
      //                           color: AppColors.black,
      //                         ),
      //                         const SizedBox(height: 16),
      //                         Text(
      //                           'Aucune fond commun de placement trouvé',
      //                           style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.black),
      //                         ),
      //                       ],
      //                     ),
      //                   )
      //                       : ListView.builder(
      //                     itemCount: fcpVm.funds.length,
      //                     padding: const EdgeInsets.only(bottom: 16),
      //                     itemBuilder: (context, index) {
      //                       final fund = fcpVm.funds[index];
      //                       return Padding(
      //                         padding: const EdgeInsets.only(bottom: 16),
      //                         child: InkWell(
      //                           onTap: () {
      //                             // fcpVm.setSelectedFcp(annonce);
      //                             // Navigator.push(context, MaterialPageRoute(builder: (context) {
      //                             //   return DetailAnnonceView(annonce: annonce);
      //                             // },));
      //                           },
      //                           child: CardFcp(
      //                             fund: fund,
      //                           ),
      //                         ),
      //                       );
      //                     },
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //     );
      //   },
      // ));
      body: Consumer<FcpViewModel>(builder: (context, fcpVm, child) {
           return SafeArea(
             child: Container(
               width: double.infinity,
               height: double.infinity,
               decoration: const BoxDecoration(
                 color: Color(0xFFF5F7F8),
               ),
               child: RefreshIndicator(
                 color: AppColors.black,
                 displacement: 40,
                 strokeWidth: 3,
                 onRefresh: () async {
                   // Recharge les données du client ici.
                   await Future.delayed(const Duration(milliseconds: 500));
                 },
                 child: SingleChildScrollView(
                   physics: const AlwaysScrollableScrollPhysics(),
                   padding: const EdgeInsets.fromLTRB(20, 12, 20, 110),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [

                       Container(
                         padding: const EdgeInsets.symmetric(
                           horizontal: 14,
                           vertical: 10,
                         ),
                         decoration: BoxDecoration(
                           color: AppColors.primaryColor,
                           borderRadius: BorderRadius.circular(18),
                           // boxShadow: [
                           //   BoxShadow(
                           //     color: AppColors.nsiaGold,
                           //     blurRadius: 18,
                           //     offset: const Offset(0, 7),
                           //   ),
                           // ],
                         ),
                         child: Row(
                           children: [

                             // MENU
                             Builder(
                               builder: (context) {
                                 return InkWell(
                                   onTap: () {
                                     Scaffold.of(context).openDrawer();
                                   },
                                   borderRadius: BorderRadius.circular(25),
                                   child: const SizedBox(
                                     width: 42,
                                     height: 42,
                                     child: Icon(
                                       Icons.menu_rounded,
                                       color: Colors.white,
                                       size: 23,
                                     ),
                                   ),
                                 );
                               },
                             ),

                             const Spacer(),

                             // ======================================================
                             // LOGO / TITRE
                             // ======================================================

                             Column(
                               mainAxisSize: MainAxisSize.min,
                               children: [
                                 RichText(
                                   text:  TextSpan(
                                     children: [
                                       TextSpan(
                                         text: 'NSIA',
                                         style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                           color: Colors.white,
                                           fontSize: 16,
                                           fontWeight: FontWeight.w900,
                                           letterSpacing: 0.5,
                                         ),
                                       ),
                                       TextSpan(
                                         text: ' INVEST',
                                         style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                           color: AppColors.nsiaGold,
                                           fontSize: 16,
                                           fontWeight: FontWeight.w900,
                                           letterSpacing: 0.5,
                                         ),
                                       ),
                                     ],
                                   ),
                                 ),
                                  Text(
                                   'ASSET MANAGEMENT',
                                   style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                     color: Colors.white70,
                                     fontSize: 6.5,
                                     fontWeight: FontWeight.w700,
                                     letterSpacing: 0.8,
                                   ),
                                 ),
                               ],
                             ),

                             const Spacer(),

                             // ======================================================
                             // NOTIFICATION
                             // ======================================================

                             Stack(
                               clipBehavior: Clip.none,
                               children: [
                                 InkWell(
                                   onTap: () {
                                     // TODO: notifications
                                   },
                                   borderRadius: BorderRadius.circular(25),
                                   child: const SizedBox(
                                     width: 42,
                                     height: 42,
                                     child: Icon(
                                       Icons.notifications_none_rounded,
                                       color: Colors.white,
                                       size: 23,
                                     ),
                                   ),
                                 ),

                                 Positioned(
                                   right: 7,
                                   top: 7,
                                   child: Container(
                                     width: 8,
                                     height: 8,
                                     decoration: BoxDecoration(
                                       color: AppColors.nsiaGold,
                                       shape: BoxShape.circle,
                                       border: Border.all(
                                         color: AppColors.primaryColor,
                                         width: 1.5,
                                       ),
                                     ),
                                   ),
                                 ),
                               ],
                             ),

                             const SizedBox(width: 4),

                             // ======================================================
                             // AIDE
                             // ======================================================

                             InkWell(
                               onTap: () {
                                 // TODO: aide
                               },
                               borderRadius: BorderRadius.circular(25),
                               child: const SizedBox(
                                 width: 42,
                                 height: 42,
                                 child: Icon(
                                   CupertinoIcons.question_circle,
                                   color: Colors.white,
                                   size: 22,
                                 ),
                               ),
                             ),
                           ],
                         ),
                       ),

                       // ==========================================================
                       // HEADER
                       // ==========================================================

                       const SizedBox(height: 26),

                       // Intervention
                       Skeleton(
                         isLoading: fcpVm.isLoadingFcp,
                         skeleton: SkeletonListView(),
                         child: fcpVm.funds.isEmpty
                             ? Center(
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Icon(
                                 Icons.trending_up_rounded,
                                 size: 80,
                                 color: AppColors.black,
                               ),
                               const SizedBox(height: 16),
                               Text(
                                 'Aucune fond commun de placement trouvé',
                                 style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.black),
                               ),
                             ],
                           ),
                         )
                             : Column(
                           children: [
                             for (int index = 0; index < fcpVm.funds.length; index++)
                               Padding(
                                 padding: const EdgeInsets.only(bottom: 16),
                                 child: InkWell(
                                   onTap: () {
                                     // fcpVm.setSelectedFcp(annonce);
                                     // Navigator.push(context, MaterialPageRoute(builder: (context) {
                                     //   return DetailAnnonceView(annonce: annonce);
                                     // },));
                                   },
                                   child: CardFcp(
                                     fund: fcpVm.funds[index],
                                   ),
                                 ),
                               ),
                           ],
                         ),
                       ),
                     ],
                   ),
                 ),
               ),
             ),
           );
      },),
    );
  }
}
