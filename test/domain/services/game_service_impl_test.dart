import 'package:flutter_test/flutter_test.dart';
import 'package:tiktaktoe/modules/game/domain/services/game_service/game_service_impl.dart';

void main() {
  group('GameServiceImpl', () {
    late GameServiceImpl gameServiceImpl;

    setUp(() {
      gameServiceImpl = GameServiceImpl();
    });
    group('hasWinCondition', () {
      test('win', () {
        final bool win = gameServiceImpl.hasWinCondition(playersFields: [0, 1, 2]);

        expect(win, true);
      });

      test('lose', () {
        final bool lose = gameServiceImpl.hasWinCondition(
          playersFields: [0, 8, 9],
        );

        expect(lose, false);
      });
    });
  });
}
