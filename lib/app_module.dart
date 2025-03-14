import 'package:flutter_modular/flutter_modular.dart';
import 'package:tiktaktoe/app_routes.dart';
import 'package:tiktaktoe/modules/game/game_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
    GameModule(),
  ];

  @override
  void routes(r) {
    r.module(
      AppRoutes.games,
      module: GameModule(),
      transition: TransitionType.fadeIn,
    );
  }
}
