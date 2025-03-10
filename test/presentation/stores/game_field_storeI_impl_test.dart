import 'package:flutter_test/flutter_test.dart';
import 'package:tiktaktoe/modules/game/presentation/stores/game_field_store/game_field_store_impl.dart';

void main() {
  group('GameFieldStoreImpl', () {
    late GameFieldStoreImpl gameFieldStoreImpl;

    setUp(() {
      gameFieldStoreImpl = GameFieldStoreImpl();
    });
    group('isPlayer1 - onChangePlayer', () {
      test('default true', () {
        expect(gameFieldStoreImpl.isPlayer1, true);
      });

      test('call onChangePlayer - isPlayer1 = false', () {
        gameFieldStoreImpl.onChangePlayer();

        expect(gameFieldStoreImpl.isPlayer1, false);
      });
    });

    group('housesValues, player1Fields, player2Fields -  onSetSymbol', () {
      test('default housesValues - length = 9', () {
        expect(gameFieldStoreImpl.housesValues.length, 9);
      });

      test('default housesValues - values = ""', () {
        expect(
          gameFieldStoreImpl.housesValues.every((item) => item == ''),
          true,
        );
      });

      test('default player1Fields - []', () {
        expect(gameFieldStoreImpl.player1Fields, []);
      });

      test('default player2Fields - []', () {
        expect(gameFieldStoreImpl.player2Fields, []);
      });

      test('default player1Symbol - X', () {
        expect(gameFieldStoreImpl.player1Symbol, 'X');
      });

      test('default player2Symbol - O', () {
        expect(gameFieldStoreImpl.player2Symbol, 'O');
      });

      test(
        'call onSetSymbol and onChangePlayer - housesValues contains player1Symbol and player2Symbol, player1Fields = [0], player2Fields = [1]',
        () {
          gameFieldStoreImpl.onSetSymbol(index: 0);
          gameFieldStoreImpl.onChangePlayer();
          gameFieldStoreImpl.onSetSymbol(index: 1);

          expect(
            gameFieldStoreImpl.housesValues[0] ==
                gameFieldStoreImpl.player1Symbol,
            true,
          );
          expect(
            gameFieldStoreImpl.housesValues[1] ==
                gameFieldStoreImpl.player2Symbol,
            true,
          );
          expect(gameFieldStoreImpl.player1Fields[0] == 0, true);
          expect(gameFieldStoreImpl.player2Fields[0] == 1, true);
        },
      );
    });

    group('houseIsFull', () {
      test('true', () {
        gameFieldStoreImpl.onSetSymbol(index: 0);
        expect(gameFieldStoreImpl.houseIsFull(index: 0), true);
      });

      test('false', () {
        expect(gameFieldStoreImpl.houseIsFull(index: 1), false);
      });
    });

    group('reset', () {
      test('call reset', () {
        gameFieldStoreImpl.onSetSymbol(index: 0);
        gameFieldStoreImpl.onChangePlayer();
        gameFieldStoreImpl.onSetSymbol(index: 1);
        gameFieldStoreImpl.reset();

        expect(gameFieldStoreImpl.isPlayer1, true);
        expect(
          gameFieldStoreImpl.housesValues.every((item) => item == ''),
          true,
        );
        expect(gameFieldStoreImpl.player1Fields, []);
        expect(gameFieldStoreImpl.player2Fields, []);
      });
    });
  });
}
