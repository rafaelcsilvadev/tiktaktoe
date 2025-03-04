import 'package:flutter_modular/flutter_modular.dart';
import 'package:tiktaktoe/app_routes.dart';
import 'package:tiktaktoe/modules/players/app_module.dart';

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
      AppRoutes.players,
      module: PlayersModule(),
      transition: TransitionType.fadeIn,
    );
  }
}
