import 'package:NsiaInvestreDesign/components/card_fcp_investir.dart';
import 'package:NsiaInvestreDesign/views_models/FcpViewModel.dart';
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
      final viewModel = Provider.of<FcpViewModel>(context, listen: false,);
      viewModel.getAllFunds();
    });
  }


  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
        backgroundColor: AppColors.lightGrey,
        drawer: Drawer(child: MenuClientView()),

        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          elevation: 0,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.show_chart_rounded,
                  color: AppColors.primaryColor,
                  size: 14,
                ),
              ),
              const SizedBox(width: 6),
              const Text(
                'NSIA',
                style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                  letterSpacing: 0.5,
                ),
              ),
              const Text(
                ' INVEST',
                style: TextStyle(
                  color: AppColors.nsiaGold,
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.menu, color: AppColors.white),
            onPressed: () {

            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search_rounded, color: AppColors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.notifications_none_rounded, color: AppColors.white),
              onPressed: () {},
            ),
          ],
        ),
        // drawer: Drawer(child: MenuClientView()),
        body: Consumer<FcpViewModel>(
          builder: (context, fcpVm, child) {
            return SafeArea(
              child: RefreshIndicator(
                onRefresh: () async {
                  fcpVm.getAllFunds();
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Skeleton(
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
                              : ListView.builder(
                            itemCount: fcpVm.funds.length,
                            padding: const EdgeInsets.only(bottom: 16),
                            itemBuilder: (context, index) {
                              final fund = fcpVm.funds[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: InkWell(
                                  onTap: () {
                                    // fcpVm.setSelectedFcp(annonce);
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    //   return DetailAnnonceView(annonce: annonce);
                                    // },));
                                  },
                                  child: CardFcp(
                                    fund: fund,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }

}