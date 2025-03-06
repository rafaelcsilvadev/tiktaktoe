import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tiktaktoe/core/components/app_text/app_text.dart';
import 'package:tiktaktoe/core/theme/app_colors.dart';

class AppDialogComponent extends StatelessWidget {
  const AppDialogComponent({
    super.key,
    required this.title,
    this.message,
    required this.primaryButton,
    this.secondaryButton,
    required this.backgroundColor,
    this.richMessage,
    this.messageFontSize,
  });

  final String title;
  final String? message;
  final Color backgroundColor;
  final RichText? richMessage;
  final double? messageFontSize;

  final Widget primaryButton;
  final Widget? secondaryButton;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: backgroundColor,
      insetPadding: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppText.bold(
              title,
              color: AppColors.neutral.value,
              fontSize: 24,
            ),
            const Gap(20),
            if (richMessage != null)
              richMessage!
            else if (message != null)
              AppText.regular(
                message!,
                color:  AppColors.neutral.value,
                fontSize: messageFontSize ?? 16,
              ),
            const SizedBox(height: 20),
            primaryButton,
            secondaryButton ?? Container(),
          ],
        ),
      ),
    );
  }
}
