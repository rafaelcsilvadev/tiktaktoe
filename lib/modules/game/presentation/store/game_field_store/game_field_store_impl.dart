import 'package:flutter/cupertino.dart';
import 'package:tiktaktoe/modules/game/presentation/store/game_field_store/game_field_store.dart';

class GameFieldStoreImpl extends ChangeNotifier implements GameFieldStore {
  @override
  List<String> housesValues = List.filled(9, '');
  @override
  List<int> player1Fields = [];
  @override
  List<int> player2Fields = [];
  @override
  bool isPlayer1 = true;
  final String _player1Symbol = 'X';
  final String _player2Symbol = 'O';

  @override
  void reset() {
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
    if (isPlayer1) {
      _removeLatPlayerSymbol(symbol: _player1Symbol);

      housesValues[index] = _player1Symbol;
      player1Fields.add(index);

      notifyListeners();
      return;
    }

    _removeLatPlayerSymbol(symbol: _player2Symbol);

    housesValues[index] = _player2Symbol;
    player2Fields.add(index);

    notifyListeners();
  }

  void _removeLatPlayerSymbol({required String symbol}) {
    if (isPlayer1 && player1Fields.length == 3) {
      housesValues[player1Fields[0]] = '';
      player1Fields.removeAt(0);

      notifyListeners();

      return;
    }

    if (!isPlayer1 && player2Fields.length == 3) {
      housesValues[player2Fields[0]] = '';
      player2Fields.removeAt(0);
      notifyListeners();

      return;
    }
  }
}
