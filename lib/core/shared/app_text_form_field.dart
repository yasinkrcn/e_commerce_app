// ignore_for_file: unused_element, must_be_immutable

import 'package:e_commerce_app/core/_core_exports.dart';

class AppTextFormField extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final bool? isBorder;
  final Color? enabledBorderColor;
  final bool autoFocus;
  final bool enabled;
  final int? maxLines;
  final double? width;
  final double? borderRadius;
  bool isObscure;
  final double? height;
  final Widget? prefixIcon;
  Widget? suffixIcon;
  final void Function()? onTap;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextAlignVertical? textAlignVertical;
  final TextInputType? keyboardType;
  final Color? fillColor;
  final Function(String)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;

  AppTextFormField._({
    Key? key,
    this.labelText,
    this.hintText,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    this.width,
    this.onChanged,
    this.validator,
    this.maxLines,
    this.height,
    this.isBorder = true,
    this.enabled = true,
    this.autoFocus = false,
    this.isObscure = false,
    this.textAlignVertical,
    this.keyboardType = TextInputType.text,
    this.fillColor,
    this.onFieldSubmitted,
    this.inputFormatters,
    this.enabledBorderColor,
    this.borderRadius,
  }) : super(key: key);

  factory AppTextFormField.standart({
    double? width,
    double? height,
    final double? borderRadius,
    String? hintText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    String? labelText,
    bool enabled = true,
    bool? isBorder = true,
    bool autoFocus = false,
    void Function(String)? onChanged,
    TextEditingController? controller,
    String? Function(String?)? validator,
    TextAlignVertical? textAlignVertical,
    TextInputType? keyboardType,
    Color? fillColor,
    final Function(String)? onFieldSubmitted,
    final List<TextInputFormatter>? inputFormatters,
    Color? enabledBorderColor,
  }) {
    return AppTextFormField._(
      width: width,
      height: 56.h,
      borderRadius: borderRadius,
      enabled: enabled,
      hintText: hintText,
      isBorder: isBorder,
      onChanged: onChanged,
      validator: validator,
      controller: controller,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      autoFocus: autoFocus,
      labelText: labelText,
      textAlignVertical: TextAlignVertical.center,
      keyboardType: keyboardType,
      fillColor: fillColor,
      onFieldSubmitted: onFieldSubmitted,
      inputFormatters: inputFormatters,
      enabledBorderColor: enabledBorderColor,
    );
  }

  factory AppTextFormField.obscure({
    double? width,
    double? height,
    String? hintText,
    Widget? prefixIcon,
    bool? isBorder = true,
    String? labelText,
    void Function(String)? onChanged,
    TextEditingController? controller,
    String? Function(String?)? validator,
    TextAlignVertical? textAlignVertical,
    TextInputType? keyboardType,
  }) {
    return AppTextFormField._(
      width: width,
      isObscure: true,
      isBorder: isBorder,
      hintText: hintText,
      onChanged: onChanged,
      labelText: labelText,
      validator: validator,
      controller: controller,
      prefixIcon: prefixIcon,
      textAlignVertical: TextAlignVertical.center,
      keyboardType: keyboardType,
    );
  }

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool isObscure = false;

  @override
  void initState() {
    super.initState();
    isObscure = widget.isObscure;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height,
      constraints: const BoxConstraints(minHeight: 16, maxHeight: 200),
      child: TextFormField(
        onChanged: widget.onChanged,
        validator: widget.validator,
        controller: widget.controller,
        obscureText: isObscure,
        autofocus: widget.autoFocus,
        enabled: widget.enabled,
        keyboardType: widget.keyboardType,
        enableInteractiveSelection: true,
        textAlignVertical: widget.textAlignVertical,
        cursorColor: AppColors.black,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          fillColor: widget.fillColor ?? AppColors.white,
          filled: true,
          hintText: widget.hintText,
          labelText: widget.labelText,
          labelStyle: AppTextStyles.h3Medium.getTextStyle,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.isObscure ? getObscureSuffixIcon() : widget.suffixIcon,
          prefixIconColor: AppColors.black,
          suffixIconColor: AppColors.black,
          focusColor: AppColors.black,
          hoverColor: AppColors.black,
          hintStyle: AppTextStyles.h3Medium.getTextStyle.copyWith(color: AppColors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.0),
            borderSide: BorderSide(color: AppColors.mainPrimary, width: widget.isBorder! ? 1 : 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.0),
            borderSide: BorderSide(color: AppColors.mainPrimary, width: widget.isBorder! ? 2 : 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.0),
            borderSide:
                BorderSide(color: widget.enabledBorderColor ?? Colors.transparent, width: widget.isBorder! ? 1 : 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius ?? 12.0)),
            borderSide: BorderSide(color: AppColors.redErrorDark, width: widget.isBorder! ? 1 : 2),
          ),
        ),
        inputFormatters: widget.inputFormatters,
        textInputAction: TextInputAction.next,
        maxLines: widget.maxLines ?? 3,
        minLines: 1,
        onFieldSubmitted: widget.onFieldSubmitted,
      ),
    );
  }

  Widget getObscureSuffixIcon() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isObscure = !isObscure;
        });
      },
      child: Icon(isObscure ? Icons.visibility_off_outlined : Icons.visibility_outlined),
    );
  }
}
