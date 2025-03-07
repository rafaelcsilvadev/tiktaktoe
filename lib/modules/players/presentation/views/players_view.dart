import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tiktaktoe/core/assets/images/app_images.dart';
import 'package:tiktaktoe/core/components/app_button/app_button.dart';
import 'package:tiktaktoe/core/components/app_text/app_text.dart';
import 'package:tiktaktoe/core/components/app_text_field/app_text_field.dart';
import 'package:tiktaktoe/core/theme/app_colors.dart';

class PlayersView extends StatefulWidget {
  const PlayersView({super.key});

  @override
  State<PlayersView> createState() => _PlayersViewState();
}

class _PlayersViewState extends State<PlayersView> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: AppColors.primary.value,
      appBar: PreferredSize(
        preferredSize: Size.zero,
        child: AppBar(backgroundColor: AppColors.primary.value),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              Gap(size.height * 0.02),
              Center(
                child: AppText.regular(
                  'Tik Tak Toe',
                  color: AppColors.neutral.value,
                  fontSize: size.width * 0.1,
                ),
              ),
              Gap(size.height * 0.02),
              Image.asset(AppImages.logo, scale: 1.5),
              Gap(size.height * 0.02),
              Container(
                alignment: Alignment.centerLeft,
                child: AppText.regular(
                  'Jogador 1',
                  color: AppColors.neutral.value,
                  fontSize: size.width * 0.05,
                ),
              ),
              Gap(size.height * 0.01),
              const AppTextField(),
              Gap(size.height * 0.03),
              Container(
                alignment: Alignment.centerLeft,
                child: AppText.regular(
                  'Jogador 2',
                  color: AppColors.neutral.value,
                  fontSize: size.width * 0.05,
                ),
              ),
              Gap(size.height * 0.01),
              const AppTextField(),
              Gap(size.height * 0.06),
              SizedBox(
                width: size.width,
                height: 50,
                child: AppButton.primary(
                  backgroundColor: WidgetStateProperty.all(
                    AppColors.neutral.value,
                  ),
                  onPressed: () {},
                  child: AppText.bold(
                    'Jogar',
                    color: AppColors.primary.value,
                    fontSize: size.width * 0.05,
                  ),
                ),
              ),
              Gap(size.height * 0.06),
            ],
          ),
        ),
      ),
    );
  }
}
