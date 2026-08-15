import 'package:flutter/material.dart';


class PortefeuilleView extends StatelessWidget {
  const PortefeuilleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: Column(
          children: [
            // App Bar
            _buildAppBar(),

            // Contenu scrollable
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    _buildHeader(),
                    const SizedBox(height: 24),
                    const Text(
                      'Fonds',
                      style: TextStyle(
                        color: Color(0xFF10213F),
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildFundCard(
                      name: 'NSIA FONDS DIVERSIFIE',
                      type: 'FCP - Fonds Diversifié',
                      vl: '5 748,6231 FCFA',
                      date: '15-12-2023',
                      perf12: '+2.19%',
                      perf6: '+3.50%',
                      color: const Color(0xFF003B7A),
                      lightColor: const Color(0xFFE8EEF7),
                    ),
                    const SizedBox(height: 12),
                    _buildFundCard(
                      name: 'AURORE SECURITE',
                      type: 'FCP - Fonds Obligataire',
                      vl: '5 648,3329 FCFA',
                      date: '15-12-2023',
                      perf12: '+5.84%',
                      perf6: '+3.62%',
                      color: const Color(0xFF0D7C4F),
                      lightColor: const Color(0xFFE8F5EE),
                    ),
                    const SizedBox(height: 12),
                    _buildFundCard(
                      name: 'AURORE OPPORTUNITES',
                      type: 'FCP - Fonds Actions',
                      vl: '5 985,5117 FCFA',
                      date: '15-12-2023',
                      perf12: '+0.30%',
                      perf6: '+5.09%',
                      color: const Color(0xFFB8860B),
                      lightColor: const Color(0xFFF8F2E0),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // APP BAR
  // ============================================================
  Widget _buildAppBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFF0F0F0),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          // Icône de retour (invisible mais pour le placement)
          const SizedBox(width: 40),

          // Logo
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: Color(0xFF003B7A),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.show_chart_rounded,
                    color: Colors.white,
                    size: 14,
                  ),
                ),
                const SizedBox(width: 6),
                const Text(
                  'NSIA',
                  style: TextStyle(
                    color: Color(0xFF003B7A),
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.5,
                  ),
                ),
                const Text(
                  ' INVEST',
                  style: TextStyle(
                    color: Color(0xFFD5B23A),
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),

          // Actions
          Row(
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: const Icon(
                  Icons.search_rounded,
                  color: Color(0xFF003B7A),
                  size: 22,
                ),
                onPressed: () {},
              ),
              const SizedBox(width: 16),
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: const Icon(
                  Icons.notifications_outlined,
                  color: Color(0xFF003B7A),
                  size: 22,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ============================================================
  // HEADER
  // ============================================================
  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF003B7A), Color(0xFF0A5DB7)],
        ),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF003B7A).withOpacity(0.25),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'NSIA ASSET MANAGEMENT',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'OFFREZ-VOUS LES CHANCES DE MIEUX FRUCTIFIER VOTRE ÉPARGNE',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w800,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // FUND CARD
  // ============================================================
  Widget _buildFundCard({
    required String name,
    required String type,
    required String vl,
    required String date,
    required String perf12,
    required String perf6,
    required Color color,
    required Color lightColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // En-tête du fonds avec icône
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 10),
            child: Row(
              children: [
                // Icône du fonds
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: lightColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.circle_rounded,
                    color: color,
                    size: 16,
                  ),
                ),
                const SizedBox(width: 12),
                // Nom et type
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          color: Color(0xFF10213F),
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 0.3,
                        ),
                      ),
                      Text(
                        type,
                        style: const TextStyle(
                          color: Color(0xFF687386),
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Séparateur
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              height: 1,
              color: const Color(0xFFF0F0F0),
            ),
          ),

          // Contenu principal
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // VL
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'VL',
                        style: TextStyle(
                          color: Color(0xFF9AA3B1),
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        vl,
                        style: const TextStyle(
                          color: Color(0xFF10213F),
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Date VL: $date',
                        style: const TextStyle(
                          color: Color(0xFF9AA3B1),
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),

                // Performances
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _perfItem('12 Mois', perf12),
                      const SizedBox(height: 4),
                      _perfItem('6 Mois', perf6),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _perfItem(String label, String value) {
    final isPositive = value.startsWith('+');
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF687386),
            fontSize: 10,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          value,
          style: TextStyle(
            color: isPositive ? const Color(0xFF15966A) : const Color(0xFFD64C4C),
            fontSize: 12,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}