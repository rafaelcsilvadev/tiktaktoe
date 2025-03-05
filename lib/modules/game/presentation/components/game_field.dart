import 'package:flutter/material.dart';
import 'package:tiktaktoe/core/components/app_text/app_text.dart';
import 'package:tiktaktoe/core/theme/app_colors.dart';

class GameField extends StatefulWidget {
  const GameField({super.key, required this.isPlayer1, required this.onHouse});

  final bool isPlayer1;

  final Function(List<String>) onHouse;

  @override
  State<GameField> createState() => _GameFieldState();
}

class _GameFieldState extends State<GameField> {
  final List<String> housesValues = List.filled(9, '');
  List<int> player1Fields = [];
  List<int> player2Fields = [];
  String player1Symbol = 'X';
  String player2Symbol = 'O';

  void onSetSymbol({required int index}) {
    if (widget.isPlayer1) {
      removeLatPlayerSymbol(symbol: player1Symbol);

      setState(() {
        housesValues[index] = player1Symbol;
        player1Fields.add(index);
      });

      return;
    }

    removeLatPlayerSymbol(symbol: player2Symbol);

    setState(() {
      housesValues[index] = player2Symbol;
      player2Fields.add(index);
    });
  }

  void removeLatPlayerSymbol({required String symbol}) {
    if (widget.isPlayer1 && player1Fields.length == 3) {
      setState(() {
        housesValues[player1Fields[0]] = '';
        player1Fields.removeAt(0);
      });

      return;
    }

    if (!widget.isPlayer1 && player2Fields.length == 3) {
      setState(() {
        housesValues[player2Fields[0]] = '';
        player2Fields.removeAt(0);
      });

      return;
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
                onSetSymbol(index: 0);
                widget.onHouse(housesValues);
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
                onSetSymbol(index: 1);
                widget.onHouse(housesValues);
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
                onSetSymbol(index: 2);
                widget.onHouse(housesValues);
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
                onSetSymbol(index: 3);
                widget.onHouse(housesValues);
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
                onSetSymbol(index: 4);
                widget.onHouse(housesValues);
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
                onSetSymbol(index: 5);
                widget.onHouse(housesValues);
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
                onSetSymbol(index: 6);
                widget.onHouse(housesValues);
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
                onSetSymbol(index: 7);
                widget.onHouse(housesValues);
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
                onSetSymbol(index: 8);
                widget.onHouse(housesValues);
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
