import 'package:NsiaInvestreDesign/utils/app_theme.dart';
import 'package:NsiaInvestreDesign/utils/langue_provider.dart';
import 'package:NsiaInvestreDesign/utils/nsia_theme.dart';
import 'package:NsiaInvestreDesign/utils/theme_provider.dart';
import 'package:NsiaInvestreDesign/views/page_acceuil_view.dart';
import 'package:NsiaInvestreDesign/views/activation_compte_view.dart';
import 'package:NsiaInvestreDesign/views/fcp_view.dart';
import 'package:NsiaInvestreDesign/views_models/FcpViewModel.dart';
import 'package:NsiaInvestreDesign/views_models/auth_view_model.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const NsiaInvestReDesign());
}

class NsiaInvestReDesign extends StatelessWidget {
  const NsiaInvestReDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ChangeNotifierProvider(create: (_) => FcpViewModel()),
        ChangeNotifierProvider(create: (_) => AuthViewModel()),

      ],
      child: MaterialApp(
        title: 'Nsia Invest',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.defaultTheme,
        darkTheme: AppTheme.defaultTheme,
        home: const PageAcceuilView(),
      ),
    );
  }
}

