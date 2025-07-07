import 'package:flutter/material.dart';
import 'package:quran_test/ui/common/app_colors.dart';
import 'package:quran_test/ui/common/ui_helpers.dart';

enum ButtonType { normal, danger }

class BaseButton extends StatelessWidget {
  const BaseButton({
    super.key,
    this.icon,
    this.iconColor,
    required this.title,
    required this.callback,
    this.isLoading = false,
    this.width,
    this.color,
    this.type,
    this.gradient,
    this.isFilled = true,
    this.height,
  });

  final IconData? icon;
  final Color? iconColor;
  final String title;
  final Function callback;
  final bool isLoading;
  final Color? color;
  final double? width;
  final ButtonType? type;
  final Gradient? gradient;
  final bool isFilled;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return type == ButtonType.danger
        ? MaterialButton(
            minWidth: width,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: EdgeInsets.zero,
            onPressed: () {
              if (!isLoading) {
                callback();
              }
            },
            child: Ink(
              width: width,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffD3180C)),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                constraints: BoxConstraints(
                  minWidth: width ?? double.infinity,
                  minHeight: height ?? 56.0,
                ), // min sizes for Material buttons
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Color(0xffD3180C),
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : MaterialButton(
            minWidth: width,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.zero,
            onPressed: () {
              if (!isLoading) {
                callback();
              }
            },
            child: Ink(
              width: width,
              decoration: BoxDecoration(
                color: isLoading ? Colors.grey[800] : color,
                gradient: !isFilled
                    ? null
                    : isLoading || color != null
                        ? null
                        : gradient ??
                            LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              stops: const [0.0, 1],
                              colors: [
                                kcPrimaryColor,
                                kcPrimaryColor.withValues(alpha: 0.9)
                              ],
                            ),
                border: isFilled ? null : Border.all(color: kcPrimaryColor),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                constraints: BoxConstraints(
                  minWidth: width ?? double.infinity,
                  minHeight: height ?? 56,
                ), // min sizes for Material buttons
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            color: !isFilled ? kcPrimaryColor : Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (title != '' && icon != null) horizontalSpaceTiny,
                        if (title != '' && icon != null)
                          Icon(
                            icon,
                            color: !isFilled ? kcPrimaryColor : Colors.white,
                          )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
