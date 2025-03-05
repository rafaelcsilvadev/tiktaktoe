import 'package:flutter_modular/flutter_modular.dart';
import 'package:tiktaktoe/modules/game/game_routes.dart';
import 'package:tiktaktoe/modules/game/presentation/store/game_field_store/game_field_store.dart';
import 'package:tiktaktoe/modules/game/presentation/store/game_field_store/game_field_store_impl.dart';
import 'package:tiktaktoe/modules/game/presentation/views/game_view.dart';
import 'package:tiktaktoe/modules/game/presentation/views/players_view.dart';

class GameModule extends Module {
  @override
  void exportedBinds(Injector i) {
    super.exportedBinds(i);

    i.addLazySingleton<GameFieldStore>(GameFieldStoreImpl.new);
  }

  @override
  void routes(r) {
    r
      ..child(
        GameRoutes.players,
        child: (_) => const PlayersView(),
        transition: TransitionType.fadeIn,
      )
      ..child(
        GameRoutes.game,
        child: (_) => const GameView(),
        transition: TransitionType.fadeIn,
      );
  }
}
