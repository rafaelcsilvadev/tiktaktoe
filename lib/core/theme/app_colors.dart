import 'package:flutter/material.dart';

enum AppColors {
  primary,
  secondary,
  neutral,
  positive,
  error;

  Color get value => switch (this) {
    AppColors.primary => const Color(0XFF000000),
    AppColors.secondary => const Color(0XFF212121),
    AppColors.neutral => const Color(0XFFFFFFFF),
    AppColors.positive => const Color(0xFF03EC22),
    AppColors.error => const Color(0xFFFC0101),
  };
}
