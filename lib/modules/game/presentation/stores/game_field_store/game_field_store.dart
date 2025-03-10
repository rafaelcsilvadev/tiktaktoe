import 'package:flutter/material.dart';

abstract class GameFieldStore extends ChangeNotifier {
  List<String> get housesValues;
  List<int> get player1Fields;
  List<int> get player2Fields;
  String get player1Symbol;
  String get player2Symbol;
  bool get isPlayer1;
  void onSetSymbol({required int index});
  bool houseIsFull({required int index});
  void onChangePlayer();
  void reset();
}
