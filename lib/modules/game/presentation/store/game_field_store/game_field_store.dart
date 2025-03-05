import 'package:flutter/material.dart';

abstract class GameFieldStore extends ChangeNotifier {
  List<String> get housesValues;
  List<int> get player1Fields;
  List<int> get player2Fields;
  bool get isPlayer1;
  void onSetSymbol({required int index});
  void onChangePlayer();
  void reset();
}
