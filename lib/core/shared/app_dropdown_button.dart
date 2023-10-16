// ignore_for_file: must_be_immutable

import '../_core_exports.dart';

class AppDropdownButton<T> extends StatefulWidget {
  final double? width;
  final double? height;

  // Object value;

  final T? value;
  void Function(dynamic)? onChanged;
  final List<DropdownMenuItem<T>>? items;

  AppDropdownButton({super.key, this.width, this.height, this.items, this.onChanged, this.value});

  @override
  State<AppDropdownButton> createState() => _AppDropdownButtonState();
}

class _AppDropdownButtonState extends State<AppDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        filled: true,
        fillColor: AppColors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 2,
            color: AppColors.mainPrimary,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 1,
            color: AppColors.mainPrimary,
          ),
        ),
      ),
      icon: Transform.rotate(
        angle: 300,
        child: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: AppColors.mainPrimary,
          size: 20,
        ),
      ),
      value: widget.value,
      hint: AppText(
        "Seçiniz",
        style: AppTextStyles.h3Medium.getTextStyle.copyWith(color: AppColors.grey),
      ), //Seçiniz

      isDense: true,
      isExpanded: true,
      //items liste alıyor
      items: widget.items,

      onChanged: widget.onChanged,
    );
  }
}
