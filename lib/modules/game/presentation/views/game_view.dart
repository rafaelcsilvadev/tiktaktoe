import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tiktaktoe/core/components/app_text/app_text.dart';
import 'package:tiktaktoe/core/theme/app_colors.dart';

class GameView extends StatelessWidget {
  GameView({super.key});
  final List<String> housesValues = List.filled(9, '');

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: AppColors.primary.value,
      appBar: AppBar(
        backgroundColor: AppColors.primary.value,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.chevron_left, color: AppColors.neutral.value),
        ),
      ),
      body: Column(
        children: [
          Gap(size.height * 0.01),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PlayerPoints(name: 'Jogador 1', point: '0'),
              PlayerPoints(name: 'Jogador 2', point: '0'),
            ],
          ),
          Gap(size.height * 0.1),
          Container(
            alignment: Alignment.center,
            child: GameField(isPlayer1: true),
          ),
        ],
      ),
    );
  }
}

class GameField extends StatefulWidget {
  GameField({super.key, required this.isPlayer1});

  final bool isPlayer1;


  @override
  State<GameField> createState() => _GameFieldState();
}

class _GameFieldState extends State<GameField> {
  final List<String> housesValues = List.filled(9, '');

  void onSetSymbolInList({required int index}) {
    if (widget.isPlayer1) {
      setState(() {
        housesValues[index] = 'X';
      });
    } else {
      setState(() {
        housesValues[index] = 'O';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final double houseSize = size.width / 3.5;
    final double fontSize = houseSize * 0.7;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                onSetSymbolInList(index: 0);
              },
              child: Container(
                width: houseSize,
                height: houseSize,
                decoration: BoxDecoration(
                  color: AppColors.primary.value,
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.neutral.value,
                      width: 2,
                    ),
                    right: BorderSide(color: AppColors.neutral.value, width: 2),
                  ),
                ),
                child: Center(
                  child: AppText.bold(
                    housesValues[0],
                    color: AppColors.neutral.value,
                    fontSize: fontSize,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                onSetSymbolInList(index: 1);
              },
              child: Container(
                width: houseSize,
                height: houseSize,
                decoration: BoxDecoration(
                  color: AppColors.primary.value,
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.neutral.value,
                      width: 2,
                    ),
                    right: BorderSide(color: AppColors.neutral.value, width: 2),
                    left: BorderSide(color: AppColors.neutral.value, width: 2),
                  ),
                ),
                child: Center(
                  child: AppText.bold(
                    housesValues[1],
                    color: AppColors.neutral.value,
                    fontSize: fontSize,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                onSetSymbolInList(index: 2);
              },
              child: Container(
                width: houseSize,
                height: houseSize,
                decoration: BoxDecoration(
                  color: AppColors.primary.value,
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.neutral.value,
                      width: 2,
                    ),
                    left: BorderSide(color: AppColors.neutral.value, width: 2),
                  ),
                ),
                child: Center(
                  child: AppText.bold(
                    housesValues[2],
                    color: AppColors.neutral.value,
                    fontSize: fontSize,
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                onSetSymbolInList(index: 3);
              },
              child: Container(
                width: houseSize,
                height: houseSize,
                decoration: BoxDecoration(
                  color: AppColors.primary.value,
                  border: Border(
                    top: BorderSide(color: AppColors.neutral.value, width: 2),
                    bottom: BorderSide(
                      color: AppColors.neutral.value,
                      width: 2,
                    ),
                    right: BorderSide(color: AppColors.neutral.value, width: 2),
                  ),
                ),
                child: Center(
                  child: AppText.bold(
                    housesValues[3],
                    color: AppColors.neutral.value,
                    fontSize: fontSize,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                onSetSymbolInList(index: 4);
              },
              child: Container(
                width: houseSize,
                height: houseSize,
                decoration: BoxDecoration(
                  color: AppColors.primary.value,
                  border: Border(
                    top: BorderSide(color: AppColors.neutral.value, width: 2),
                    bottom: BorderSide(
                      color: AppColors.neutral.value,
                      width: 2,
                    ),
                    right: BorderSide(color: AppColors.neutral.value, width: 2),
                    left: BorderSide(color: AppColors.neutral.value, width: 2),
                  ),
                ),
                child: Center(
                  child: AppText.bold(
                    housesValues[4],
                    color: AppColors.neutral.value,
                    fontSize: fontSize,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                onSetSymbolInList(index: 5);
              },
              child: Container(
                width: houseSize,
                height: houseSize,
                decoration: BoxDecoration(
                  color: AppColors.primary.value,
                  border: Border(
                    top: BorderSide(color: AppColors.neutral.value, width: 2),
                    bottom: BorderSide(
                      color: AppColors.neutral.value,
                      width: 2,
                    ),
                    left: BorderSide(color: AppColors.neutral.value, width: 2),
                  ),
                ),
                child: Center(
                  child: AppText.bold(
                    housesValues[5],
                    color: AppColors.neutral.value,
                    fontSize: fontSize,
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                onSetSymbolInList(index: 6);
              },
              child: Container(
                width: houseSize,
                height: houseSize,
                decoration: BoxDecoration(
                  color: AppColors.primary.value,
                  border: Border(
                    top: BorderSide(color: AppColors.neutral.value, width: 2),
                    right: BorderSide(color: AppColors.neutral.value, width: 2),
                  ),
                ),
                child: Center(
                  child: AppText.bold(
                    housesValues[6],
                    color: AppColors.neutral.value,
                    fontSize: fontSize,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                onSetSymbolInList(index: 7);
              },
              child: Container(
                width: houseSize,
                height: houseSize,
                decoration: BoxDecoration(
                  color: AppColors.primary.value,
                  border: Border(
                    top: BorderSide(color: AppColors.neutral.value, width: 2),
                    right: BorderSide(color: AppColors.neutral.value, width: 2),
                    left: BorderSide(color: AppColors.neutral.value, width: 2),
                  ),
                ),
                child: Center(
                  child: AppText.bold(
                    housesValues[7],
                    color: AppColors.neutral.value,
                    fontSize: fontSize,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                onSetSymbolInList(index: 8);
              },
              child: Container(
                width: houseSize,
                height: houseSize,
                decoration: BoxDecoration(
                  color: AppColors.primary.value,
                  border: Border(
                    top: BorderSide(color: AppColors.neutral.value, width: 2),
                    left: BorderSide(color: AppColors.neutral.value, width: 2),
                  ),
                ),
                child: Center(
                  child: AppText.bold(
                    housesValues[8],
                    color: AppColors.neutral.value,
                    fontSize: fontSize,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class PlayerPoints extends StatelessWidget {
  const PlayerPoints({super.key, required this.name, required this.point});

  final String name;
  final String point;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Column(
      children: [
        AppText.semiBold(
          name,
          color: AppColors.neutral.value,
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
