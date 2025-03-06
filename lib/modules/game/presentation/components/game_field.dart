import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tiktaktoe/core/components/app_text/app_text.dart';
import 'package:tiktaktoe/core/theme/app_colors.dart';
import 'package:tiktaktoe/modules/game/presentation/stores/game_field_store/game_field_store.dart';

class GameField extends StatelessWidget {
  GameField({super.key, required this.onHouse});

  final void Function() onHouse;
  final GameFieldStore _gameFieldStore = Modular.get<GameFieldStore>();

  void onTapHouse({required int index}) {
    _gameFieldStore.onSetSymbol(index: index);
    onHouse();
  }

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
                  onTap: () => onTapHouse(index: 0),
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
                  onTap: () => onTapHouse(index: 1),
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
                  onTap: () => onTapHouse(index: 2),
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
                  onTap: () => onTapHouse(index: 3),
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
                  onTap: () => onTapHouse(index: 4),
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
                  onTap: () => onTapHouse(index: 5),
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
                  onTap: () => onTapHouse(index: 6),
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
                  onTap: () => onTapHouse(index: 7),
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
                  onTap: () => onTapHouse(index: 8),
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
