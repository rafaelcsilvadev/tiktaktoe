import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiktaktoe/core/assets/fonts/fonts.dart';
import 'package:tiktaktoe/core/theme/app_colors.dart';

class AppTextFieldComponent extends StatefulWidget {
  const AppTextFieldComponent({
    super.key,
    this.controller,
    this.cursorColor,
    this.cursorErrorColor,
    this.cursorOpacityAnimates,
    this.helperText,
    this.focusColor,
    this.hintText,
    this.enabled,
    this.inputFormatters,
    this.keyboardType,
    this.hintSize,
    this.helperSize,
    this.textSize,
    this.prefixIcon,
    this.prefixIconColor,
    this.suffixIcon,
    this.suffixIconColor,
    this.onChanged,
    this.readOnly = false,
    this.obscureText = false,
    this.error = false,
    this.maxLines,
    this.maxLength,
  });

  final TextEditingController? controller;
  final Color? cursorColor;
  final Color? cursorErrorColor;
  final bool? cursorOpacityAnimates;
  final String? helperText;
  final Color? focusColor;
  final String? hintText;
  final bool? enabled;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final double? hintSize;
  final double? helperSize;
  final double? textSize;
  final Widget? prefixIcon;
  final Color? prefixIconColor;
  final Widget? suffixIcon;
  final Color? suffixIconColor;
  final void Function(String)? onChanged;
  final bool readOnly;
  final bool obscureText;
  final bool error;
  final int? maxLines;
  final int? maxLength;

  @override
  State<AppTextFieldComponent> createState() => _TextFieldComponentState();
}

class _TextFieldComponentState extends State<AppTextFieldComponent> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: widget.maxLength,
      onChanged: widget.onChanged,
      controller: widget.controller,
      focusNode: _focusNode,
      cursorColor: widget.cursorColor ?? AppColors.neutral.value,
      cursorErrorColor: widget.cursorErrorColor,
      cursorOpacityAnimates: widget.cursorOpacityAnimates,
      obscureText: widget.obscureText,
      maxLines: widget.maxLines,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 10,
        ),
        prefixIcon: widget.prefixIcon,
        prefixIconColor:
            _focusNode.hasFocus
                ? AppColors.primary.value
                : AppColors.neutral.value,
        suffixIcon: widget.suffixIcon,
        suffixIconColor:
            _focusNode.hasFocus
                ? AppColors.primary.value
                : AppColors.neutral.value,
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(
            color:
                widget.error ? AppColors.error.value : AppColors.neutral.value,
            width: 3,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(
            color:
                widget.error ? AppColors.error.value : AppColors.neutral.value,
            width: 3,
          ),
        ),
        helperStyle: TextStyle(
          fontFamily: Fonts.dynaPuff.value,
          color: AppColors.neutral.value,
          fontSize: widget.helperSize,
          fontWeight: FontWeight.w400,
        ),
        helperText: widget.helperText,
        focusColor: AppColors.neutral.value,
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(
            color:
                widget.error == true
                    ? AppColors.error.value
                    : AppColors.neutral.value,
            width: 3,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: AppColors.error.value, width: 3),
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontFamily: Fonts.dynaPuff.value,
          color: AppColors.neutral.value,
          fontSize: widget.hintSize,
          fontWeight: FontWeight.w400,
        ),
      ),
      enabled: widget.enabled,
      inputFormatters: widget.inputFormatters,
      keyboardType: widget.keyboardType,
      readOnly: widget.readOnly,
      style: TextStyle(
        fontFamily: Fonts.dynaPuff.value,
        color: AppColors.neutral.value,
        fontSize: widget.textSize,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
