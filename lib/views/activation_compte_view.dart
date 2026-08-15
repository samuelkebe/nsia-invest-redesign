import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// ============================================================
// COULEURS (Charte graphique NSIA)
// ============================================================
class AppColors {
  static const Color primaryColor = Color(0xFF003B7A);
  static const Color primaryDark = Color(0xFF002B5C);
  static const Color nsiaGold = Color(0xFFD5B23A);
  static const Color nsiaGoldLight = Color(0xFFE9D477);
  static const Color white = Colors.white;
  static const Color black = Color(0xFF10213F);
  static const Color lightGrey = Color(0xFFF5F7FA);
  static const Color darkGrey = Color(0xFF687386);
  static const Color textGrey = Color(0xFF8A8FA3);
  static const Color divider = Color(0xFFE6EAF0);
  static const Color green = Color(0xFF15966A);
  static const Color red = Color(0xFFD64C4C);
  static const Color lightBlue = Color(0xFF0A5DB7);
}

// ============================================================
// VUE ACTIVATION COMPTE
// ============================================================
class ActivationCompteView extends StatefulWidget {
  const ActivationCompteView({super.key});

  @override
  State<ActivationCompteView> createState() => _ActivationCompteViewState();
}

class _ActivationCompteViewState extends State<ActivationCompteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.primaryColor,
            size: 20,
          ),
          onPressed: () => context.pop(),
        ),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.show_chart_rounded,
                color: AppColors.white,
                size: 14,
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              'NSIA',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w900,
                fontSize: 16,
                letterSpacing: 0.5,
              ),
            ),
            const Text(
              ' INVEST',
              style: TextStyle(
                color: AppColors.nsiaGold,
                fontWeight: FontWeight.w900,
                fontSize: 16,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.help_outline_rounded,
              color: AppColors.primaryColor,
              size: 22,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              // Icône principale
              _buildMainIcon(),

              const SizedBox(height: 24),

              // Titre
              const Text(
                'Activation de compte',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: AppColors.primaryColor,
                  letterSpacing: -0.5,
                ),
              ),

              const SizedBox(height: 16),

              // Message d'information
              _buildInfoMessage(),

              const SizedBox(height: 32),

              // Bouton "Activer mon compte"
              _buildActivateButton(),

              const SizedBox(height: 12),

              // Bouton "Créer un compte"
              _buildCreateAccountButton(),

              const SizedBox(height: 12),

              // Bouton "Se connecter"
              _buildLoginButton(),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // COMPOSANTS
  // ============================================================

  Widget _buildMainIcon() {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.primaryColor, AppColors.lightBlue],
        ),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withOpacity(0.25),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: const Icon(
        Icons.person_add_alt_1_rounded,
        color: Colors.white,
        size: 36,
      ),
    );
  }

  Widget _buildInfoMessage() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.divider,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Ligne 1
          Row(
            children: [
              Icon(
                Icons.check_circle_rounded,
                color: AppColors.primaryColor,
                size: 18,
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Text(
                  'Vous êtes déjà client NSIA Asset Management ?',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Ligne 2
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.info_outline_rounded,
                color: AppColors.nsiaGold,
                size: 18,
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Text(
                  'Vous n\'avez pas encore accédé à NSIA INVEST ? Cliquez sur Activer mon compte et suivez les étapes afin d\'accéder à votre compte.',
                  style: TextStyle(
                    fontSize: 12.5,
                    color: AppColors.darkGrey,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActivateButton() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: () {
          // TODO: Navigation vers activation
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          shadowColor: AppColors.primaryColor.withOpacity(0.3),
          // elevation: 6,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.verified_rounded,
              size: 20,
            ),
            const SizedBox(width: 10),
            const Text(
              'Activer mon compte',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.3,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCreateAccountButton() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: OutlinedButton(
        onPressed: () {
          // TODO: Navigation vers création de compte
        },
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primaryColor,
          side: BorderSide(
            color: AppColors.primaryColor.withOpacity(0.3),
            width: 1.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.person_add_alt_1_rounded,
              size: 20,
            ),
            const SizedBox(width: 10),
            const Text(
              'Créer un compte',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: TextButton(
        onPressed: () {
          // TODO: Navigation vers connexion
        },
        style: TextButton.styleFrom(
          foregroundColor: AppColors.darkGrey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.login_rounded,
              size: 20,
              color: AppColors.darkGrey,
            ),
            const SizedBox(width: 10),
            const Text(
              'Se connecter',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.darkGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

