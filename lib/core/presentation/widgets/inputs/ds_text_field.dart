import 'package:flutter/material.dart';
import 'package:wize_cards/core/utils/color_constants.dart';
import 'package:wize_cards/core/utils/constant.dart';

/// A custom text field widget following the Design System standards.
///
/// This widget supports titles with icons, custom background colors based on focus,
/// and provides named constructors for different use cases like multiline input.
class DSTextField extends StatefulWidget {
  /// Creates a standard [DSTextField].
  const DSTextField({
    super.key,
    this.controller,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.keyboardType = TextInputType.text,
    this.hintText,
    this.title,
    this.iconTitle,
    this.textStyle,
  }) : maxLines = 1;

  /// Creates a multiline [DSTextField].
  const DSTextField.multiline({
    super.key,
    this.controller,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.hintText,
    this.title,
    this.iconTitle,
    this.textStyle,
    this.maxLines = 4,
  }) : keyboardType = TextInputType.multiline;

  /// Controls the text being edited.
  final TextEditingController? controller;

  /// Called when the text changes.
  final ValueChanged<String>? onChanged;

  /// Called when editing is complete.
  final VoidCallback? onEditingComplete;

  /// Called when the user submits the field.
  final ValueChanged<String>? onFieldSubmitted;

  /// The type of keyboard to display.
  final TextInputType keyboardType;

  /// The maximum number of lines. Null for multiline.
  final int? maxLines;

  /// Hint text displayed when the field is empty.
  final String? hintText;

  /// Optional title label displayed above the field.
  final String? title;

  /// Optional icon displayed to the left of the title label.
  final IconData? iconTitle;

  /// Custom text style for the title label.
  final TextStyle? textStyle;

  @override
  State<DSTextField> createState() => _DSTextFieldState();
}

class _DSTextFieldState extends State<DSTextField> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Colors from requirements: primaryWhite for focus, #F6F6F8 for unfocus.
    final backgroundColor = _isFocused
        ? ColorConstants.primaryWhite
        : const Color(0xFFF6F6F8);

    return Column(
      spacing: SpacingConstants.small,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.title != null)
          Row(
            spacing: SpacingConstants.small,
            children: [
              if (widget.iconTitle != null)
                Icon(
                  widget.iconTitle,
                  size: IconSizeConstants.x18,
                  color: ColorConstants.primaryBlue,
                ),
              Text(
                widget.title!,
                style:
                    widget.textStyle ??
                    Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: ColorConstants.textPrimary,
                    ),
              ),
            ],
          ),
        TextField(
          controller: widget.controller,
          focusNode: _focusNode,
          onChanged: widget.onChanged,
          onEditingComplete: widget.onEditingComplete,
          onSubmitted: widget.onFieldSubmitted,
          keyboardType: widget.keyboardType,
          maxLines: widget.maxLines,
          style: const TextStyle(color: ColorConstants.textPrimary),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: ColorConstants.textSecondary),
            filled: true,
            fillColor: backgroundColor,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: SpacingConstants.medium,
              vertical: SpacingConstants.twelve,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(BorderRadiusConstants.medium),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(BorderRadiusConstants.medium),
              borderSide: const BorderSide(
                color: ColorConstants.borderLightGray,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(BorderRadiusConstants.medium),
              borderSide: const BorderSide(
                color: ColorConstants.primaryBlue,
                width: ThicknessConstans.sm,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
