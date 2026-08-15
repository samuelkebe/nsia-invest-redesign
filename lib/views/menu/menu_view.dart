import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/app_colors.dart';
import '../../utils/langue_provider.dart';
import '../../utils/theme_provider.dart';
import '../../views_models/auth_view_model.dart';




class MenuClientView extends StatefulWidget {
  const MenuClientView({super.key});

  @override
  State<MenuClientView> createState() => _MenuClientViewState();
}

class _MenuClientViewState extends State<MenuClientView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final langueProvider = Provider.of<LanguageProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;
    final isFrench = langueProvider.locale.languageCode == 'fr';

    return Scaffold(
      backgroundColor: isDarkMode ? AppColors.black : const Color(0xFFF5F7FA),
      body: Consumer<AuthViewModel>(
        builder: (context, value, child) {
          return Stack(
            children: [
              if (!isDarkMode)
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFFF5F7FA), Color(0xFFF5F7FA)],
                      ),
                    ),
                  ),
                ),
              SafeArea(
                child: Column(
                  children: [
                    /// HEADER
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isDarkMode ? AppColors.black : Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.06),
                                  blurRadius: 14,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: CircleAvatar(
                              radius: 26,
                              backgroundColor: AppColors.black,
                              child: Text(
                                getUserInitials("SK"),
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Mon profil",
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w800,
                                    color: isDarkMode ? AppColors.white : const Color(0xFF1E2022),
                                    letterSpacing: -0.2,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFE1F57A),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    "Samuel Kébé",
                                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: const Color(0xFF1E2022),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 10.5,
                                      letterSpacing: 0.3,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            borderRadius: BorderRadius.circular(24),
                            onTap: () {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) {
                                  final isDarkMode = Theme.of(context).brightness == Brightness.dark;
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    backgroundColor: Colors.transparent,
                                    contentPadding: EdgeInsets.zero,
                                    content: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        gradient: const LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [Color(0xFFEAF5DE), Color(0xFFF7FAF2)],
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              "Déconnexion",
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 12),
                                            Text(
                                              "Voulez-vous vraiment vous déconnecter ?",
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                height: 1.4,
                                                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                TextButton(
                                                  onPressed: () => Navigator.pop(context),
                                                  style: TextButton.styleFrom(
                                                    foregroundColor: Colors.black,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(10),
                                                    ),
                                                  ),
                                                  child: Text(
                                                    "Annuler",
                                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                                ElevatedButton(
                                                  onPressed: () async {},
                                                  style: ElevatedButton.styleFrom(
                                                    backgroundColor: AppColors.negativeRed,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(10),
                                                    ),
                                                  ),
                                                  child: Text(
                                                    "Déconnexion",
                                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.w700,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Container(
                              width: 46,
                              height: 46,
                              decoration: BoxDecoration(
                                color: AppColors.negativeRed.withOpacity(0.08),
                                shape: BoxShape.circle,
                              ),
                              child:  Icon(
                                Icons.logout_rounded,
                                color: AppColors.negativeRed,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// CONTENU SCROLLABLE
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 24),

                            /// ============================================================
                            /// SECTION : MON PROFIL
                            /// ============================================================
                            Container(
                              decoration: BoxDecoration(
                                color: isDarkMode ? AppColors.black : Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: isDarkMode
                                    ? []
                                    : [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.04),
                                    blurRadius: 16,
                                    offset: const Offset(0, 6),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  _MenuTile(
                                    icon: Icons.person_outline_rounded,
                                    iconColor: const Color(0xFF1E2022),
                                    iconBackground: const Color(0xFFF7F9F5),
                                    title: "Mon profil",
                                    subtitle: "",
                                    onTap: () {},
                                  ),
                                  _MenuTile(
                                    icon: Icons.description_outlined,
                                    iconColor: const Color(0xFF1E2022),
                                    iconBackground: const Color(0xFFF7F9F5),
                                    title: "Mes Relevés de compte",
                                    subtitle: "",
                                    onTap: () {},
                                  ),
                                  _MenuTile(
                                    icon: Icons.history_rounded,
                                    iconColor: const Color(0xFF1E2022),
                                    iconBackground: const Color(0xFFF7F9F5),
                                    title: "Mon Historique",
                                    subtitle: "",
                                    onTap: () {},
                                  ),
                                  _MenuTile(
                                    icon: Icons.trending_up_rounded,
                                    iconColor: const Color(0xFF1E2022),
                                    iconBackground: const Color(0xFFF7F9F5),
                                    title: "Mes opérations en cours",
                                    subtitle: "",
                                    onTap: () {},
                                  ),
                                  _MenuTile(
                                    icon: Icons.pie_chart_outline_rounded,
                                    iconColor: const Color(0xFF1E2022),
                                    iconBackground: const Color(0xFFF7F9F5),
                                    title: "Mon profil investisseur",
                                    subtitle: "",
                                    onTap: () {},
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 24),

                            /// ============================================================
                            /// SECTION : AUTRES SERVICES
                            /// ============================================================
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Text(
                                "AUTRES SERVICES",
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.6,
                                  color: AppColors.black,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),

                            Container(
                              decoration: BoxDecoration(
                                color: isDarkMode ? AppColors.black : Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: isDarkMode
                                    ? []
                                    : [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.04),
                                    blurRadius: 16,
                                    offset: const Offset(0, 6),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  _MenuTile(
                                    icon: Icons.savings_rounded,
                                    iconColor: const Color(0xFF1E2022),
                                    iconBackground: const Color(0xFFF7F9F5),
                                    title: "Intégrer un plan épargne",
                                    subtitle: "",
                                    onTap: () {},
                                  ),
                                  _MenuTile(
                                    icon: Icons.account_balance_rounded,
                                    iconColor: const Color(0xFF1E2022),
                                    iconBackground: const Color(0xFFF7F9F5),
                                    title: "Intégrer un Fonds dédié",
                                    subtitle: "",
                                    onTap: () {},
                                  ),
                                  _MenuTile(
                                    icon: Icons.calculate_rounded,
                                    iconColor: const Color(0xFF1E2022),
                                    iconBackground: const Color(0xFFF7F9F5),
                                    title: "Simuler mes investissements",
                                    subtitle: "",
                                    onTap: () {},
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 24),

                            /// ============================================================
                            /// SECTION : À PROPOS
                            /// ============================================================
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Text(
                                "À PROPOS",
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.6,
                                  color: AppColors.black,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),

                            Container(
                              decoration: BoxDecoration(
                                color: isDarkMode ? AppColors.black : Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: isDarkMode
                                    ? []
                                    : [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.04),
                                    blurRadius: 16,
                                    offset: const Offset(0, 6),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  _MenuTile(
                                    icon: Icons.info_outline_rounded,
                                    iconColor: const Color(0xFF1E2022),
                                    iconBackground: const Color(0xFFF7F9F5),
                                    title: "Présentation NSIA ASSET",
                                    subtitle: "",
                                    onTap: () {},
                                  ),
                                  _MenuTile(
                                    icon: Icons.logout_rounded,
                                    iconColor: AppColors.negativeRed,
                                    iconBackground: AppColors.negativeRed.withOpacity(0.08),
                                    title: "Déconnexion",
                                    subtitle: "",
                                    titleColor: AppColors.negativeRed,
                                    onTap: () {},
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 24),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _MenuTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBackground;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final Color? titleColor;
  final Color? subtitleColor;
  final Color? trailingColor;

  const _MenuTile({
    required this.icon,
    required this.iconColor,
    required this.iconBackground,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.titleColor,
    this.subtitleColor,
    this.trailingColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: iconBackground,
                borderRadius: BorderRadius.circular(13),
              ),
              child: Icon(icon, size: 19, color: iconColor),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: titleColor,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: subtitleColor ?? Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              color: trailingColor ?? Colors.grey[400],
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}

String getUserInitials(String? user) {
  if (user == null || user.isEmpty) return "";

  final words = user.split(' ');
  final initials = words
      .map((word) => word.isNotEmpty ? word[0].toUpperCase() : '')
      .join();

  return initials.length > 2 ? initials.substring(0, 3) : initials;
}