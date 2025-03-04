import 'package:flutter_modular/flutter_modular.dart';
import 'package:tiktaktoe/modules/players/players_routes.dart';
import 'package:tiktaktoe/modules/players/presentation/views/players_view.dart';

class PlayersModule extends Module {
  @override
  void exportedBinds(Injector i) {
    super.exportedBinds(i);
  }

  @override
  List<Module> get imports => [];

  @override
  void routes(r) {
    r.child(
      PlayersRoutes.players,
      child: (_) => const PlayersView(),
      transition: TransitionType.fadeIn,
    );
  }
}
