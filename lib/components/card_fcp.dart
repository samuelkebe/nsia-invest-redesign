import 'dart:math';

import 'package:NsiaInvestreDesign/models/FcpModel.dart';
import 'package:flutter/material.dart';

class CardFcp extends StatelessWidget {
  final FcpModel? fund;

  const CardFcp({
    super.key,
    this.fund,
  });

  @override
  Widget build(BuildContext context) {
    final perf12 = fund?.perf12 ?? 0;
    final perf6 = fund?.perf6 ?? 0;
    final fundColor = fund?.color ?? const Color(0xFFD5B23A);
    final perf12Positive = perf12 >= 0;
    final perf6Positive = perf6 >= 0;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 22,
            offset: const Offset(0, 9),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Colonne gauche : Avatar + nom + type + VL
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: fundColor.withOpacity(0.20),
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.06),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          fund?.urlImage ?? 'assets/images/funds/default.png',
                          width: 56,
                          height: 56,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: fundColor.withOpacity(0.10),
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.account_balance_rounded,
                                color: fundColor,
                                size: 26,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            (fund?.name ?? '').toUpperCase(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0.2,
                            ),
                          ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: List.generate(6, (index) {
                            const barColors = [
                              Color(0xFF7BC96F),
                              Color(0xFFA9CB4F),
                              Color(0xFFD9C440),
                              Color(0xFFE8A93D),
                              Color(0xFFE07C3E),
                              Color(0xFFD9483D),
                            ];
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 1),
                              width: 5,
                              height: 6.0 + (index * 3.0),
                              decoration: BoxDecoration(
                                color: barColors[index],
                                borderRadius: BorderRadius.circular(1.5),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  fund?.fundType.label ?? '',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFF687386),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'VL: ${fund?.vl.toStringAsFixed(4)} FCFA',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF1E2022),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Date VL: ${fund?.date}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: const Color(0xFF1E2022),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 16),

          // Colonne droite : Performances + sparkline + bouton
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // 12 Mois
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '12 Mois :',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF1E2022),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${perf12Positive ? '+' : ''}${perf12.toStringAsFixed(2)}%',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: perf12Positive
                            ? const Color(0xFF15966A)
                            : const Color(0xFFD64C4C),
                      ),
                    ),
                    const SizedBox(width: 2),
                    Icon(
                      perf12Positive
                          ? Icons.arrow_upward_rounded
                          : Icons.arrow_downward_rounded,
                      color: perf12Positive
                          ? const Color(0xFF15966A)
                          : const Color(0xFFD64C4C),
                      size: 10,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // 6 Mois
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '6 Mois :',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF1E2022),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${perf6Positive ? '+' : ''}${perf6.toStringAsFixed(2)}%',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: perf6Positive
                            ? const Color(0xFF15966A)
                            : const Color(0xFFD64C4C),
                      ),
                    ),
                    const SizedBox(width: 2),
                    Icon(
                      perf6Positive
                          ? Icons.arrow_upward_rounded
                          : Icons.arrow_downward_rounded,
                      color: perf6Positive
                          ? const Color(0xFF15966A)
                          : const Color(0xFFD64C4C),
                      size: 10,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // Sparkline
                SizedBox(
                  width: 150,
                  height: 68,
                  child: CustomPaint(
                    painter: _SparklinePainter(
                      seed: (fund?.name ?? 'fund').hashCode,
                      trendUp: perf6Positive,
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SparklinePainter extends CustomPainter {
  final int seed;
  final bool trendUp;

  _SparklinePainter({required this.seed, required this.trendUp});

  @override
  void paint(Canvas canvas, Size size) {
    final random = Random(seed);
    const pointCount = 14;
    final points = <Offset>[];

    double value = 0.35 + random.nextDouble() * 0.2;
    for (int i = 0; i < pointCount; i++) {
      final progress = i / (pointCount - 1);
      final bias = trendUp ? progress * 0.5 : -progress * 0.15;
      value += (random.nextDouble() - 0.4) * 0.12 + bias * 0.05;
      value = value.clamp(0.05, 0.95);
      points.add(Offset(
        progress * size.width,
        size.height - (value * size.height),
      ));
    }

    final linePath = Path()..moveTo(points.first.dx, points.first.dy);
    for (final p in points.skip(1)) {
      linePath.lineTo(p.dx, p.dy);
    }

    final fillPath = Path.from(linePath)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    final fillPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFFD5B23A).withOpacity(0.25),
          const Color(0xFFD5B23A).withOpacity(0.02),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawPath(fillPath, fillPaint);

    final linePaint = Paint()
      ..color = const Color(0xFFD9D2C4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    canvas.drawPath(linePath, linePaint);

    canvas.drawCircle(points.last, 4, Paint()..color = const Color(0xFFD64C4C));
  }

  @override
  bool shouldRepaint(covariant _SparklinePainter oldDelegate) {
    return oldDelegate.seed != seed || oldDelegate.trendUp != trendUp;
  }
}