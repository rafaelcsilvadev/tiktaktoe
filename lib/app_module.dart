import 'package:flutter_modular/flutter_modular.dart';
import 'package:tiktaktoe/app_routes.dart';
import 'package:tiktaktoe/modules/game/game_module.dart';

class AppModule extends Module {
  @override
  void exportedBinds(Injector i) {
    super.exportedBinds(i);
  }

  @override
  List<Module> get imports => [];

  @override
  void routes(r) {
    r.module(
      AppRoutes.games,
      module: GameModule(),
      transition: TransitionType.fadeIn,
    );
  }
}
