import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tiktaktoe/core/components/app_text/app_text.dart';
import 'package:tiktaktoe/core/theme/app_colors.dart';
import 'package:tiktaktoe/modules/game/presentation/store/game_field_store/game_field_store.dart';

class GameField extends StatelessWidget {
  GameField({super.key, required this.onHouse});

  final void Function() onHouse;
  final GameFieldStore _gameFieldStore = Modular.get<GameFieldStore>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final double houseSize = size.width / 3.5;
    final double fontSize = houseSize * 0.7;

    return AnimatedBuilder(
      animation: _gameFieldStore,
      builder: (_, _) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    _gameFieldStore.onSetSymbol(index: 0);
                    onHouse();
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
                        right: BorderSide(
                          color: AppColors.neutral.value,
                          width: 2,
                        ),
                      ),
                    ),
                    child: Center(
                      child: AppText.bold(
                        _gameFieldStore.housesValues[0],
                        color: AppColors.neutral.value,
                        fontSize: fontSize,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _gameFieldStore.onSetSymbol(index: 1);
                    onHouse;
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
                        right: BorderSide(
                          color: AppColors.neutral.value,
                          width: 2,
                        ),
                        left: BorderSide(
                          color: AppColors.neutral.value,
                          width: 2,
                        ),
                      ),
                    ),
                    child: Center(
                      child: AppText.bold(
                        _gameFieldStore.housesValues[1],
                        color: AppColors.neutral.value,
                        fontSize: fontSize,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _gameFieldStore.onSetSymbol(index: 2);
                    onHouse();
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
                        left: BorderSide(
                          color: AppColors.neutral.value,
                          width: 2,
                        ),
                      ),
                    ),
                    child: Center(
                      child: AppText.bold(
                        _gameFieldStore.housesValues[2],
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
                    _gameFieldStore.onSetSymbol(index: 3);
                    onHouse();
                  },
                  child: Container(
                    width: houseSize,
                    height: houseSize,
                    decoration: BoxDecoration(
                      color: AppColors.primary.value,
                      border: Border(
                        top: BorderSide(
                          color: AppColors.neutral.value,
                          width: 2,
                        ),
                        bottom: BorderSide(
                          color: AppColors.neutral.value,
                          width: 2,
                        ),
                        right: BorderSide(
                          color: AppColors.neutral.value,
                          width: 2,
                        ),
                      ),
                    ),
                    child: Center(
                      child: AppText.bold(
                        _gameFieldStore.housesValues[3],
                        color: AppColors.neutral.value,
                        fontSize: fontSize,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _gameFieldStore.onSetSymbol(index: 4);
                    onHouse();
                  },
                  child: Container(
                    width: houseSize,
                    height: houseSize,
                    decoration: BoxDecoration(
                      color: AppColors.primary.value,
                      border: Border(
                        top: BorderSide(
                          color: AppColors.neutral.value,
                          width: 2,
                        ),
                        bottom: BorderSide(
                          color: AppColors.neutral.value,
                          width: 2,
                        ),
                        right: BorderSide(
                          color: AppColors.neutral.value,
                          width: 2,
                        ),
                        left: BorderSide(
                          color: AppColors.neutral.value,
                          width: 2,
                        ),
                      ),
                    ),
                    child: Center(
                      child: AppText.bold(
                        _gameFieldStore.housesValues[4],
                        color: AppColors.neutral.value,
                        fontSize: fontSize,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _gameFieldStore.onSetSymbol(index: 5);
                    onHouse();
                  },
                  child: Container(
                    width: houseSize,
                    height: houseSize,
                    decoration: BoxDecoration(
                      color: AppColors.primary.value,
                      border: Border(
                        top: BorderSide(
                          color: AppColors.neutral.value,
                          width: 2,
                        ),
                        bottom: BorderSide(
                          color: AppColors.neutral.value,
                          width: 2,
                        ),
                        left: BorderSide(
                          color: AppColors.neutral.value,
                          width: 2,
                        ),
                      ),
                    ),
                    child: Center(
                      child: AppText.bold(
                        _gameFieldStore.housesValues[5],
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
                    _gameFieldStore.onSetSymbol(index: 6);
                    onHouse();
                  },
                  child: Container(
                    width: houseSize,
                    height: houseSize,
                    decoration: BoxDecoration(
                      color: AppColors.primary.value,
                      border: Border(
                        top: BorderSide(
                          color: AppColors.neutral.value,
                          width: 2,
                        ),
                        right: BorderSide(
                          color: AppColors.neutral.value,
                          width: 2,
                        ),
                      ),
                    ),
                    child: Center(
                      child: AppText.bold(
                        _gameFieldStore.housesValues[6],
                        color: AppColors.neutral.value,
                        fontSize: fontSize,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _gameFieldStore.onSetSymbol(index: 7);
                    onHouse();
                  },
                  child: Container(
                    width: houseSize,
                    height: houseSize,
                    decoration: BoxDecoration(
                      color: AppColors.primary.value,
                      border: Border(
                        top: BorderSide(
                          color: AppColors.neutral.value,
                          width: 2,
                        ),
                        right: BorderSide(
                          color: AppColors.neutral.value,
                          width: 2,
                        ),
                        left: BorderSide(
                          color: AppColors.neutral.value,
                          width: 2,
                        ),
                      ),
                    ),
                    child: Center(
                      child: AppText.bold(
                        _gameFieldStore.housesValues[7],
                        color: AppColors.neutral.value,
                        fontSize: fontSize,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _gameFieldStore.onSetSymbol(index: 8);
                    onHouse();
                  },
                  child: Container(
                    width: houseSize,
                    height: houseSize,
                    decoration: BoxDecoration(
                      color: AppColors.primary.value,
                      border: Border(
                        top: BorderSide(
                          color: AppColors.neutral.value,
                          width: 2,
                        ),
                        left: BorderSide(
                          color: AppColors.neutral.value,
                          width: 2,
                        ),
                      ),
                    ),
                    child: Center(
                      child: AppText.bold(
                        _gameFieldStore.housesValues[8],
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
      },
    );
  }
}
