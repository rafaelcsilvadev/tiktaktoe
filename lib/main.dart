import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tiktaktoe/app_module.dart';
import 'package:tiktaktoe/app_widget.dart';

void main() async {
  return runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
