import 'package:flutter/cupertino.dart';
import 'package:tiktaktoe/modules/game/presentation/stores/game_field_store/game_field_store.dart';

class GameFieldStoreImpl extends ChangeNotifier implements GameFieldStore {
  @override
  List<String> housesValues = List.filled(9, '');
  @override
  List<int> player1Fields = [];
  @override
  List<int> player2Fields = [];
  @override
  bool isPlayer1 = true;
  @override
  final String player1Symbol = 'X';
  @override
  final String player2Symbol = 'O';

  @override
  void reset() {
    isPlayer1 = true;
    housesValues = List.filled(9, '');
    player1Fields = [];
    player2Fields = [];
    notifyListeners();
  }

  @override
  void onChangePlayer() {
    isPlayer1 = !isPlayer1;
    notifyListeners();
  }

  @override
  void onSetSymbol({required int index}) {
    if (housesValues[index] != '') return;
    
    if (isPlayer1) {
      _removeLatPlayerSymbol(symbol: player1Symbol);
      housesValues[index] = player1Symbol;
      if (player1Fields.length == 3) player1Fields.removeAt(0);
      player1Fields.add(index);
      notifyListeners();
      return;
    }

    _removeLatPlayerSymbol(symbol: player2Symbol);
    housesValues[index] = player2Symbol;
    if (player2Fields.length == 3) player2Fields.removeAt(0);
    player2Fields.add(index);
    notifyListeners();
  }

  void _removeLatPlayerSymbol({required String symbol}) {
    if (isPlayer1 && player1Fields.length == 3) {
      housesValues[player1Fields[0]] = '';
      notifyListeners();
      return;
    }

    if (!isPlayer1 && player2Fields.length == 3) {
      housesValues[player2Fields[0]] = '';
      notifyListeners();
      return;
    }
  }
  
  @override
  bool houseIsFull({required int index}) {
    return housesValues[index] != '';
  }
}
