import 'package:flutter/material.dart';

class AppButtonComponent extends StatelessWidget {
  const AppButtonComponent({
    super.key,
    this.onPressed,
    this.child,
    this.backgroundColor,
  });

  final void Function()? onPressed;
  final Widget? child;
  final WidgetStateProperty<Color?>? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(backgroundColor: backgroundColor),
      child: child,
    );
  }
}
