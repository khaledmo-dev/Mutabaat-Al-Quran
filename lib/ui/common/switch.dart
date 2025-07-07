import 'package:flutter/material.dart';
import 'package:quran_test/ui/common/app_colors.dart';

class CustomSwitch<T> extends StatefulWidget {
  const CustomSwitch(
      {super.key,
      required this.values,
      required this.lable,
      required this.changeValue,
      this.width});

  final List<T> values;
  final String Function(T) lable;
  final Function(T) changeValue;
  final double? width;
  @override
  State<CustomSwitch<T>> createState() => _CustomSwitchState<T>();
}

class _CustomSwitchState<T> extends State<CustomSwitch<T>> {
  late T? selectedValue = widget.values.firstOrNull;
  @override
  Widget build(BuildContext context) {
    if (widget.values.isEmpty) {
      return const SizedBox.shrink();
    }
    return Container(
      width: widget.width ?? double.infinity,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.grey[900]
            : const Color(0xffF1F1F1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                AnimatedPositionedDirectional(
                  duration: const Duration(milliseconds: 250),
                  start: (constraints.maxWidth / widget.values.length) *
                      (widget.values.indexOf(selectedValue as T)),
                  height: constraints.maxHeight,
                  child: Container(
                    width: constraints.maxWidth / widget.values.length,
                    decoration: BoxDecoration(
                      color: kcPrimaryColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: widget.values.map((e) {
                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          widget.changeValue(e);
                          setState(() {
                            selectedValue = e;
                          });
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Center(
                            child: Text(
                              widget.lable(e),
                              style: TextStyle(
                                color: selectedValue == e
                                    ? Colors.white
                                    : kcPrimaryColor,
                                fontWeight:
                                    selectedValue == e ? FontWeight.bold : null,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
