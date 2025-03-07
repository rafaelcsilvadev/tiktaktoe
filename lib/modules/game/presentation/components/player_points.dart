import 'package:flutter/material.dart';
import 'package:tiktaktoe/core/components/app_text/app_text.dart';
import 'package:tiktaktoe/core/theme/app_colors.dart';

class PlayerPoints extends StatelessWidget {
  const PlayerPoints({
    super.key,
    required this.name,
    required this.point,
    required this.playerNameColor,
  });

  final String name;
  final String point;
  final Color playerNameColor;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Column(
      children: [
        AppText.semiBold(
          name,
          color: playerNameColor,
          fontSize: size.width * 0.05,
        ),
        AppText.semiBold(
          point,
          color: AppColors.neutral.value,
          fontSize: size.width * 0.05,
        ),
      ],
    );
  }
}
