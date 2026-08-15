import 'package:flutter/material.dart';

import '../models/FcpModel.dart';

class FcpViewModel extends ChangeNotifier {
  bool isLoadingFcp = false;
  List<FcpModel> funds = [];
  List<FcpModel> filteredFunds = [];

  Future<void> getAllFunds() async {
    isLoadingFcp = true;
    notifyListeners();

    funds = [
      FcpModel(
        name: 'AURORE\nOPPORTUNITES',
        fundType: FundType.action,
        date: '13-08-2026',
        urlImage: 'https://cdn-ildommg.nitrocdn.com/qRkudxGFbArlwEHVDKKOaSMJUjEjynTD/assets/images/optimized/rev-9fd185e/nsia-asset.com/wp-content/uploads/2022/08/DEPLIANT-FCP-NSIA-FONDS-DIVERSIFIE-1-2_page-0001.jpg',
        vl: 12549.96,
        perf12: 48.16, // performance sur 1 an (RichBourse, 13/08/2026)
        perf6: 37.87, // performance depuis le 1er janvier 2026 (proxy 6 mois)
      ),
      FcpModel(
        name: 'AURORE\nSECURITE',
        fundType: FundType.obligataire,
        date: '31-10-2024',
        urlImage: 'https://cdn-ildommg.nitrocdn.com/qRkudxGFbArlwEHVDKKOaSMJUjEjynTD/assets/images/optimized/rev-9fd185e/nsia-asset.com/wp-content/uploads/2022/08/DEPLIANT-ASSET-MANAGEMENT-AURORE-SECURITE-1.jpg',
        vl: 1583.42, // indicative — VL publique non trouvée, à corriger via l'API
        perf12: 7.90, // dernière perf 12 mois publiée (NSIA AM, 31/10/2024)
        perf6: 3.95, // indicative — non publiée séparément
      ),
      FcpModel(
        name: 'AURORE\nMONETARIS',
        fundType: FundType.monetaire,
        date: '31-12-2024',
        urlImage: 'https://cdn-ildommg.nitrocdn.com/qRkudxGFbArlwEHVDKKOaSMJUjEjynTD/assets/images/optimized/rev-9fd185e/nsia-asset.com/wp-content/uploads/2024/05/fcp_monetaris_cover.png',
        vl: 1081.40, // indicative — VL publique non trouvée, à corriger via l'API
        perf12: 12.05, // performance annualisée 2024 (NSIA AM / Sikafinance)
        perf6: 8.14, // rentabilité nette 2024 réalisée, utilisée comme proxy
      ),
    ];

    filteredFunds = funds;
    isLoadingFcp = false;
    notifyListeners();
  }


  void setSelectedFcp(FcpModel fund) {
    notifyListeners();
  }
}
