import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatefulWidget {
  final double? height;
  final double? width;
  final BoxDecoration? decoration;
  final TextEditingController? controller;
  final String? initialValue;
  final FocusNode? focusNode;
  final InputDecoration? inputDecoration;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final TextAlign? textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool? autofocus;
  final bool? readOnly;
  final bool? showCursor;
  final String? obscuringCharacter;
  final bool? obscureText;
  final bool? autocorrect;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool? enableSuggestions;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final int? minLines;
  final bool? expands;
  final int? maxLength;
  final IconData? prefixIcon;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final double? cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final Brightness? keyboardAppearance;
  final EdgeInsets? scrollPadding;
  final bool? enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final InputCounterWidgetBuilder? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final Iterable<String>? autofillHints;
  final AutovalidateMode? autoValidateMode;
  final ScrollController? scrollController;
  final String? restorationId;
  final bool? enableIMEPersonalizedLearning;
  final MouseCursor? mouseCursor;
  final bool makePasswordField;
  final String? prefixWidget;
  final Widget? suffixWidget;
  final String? semanticlabel;
  final String? hintText;
  final EdgeInsetsGeometry? paddings;
  final TextStyle? hintStyle;
  const CustomText(
      {Key? key,
      this.height,
      this.width,
      this.decoration,
      this.controller,
      this.prefixIcon,
      required this.semanticlabel,
      this.initialValue,
      this.makePasswordField = false,
      this.focusNode,
      this.inputDecoration,
      this.keyboardType,
      this.textCapitalization,
      this.textInputAction,
      this.style,
      this.strutStyle,
      this.textDirection,
      this.textAlign,
      this.textAlignVertical,
      this.autofocus,
      this.readOnly,
      this.showCursor,
      this.obscuringCharacter,
      this.obscureText,
      this.autocorrect,
      this.smartDashesType,
      this.smartQuotesType,
      this.enableSuggestions,
      this.maxLengthEnforcement,
      this.minLines,
      this.expands,
      this.maxLength,
      this.onChanged,
      this.onTap,
      this.onEditingComplete,
      this.onFieldSubmitted,
      this.onSaved,
      this.validator,
      this.inputFormatters,
      this.enabled,
      this.cursorWidth,
      this.cursorHeight,
      this.cursorRadius,
      this.cursorColor,
      this.keyboardAppearance,
      this.scrollPadding,
      this.enableInteractiveSelection,
      this.selectionControls,
      this.buildCounter,
      this.scrollPhysics,
      this.autofillHints,
      this.autoValidateMode,
      this.scrollController,
      this.restorationId,
      this.enableIMEPersonalizedLearning,
      this.mouseCursor,
      this.prefixWidget,
      this.suffixWidget,
      this.hintText,
      this.paddings,
      this.hintStyle})
      : super(key: key);

  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  bool enableObscure = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          height: widget.height ?? 42.h,
          width: widget.width ?? double.maxFinite,
          decoration: widget.decoration ??
              BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
              ),
        ),
        TextFormField(
          controller: widget.controller,
          initialValue: widget.initialValue,
          focusNode: widget.focusNode,
          // cursorOpacityAnimates: true,
          decoration: widget.inputDecoration ??
              InputDecoration(
                  prefixIcon: widget.prefixIcon != null
                      ? Icon(
                          widget.prefixIcon,
                          size: 20.sp,
                          color: Colors.grey.shade600,
                        )
                      : null,
                  semanticCounterText: widget.semanticlabel,
                  suffixIcon: widget.makePasswordField
                      ? Padding(
                          padding: EdgeInsets.only(right: 8.w),
                          child: IconButton(
                            highlightColor: Colors.white,
                            splashColor: Colors.white,
                            icon: Icon(
                              enableObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              size: 20.r,
                              color: enableObscure
                                  ? Colors.grey.shade700
                                  : Colors.grey.shade700,
                            ),
                            onPressed: () => setState(() {
                              enableObscure = !enableObscure;
                            }),
                          ),
                        )
                      : null,
                  border: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 207, 207, 207))),
                  errorBorder: InputBorder.none,
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  focusedErrorBorder: InputBorder.none,
                  hintText: widget.hintText,
                  hintStyle: widget.hintStyle,
                  isDense: true,
                  contentPadding: widget.paddings ??
                      EdgeInsets.only(left: 10.w, top: 18.h)),
          keyboardType: widget.keyboardType,
          textCapitalization:
              widget.textCapitalization ?? TextCapitalization.none,
          textInputAction: widget.textInputAction,
          style: widget.style,
          strutStyle: widget.strutStyle,
          textDirection: widget.textDirection,
          textAlign: widget.textAlign ?? TextAlign.start,
          textAlignVertical: widget.textAlignVertical,
          autofocus: widget.autofocus ?? false,
          readOnly: widget.readOnly ?? false,
          showCursor: widget.showCursor,
          obscuringCharacter: widget.obscuringCharacter ?? '•',
          obscureText: widget.makePasswordField ? enableObscure : false,
          autocorrect: widget.autocorrect ?? true,
          smartDashesType: widget.smartDashesType,
          smartQuotesType: widget.smartQuotesType,
          enableSuggestions: widget.enableSuggestions ?? true,
          maxLengthEnforcement: widget.maxLengthEnforcement,
          minLines: widget.minLines,
          expands: widget.expands ?? false,
          maxLength: widget.maxLength,
          onChanged: widget.onChanged,
          onTap: widget.onTap,
          onEditingComplete: widget.onEditingComplete,
          onFieldSubmitted: widget.onFieldSubmitted,
          onSaved: widget.onSaved,
          validator: widget.validator,
          inputFormatters: widget.inputFormatters,
          enabled: widget.enabled,
          cursorWidth: widget.cursorWidth ?? 2.0,
          cursorHeight: widget.cursorHeight,
          cursorRadius: widget.cursorRadius,
          cursorColor: widget.cursorColor,
          keyboardAppearance: widget.keyboardAppearance,
          scrollPadding: widget.scrollPadding ?? const EdgeInsets.all(20.0),
          enableInteractiveSelection: widget.enableInteractiveSelection,
          selectionControls: widget.selectionControls,
          buildCounter: widget.buildCounter,
          scrollPhysics: widget.scrollPhysics,
          autofillHints: widget.autofillHints,
          scrollController: widget.scrollController,
          restorationId: widget.restorationId,
          enableIMEPersonalizedLearning:
              widget.enableIMEPersonalizedLearning ?? true,
          mouseCursor: widget.mouseCursor,
        ),
      ],
    );
  }
}
