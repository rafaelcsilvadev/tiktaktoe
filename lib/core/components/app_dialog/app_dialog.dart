import 'package:tiktaktoe/core/components/app_dialog/app_dialog_component.dart';

class AppDialog extends AppDialogComponent {
  const AppDialog.primary({
    super.key,
    required super.backgroundColor,
    super.message,
    super.messageFontSize,
    required super.primaryButton,
    super.richMessage,
    super.secondaryButton,
    required super.title,
  });
}
