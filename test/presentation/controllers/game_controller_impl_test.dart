import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tiktaktoe/modules/game/domain/services/game_service/game_service_impl.dart';
import 'package:tiktaktoe/modules/game/presentation/controllers/game_controller/game_controller_impl.dart';
import 'package:tiktaktoe/modules/game/presentation/stores/game_field_store/game_field_store_impl.dart';

class MockGameServiceImpl extends Mock implements GameServiceImpl {}

void main() {
  group('GameControllerImpl', () {
    late GameControllerImpl gameControllerImpl;
    late GameServiceImpl gameServiceImpl;
    late GameFieldStoreImpl gameFieldStoreImpl;

    setUp(() {
      gameServiceImpl = MockGameServiceImpl();
      gameFieldStoreImpl = GameFieldStoreImpl();
      gameControllerImpl = GameControllerImpl(gameService: gameServiceImpl);
    });
    group('player1Name, player2Name - setPlayersName', () {
      test('default player1Name = ""', () {
        expect(gameControllerImpl.player1Name == '', true);
      });

      test('default player2Name = ""', () {
        expect(gameControllerImpl.player2Name == '', true);
      });

      test('call setPlayersName - player1Name = T, player1Name = A', () {
        gameControllerImpl.setPlayersName(player1Name: 'T', player2Name: 'A');

        expect(gameControllerImpl.player1Name == 'T', true);
        expect(gameControllerImpl.player2Name == 'A', true);
      });
    });

    group('hasWinCondition', () {
      test('default player1point = 0', () {
        expect(gameControllerImpl.player1point == '0', true);
      });

      test('default player2point = 0', () {
        expect(gameControllerImpl.player2point == '0', true);
      });

      test('call hasWinCondition - player1point = 1, player2point = 1', () {
        when(
          () => gameServiceImpl.hasWinCondition(playersFields: [0, 1, 2]),
        ).thenAnswer((_) => true);
        gameControllerImpl.hasWinCondition(
          playersFields: [0, 1, 2],
          isPlayer1: gameFieldStoreImpl.isPlayer1,
        );
        gameFieldStoreImpl.onChangePlayer();
        gameControllerImpl.hasWinCondition(
          playersFields: [0, 1, 2],
          isPlayer1: gameFieldStoreImpl.isPlayer1,
        );

        expect(gameControllerImpl.player1point == '1', true);
        expect(gameControllerImpl.player2point == '1', true);
      });
    });

    group('resetPoint', () {
      test('call resetPoint - player1point = 0, player2point = 0', () {
        when(
          () => gameServiceImpl.hasWinCondition(playersFields: [0, 1, 2]),
        ).thenAnswer((_) => true);

        gameControllerImpl.hasWinCondition(
          playersFields: [0, 1, 2],
          isPlayer1: gameFieldStoreImpl.isPlayer1,
        );
        gameFieldStoreImpl.onChangePlayer();
        gameControllerImpl.hasWinCondition(
          playersFields: [0, 1, 2],
          isPlayer1: gameFieldStoreImpl.isPlayer1,
        );
        gameControllerImpl.resetPoint();

        expect(gameControllerImpl.player1point == '0', true);
        expect(gameControllerImpl.player2point == '0', true);
      });
    });
  });
}
