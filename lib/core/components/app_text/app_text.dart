import 'package:flutter/painting.dart';
import 'package:tiktaktoe/core/components/app_text/app_text_component.dart';

class AppText extends AppTextComponent {
  const AppText.bold(super.data, {super.key, super.color, super.fontSize})
    : super(fontWeight: FontWeight.w700);

  const AppText.semiBold(super.data, {super.key, super.color, super.fontSize})
    : super(fontWeight: FontWeight.w600);

  const AppText.medium(super.data, {super.key, super.color, super.fontSize})
    : super(fontWeight: FontWeight.w500);

  const AppText.regular(super.data, {super.key, super.color, super.fontSize})
    : super(fontWeight: FontWeight.w400);
}
