import 'package:flutter/material.dart';

enum AppColors {
  primary,
  secondary,
  neutral,
  error;

  Color get value => switch (this) {
    AppColors.primary => const Color(0XFF000000),
    AppColors.secondary => const Color(0XFF212121),
    AppColors.neutral => const Color(0XFFFFFFFF),
    AppColors.error => const Color.fromARGB(255, 252, 1, 1),
  };
}
