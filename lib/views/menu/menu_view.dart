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
  static const Color nsiaBlue = Color(0xFF002B6C);
  static const Color nsiaBlueDark = Color(0xFF001F52);
  static const Color nsiaGold = Color(0xFFD5B23A);

  static const Color background = Color(0xFFF7F7F7);
  static const Color textColor = Color(0xFF242424);
  static const Color greyText = Color(0xFF777777);
  static const Color divider = Color(0xFFE2E2E2);
  static const Color green = Color(0xFF15966A);
  static const Color red = Color(0xFFD64C4C);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final langueProvider = Provider.of<LanguageProvider>(context);

    final isDarkMode = themeProvider.isDarkMode;
    final isFrench = langueProvider.locale.languageCode == 'fr';

    return Material(
      color: isDarkMode ? const Color(0xFF121212) : background,
      child: Consumer<AuthViewModel>(
        builder: (context, authVm, child) {
          return SafeArea(
            top: false,
            bottom: false,
            child: Column(
              children: [
                // ============================================================
                // HEADER PROFIL
                // ============================================================

                _buildProfileHeader(),

                // ============================================================
                // MENU
                // ============================================================

                Expanded(
                  child: Container(
                    color: isDarkMode
                        ? const Color(0xFF121212)
                        : Colors.white,
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        // ----------------------------------------------------
                        // MON PROFIL
                        // ----------------------------------------------------

                        _MenuTile(
                          icon: Icons.person_outline_rounded,
                          title: isFrench ? 'Mon profil' : 'My profile',
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),

                        _MenuTile(
                          icon: Icons.description_outlined,
                          title: isFrench
                              ? 'Mes Relevés de compte'
                              : 'My account statements',
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),

                        _MenuTile(
                          icon: Icons.history_rounded,
                          title: isFrench
                              ? 'Mon Historique'
                              : 'My history',
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),

                        _MenuTile(
                          icon: Icons.sync_alt_rounded,
                          title: isFrench
                              ? 'Mes opérations en cours'
                              : 'My pending transactions',
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),

                        _MenuTile(
                          icon: Icons.person_search_outlined,
                          title: isFrench
                              ? 'Mon profil investisseur'
                              : 'My investor profile',
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),

                        // ----------------------------------------------------
                        // AUTRES SERVICES
                        // ----------------------------------------------------

                        _SectionTitle(
                          title: isFrench
                              ? 'AUTRES SERVICES'
                              : 'OTHER SERVICES',
                        ),

                        _MenuTile(
                          icon: Icons.savings_outlined,
                          title: isFrench
                              ? 'Intégrer un plan épargne'
                              : 'Join a savings plan',
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),

                        _MenuTile(
                          icon: Icons.account_balance_outlined,
                          title: isFrench
                              ? 'Intégrer un Fonds dédié'
                              : 'Join a dedicated fund',
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),

                        _MenuTile(
                          icon: Icons.calculate_outlined,
                          title: isFrench
                              ? 'Simuler mes investissements'
                              : 'Simulate my investments',
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),

                        // ----------------------------------------------------
                        // À PROPOS
                        // ----------------------------------------------------

                        _SectionTitle(
                          title: isFrench ? 'À PROPOS' : 'ABOUT',
                        ),

                        _MenuTile(
                          icon: Icons.info_outline_rounded,
                          title: isFrench
                              ? 'Présentation NSIA ASSET'
                              : 'About NSIA ASSET',
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),

                        // ----------------------------------------------------
                        // DECONNEXION
                        // ----------------------------------------------------

                        _MenuTile(
                          icon: Icons.power_settings_new_rounded,
                          title: isFrench
                              ? 'Déconnexion'
                              : 'Logout',
                          iconColor: red,
                          titleColor: red,
                          showDivider: false,
                          onTap: () {
                            _showLogoutDialog(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // ==========================================================================
  // HEADER
  // ==========================================================================

  Widget _buildProfileHeader() {
    return Container(
      width: double.infinity,
      height: 146,
      decoration: const BoxDecoration(
        color: nsiaBlue,
      ),
      child: Stack(
        children: [
          // Légère décoration
          Positioned(
            right: -35,
            top: -45,
            child: Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.025),
              ),
            ),
          ),

          Positioned(
            left: -45,
            bottom: -65,
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: nsiaGold.withOpacity(0.05),
              ),
            ),
          ),

          // Profil
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 27),
              child: Column(
                children: [
                  // Avatar
                  Container(
                    width: 57,
                    height: 57,
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.12),
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      backgroundColor: Color(0xFFB7A08D),
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 31,
                      ),
                    ),
                  ),

                  const SizedBox(height: 7),

                   Text(
                    'Samuel Kébé',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  const SizedBox(height: 3),

                  // Vérifié
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 13,
                        height: 13,
                        decoration: const BoxDecoration(
                          color: green,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 9,
                        ),
                      ),
                      const SizedBox(width: 4),
                       Text(
                        'Vérifié',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: green,
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================================================
  // DIALOG DECONNEXION
  // ==========================================================================

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: red.withOpacity(0.08),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.logout_rounded,
                    color: red,
                    size: 23,
                  ),
                ),

                const SizedBox(height: 15),

                 Text(
                  'Déconnexion',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: textColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                  ),
                ),

                const SizedBox(height: 8),

                 Text(
                  'Voulez-vous vraiment vous déconnecter ?',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: greyText,
                    fontSize: 13,
                    height: 1.4,
                  ),
                ),

                const SizedBox(height: 22),

                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pop(dialogContext);
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: textColor,
                          side: const BorderSide(
                            color: divider,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                          ),
                        ),
                        child:  Text(
                          'Annuler',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          Navigator.pop(dialogContext);
                          Navigator.pop(context);

                          // TODO:
                          // await context
                          //     .read<AuthViewModel>()
                          //     .logout();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: red,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                          ),
                        ),
                        child:  Text(
                          'Déconnexion',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// ============================================================================
// TITRE DE SECTION
// ============================================================================

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: const EdgeInsets.fromLTRB(7, 10, 7, 4),
      color: const Color(0xFFF7F7F7),
      child: Text(
        title,
        style:  Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Color(0xFF777777),
          fontSize: 9,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}

// ============================================================================
// MENU TILE
// ============================================================================

class _MenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  final Color? iconColor;
  final Color? titleColor;
  final bool showDivider;

  const _MenuTile({
    required this.icon,
    required this.title,
    required this.onTap,
    this.iconColor,
    this.titleColor,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 39,
      decoration: BoxDecoration(
        color: Colors.white,
        border: showDivider
            ? const Border(
          bottom: BorderSide(
            color: Color(0xFFE2E2E2),
            width: 0.7,
          ),
        )
            : null,
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 7,
          ),
          child: Row(
            children: [
              // Icone
              Container(
                width: 23,
                height: 23,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: (iconColor ?? const Color(0xFF002B6C))
                      .withOpacity(0.06),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Icon(
                  icon,
                  size: 15,
                  color: iconColor ?? const Color(0xFF002B6C),
                ),
              ),

              const SizedBox(width: 7),

              // Titre
              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: titleColor ?? const Color(0xFF292929),
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              // Chevron
              const Icon(
                Icons.chevron_right_rounded,
                size: 16,
                color: Color(0xFF777777),
              ),
            ],
          ),
        ),
      ),
    );
  }
}