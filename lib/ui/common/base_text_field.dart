import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran_test/ui/common/app_colors.dart';
import 'package:quran_test/ui/common/ui_helpers.dart';

class BaseTextField extends StatelessWidget {
  const BaseTextField(
      {super.key,
      required this.controller,
      this.keyboardType,
      required this.hint,
      this.icon,
      this.suffixIcon,
      this.validator,
      this.onTap,
      this.errorText,
      this.inputFormatters,
      this.readOnly = false,
      this.isPassword = false,
      this.filled = true,
      this.unfocusOnTapOutside = true,
      this.nextFocus = false,
      this.node,
      this.onChange,
      this.width,
      this.textDirection});

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String hint;
  final double? width;
  final IconData? icon;
  final Widget? suffixIcon;
  final Function? validator;
  final Function? onTap;
  final Function(String text)? onChange;
  final FocusNode? node;
  final String? errorText;
  final List<TextInputFormatter>? inputFormatters;
  final TextDirection? textDirection;
  final bool nextFocus;
  final bool readOnly;
  final bool isPassword;
  final bool filled;
  final bool unfocusOnTapOutside;
  @override
  Widget build(BuildContext context) {
    Theme.of(context).brightness;
    var responsiveSize = 24 * (screenWidth(context) / 4) / 100;
    var theme = Theme.of(context);
    final circularBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    );

    return SizedBox(
      width: width,
      child: TapRegion(
        onTapOutside: node != null && unfocusOnTapOutside
            ? (event) => node!.unfocus()
            : null,
        child: TextFormField(
          forceErrorText: errorText,
          textDirection: textDirection ?? Directionality.of(context),
          controller: controller,
          textInputAction: nextFocus ? TextInputAction.next : null,
          onChanged: onChange,
          focusNode: node,
          keyboardType: keyboardType,
          readOnly: readOnly,
          inputFormatters: inputFormatters,
          textAlign: TextAlign.center,
          onTap: () {
            if (onTap != null) {
              onTap!();
            }
          },
          obscureText: isPassword,
          validator: (value) {
            if (validator != null) {
              return validator!(value);
            }
            return null;
          },
          style: theme.textTheme.bodySmall!.copyWith(
              fontSize: theme.textTheme.bodySmall!.fontSize! *
                  (screenWidth(context) / 3.5) /
                  100),
          cursorColor: kcPrimaryColor,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(20),
            // isDense: true,
            // labelText: hint,
            hintText: hint,
            // hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
            //     fontSize: theme.textTheme.titleMedium!.fontSize! *
            //         (screenWidth(context) / 3.5) /
            //         100),
            // labelStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
            //     fontSize: theme.textTheme.titleMedium!.fontSize! *
            //         (screenWidth(context) / 3.5) /
            //         100),
            suffixIcon: suffixIcon,
            prefixIcon: icon == null
                ? null
                : Icon(
                    icon!,
                    size: responsiveSize,
                    color: kcPrimaryColor,
                  ),
            filled: filled,
            fillColor: kcVeryLightGrey,
            border: circularBorder.copyWith(
              borderSide: const BorderSide(color: kcLightGrey),
            ),
            errorBorder: circularBorder.copyWith(
              borderSide: const BorderSide(color: Colors.red),
            ),
            focusedBorder: circularBorder.copyWith(
              borderSide: const BorderSide(color: kcPrimaryColor),
            ),
            enabledBorder: circularBorder.copyWith(
              borderSide: const BorderSide(color: kcVeryLightGrey),
            ),
          ),
        ),
      ),
    );
  }
}
