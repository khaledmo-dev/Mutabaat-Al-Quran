import 'package:flutter/material.dart';
import 'package:quran_test/ui/common/app_colors.dart';
import 'package:quran_test/ui/common/base_text_field.dart';
import 'package:quran_test/ui/common/ui_helpers.dart';

class SearchSelect<T> extends StatefulWidget {
  const SearchSelect({
    super.key,
    required this.items,
    required this.lable,
    required this.selectElement,
    required this.initialSelectedItem,
    this.onChanged,
    this.suffixWidget,
    this.hint,
  })  : controller = null,
        initialSelectedItems = null,
        isMulti = false;

  const SearchSelect.multi({
    super.key,
    required this.items,
    required this.lable,
    this.hint,
    required this.controller,
    this.suffixWidget,
    this.onChanged,
    this.initialSelectedItems,
  })  : isMulti = true,
        selectElement = null,
        initialSelectedItem = null;

  final List<T> items;
  final List<T>? initialSelectedItems;
  final T? initialSelectedItem;

  final String Function(T) lable;
  final Function(T?)? selectElement;
  final Function? onChanged;
  final String? hint;
  final MultiSelectController<T>? controller;
  final bool isMulti;
  final Widget? suffixWidget;
  @override
  State<SearchSelect<T>> createState() => _SearchSelectState<T>();
}

class _SearchSelectState<T> extends State<SearchSelect<T>> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  List<T> items = [];

  List<T> selectedItems = [];

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {});
    });
    if (!widget.isMulti) {
      _focusNode.addListener(
        () {
          if (!_focusNode.hasFocus && selectedItems.isEmpty) {
            _controller.text = '';
          }
        },
      );
    }

    if (widget.controller != null) {
      widget.controller!.setGetPickedItemsCallback(() => selectedItems);
    }
    if (widget.initialSelectedItems != null) {
      selectedItems.addAll(widget.initialSelectedItems!);
    }
    if (widget.initialSelectedItem != null) {
      // widget.selectElement!(widget.initialSelectedItem);
      selectedItems.add(widget.initialSelectedItem as T);
      _controller.text = widget.lable(widget.initialSelectedItem as T);
    }
    items = widget.items;
  }

  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    if (!widget.isMulti) {
      if (mounted) {
        if (selectedItems.isNotEmpty && widget.initialSelectedItem == null) {
          setState(() {
            selectedItems.clear();
            _controller.text = "";
          });
        } else if (widget.initialSelectedItem != null) {
          setState(() {
            selectedItems.clear();
            selectedItems.add(widget.initialSelectedItem as T);
            _controller.text = widget.lable(widget.initialSelectedItem as T);
          });
        }
      }

      List<T> reorderedItems = [
        ...widget.items.where(
          (item) => normalizeArabic(widget.lable(item))
              .contains(normalizeArabic(_controller.text)),
        ),
        ...widget.items.where(
          (item) => !normalizeArabic(widget.lable(item))
              .contains(normalizeArabic(_controller.text)),
        ),
      ];

      if (selectedItems.firstOrNull != null) {
        int index = reorderedItems.indexOf(selectedItems.first);
        reorderedItems.moveToFirst(index);
      }

      return TapRegion(
        onTapOutside: (event) {
          setState(() => isOpen = false);
          _focusNode.unfocus();
        },
        child: Column(
          children: [
            Row(
              children: [
                if (widget.suffixWidget != null) ...[
                  widget.suffixWidget!,
                  horizontalSpaceSmall
                ],
                Expanded(
                  child: BaseTextField(
                    unfocusOnTapOutside: false,
                    onChange: (text) {
                      if (selectedItems.firstOrNull != null) {
                        setState(() {
                          selectedItems.clear();
                          widget.selectElement!(null);
                        });
                      }
                      if (items.any((element) =>
                          normalizeArabic(widget.lable(element)) ==
                          normalizeArabic(_controller.text))) {
                        T item = items.firstWhere((element) =>
                            normalizeArabic(widget.lable(element)) ==
                            normalizeArabic(_controller.text));
                        widget.selectElement!(item);
                        selectedItems.add(item);
                      }
                    },
                    controller: _controller,
                    node: _focusNode,
                    onTap: () => setState(() => isOpen = true),
                    hint: widget.hint ?? 'Pick element',
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() => isOpen = !isOpen);
                        if (isOpen == true) {
                          _focusNode.requestFocus();
                        } else {
                          _focusNode.unfocus();
                        }
                      },
                      icon: Icon(
                        !isOpen ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                        color: isOpen ? kcPrimaryColor : Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              color: Colors.transparent,
              height: 12,
            ),
            if (isOpen)
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: kcVeryLightGrey,
                ),
                child: items.isEmpty
                    ? const Center(child: Text('No Items Available'))
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: ListView(
                          children: reorderedItems
                              .map(
                                (e) => GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedItems.clear();
                                      selectedItems.add(e);
                                      widget.selectElement!(e);

                                      isOpen = false;
                                    });

                                    _controller.text = widget.lable(e);
                                    _focusNode.unfocus();
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color:
                                          selectedItems.elementAtOrNull(0) == e
                                              ? kcPrimaryColor
                                              : Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    width: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(
                                        widget.lable(e),
                                        style: TextStyle(
                                          color: selectedItems
                                                      .elementAtOrNull(0) ==
                                                  e
                                              ? Colors.white
                                              : null,
                                          fontWeight: selectedItems
                                                      .elementAtOrNull(0) ==
                                                  e
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
              )
          ],
        ),
      );
    }

    List<T> selectableItems = items.whereNotIn(selectedItems).toList();
    selectableItems = selectableItems
        .where((element) => normalizeArabic(widget.lable(element))
            .contains(normalizeArabic(_controller.text)))
        .toList();
    return TapRegion(
      onTapOutside: (event) {
        setState(() => isOpen = false);
        _focusNode.unfocus();
      },
      child: Column(
        children: [
          IntrinsicHeight(
            child: Row(
              children: [
                if (widget.suffixWidget != null) ...[
                  widget.suffixWidget!,
                  horizontalSpaceSmall
                ],
                Expanded(
                  child: BaseTextField(
                    controller: _controller,
                    node: _focusNode,
                    unfocusOnTapOutside: false,
                    onTap: () => setState(() => isOpen = true),
                    hint: widget.hint ?? 'Pick elements',
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() => isOpen = !isOpen);
                        if (isOpen == true) {
                          _focusNode.requestFocus();
                        } else {
                          _focusNode.unfocus();
                        }
                      },
                      icon: Icon(
                        !isOpen ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                        color: isOpen ? kcPrimaryColor : Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.transparent,
            height: 12,
          ),
          Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              SizedBox(
                width: double.infinity,
                child: Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: selectedItems
                      .map(
                        (e) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedItems.remove(e);
                            });
                            if (widget.onChanged != null) {
                              widget.onChanged!();
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: const Border(
                                top:
                                    BorderSide(width: 1, color: kcPrimaryColor),
                                right:
                                    BorderSide(width: 1, color: kcPrimaryColor),
                                bottom:
                                    BorderSide(width: 2, color: kcPrimaryColor),
                                left:
                                    BorderSide(width: 1, color: kcPrimaryColor),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    widget.lable(e),
                                    style: const TextStyle(
                                      color: kcPrimaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  horizontalSpaceTiny,
                                  const Icon(
                                    Icons.close,
                                    color: Colors.red,
                                    size: 16,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              if (isOpen)
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: kcVeryLightGrey,
                  ),
                  child: selectableItems.isEmpty
                      ? const Center(child: Text('No Items Available'))
                      : ListView(
                          children: selectableItems
                              .map(
                                (e) => GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedItems.add(e);
                                    });
                                    _controller.clear();
                                    if (items.length == selectedItems.length) {
                                      setState(() {
                                        isOpen = false;
                                      });
                                      _focusNode.unfocus();
                                    }
                                    if (widget.onChanged != null) {
                                      widget.onChanged!();
                                    }
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    width: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(widget.lable(e)),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                ),
            ],
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    if (widget.controller != null) {
      widget.controller!.setGetPickedItemsCallback(null);
    }
    super.dispose();
  }
}

class MultiSelectController<T> {
  List<T> Function()? getSelectedItemsCallback;

  List<T> getSelectedItems() {
    return getSelectedItemsCallback?.call() ?? [];
  }

  clearItems() {
    getSelectedItemsCallback?.call().clear();
  }

  addAll(List<T> list) {
    getSelectedItemsCallback?.call().addAll(list);
  }

  void setGetPickedItemsCallback(List<T> Function()? callback) {
    getSelectedItemsCallback = callback;
  }
}

extension WhereNotInExt<T> on Iterable<T> {
  Iterable<T> whereNotIn(Iterable<T> reject) {
    final rejectSet = reject.toSet();
    return where((el) => !rejectSet.contains(el));
  }
}

extension MoveElement<T> on List<T> {
  void moveToFirst(int from) {
    if (from <= 0) {
      return;
    }
    RangeError.checkValidIndex(from, this, "from", length);
    var element = this[from];
    if (from < 0) {
      setRange(from, 0, this, from + 1);
    } else {
      setRange(0 + 1, from + 1, this, 0);
    }
    this[0] = element;
  }
}

String normalizeArabic(String input) {
  // Define the regex for Harakat (diacritical marks)
  final harakatRegex = RegExp(r'[\u064B-\u0652]');

  const arabicToEnglishMap = {
    '٠': '0',
    '١': '1',
    '٢': '2',
    '٣': '3',
    '٤': '4',
    '٥': '5',
    '٦': '6',
    '٧': '7',
    '٨': '8',
    '٩': '9',
  };

  // Replace Harakat with an empty string
  String normalized = input.replaceAll(harakatRegex, '');

  // Replace specific Arabic characters
  normalized = normalized
      .replaceAll('ي', 'ى')
      .replaceAll('ة', 'ه')
      .replaceAll('ؤ', 'و')
      .replaceAll(RegExp(r'[أإآ]'), 'ا');

  arabicToEnglishMap.forEach((arabic, english) {
    normalized = normalized.replaceAll(arabic, english);
  });

  return normalized;
}

String convertArabicNumbersToEnglish(String input) {
  const arabicToEnglishDigits = {
    '٠': '0', // Arabic 0 to English 0
    '١': '1', // Arabic 1 to English 1
    '٢': '2', // Arabic 2 to English 2
    '٣': '3', // Arabic 3 to English 3
    '٤': '4', // Arabic 4 to English 4
    '٥': '5', // Arabic 5 to English 5
    '٦': '6', // Arabic 6 to English 6
    '٧': '7', // Arabic 7 to English 7
    '٨': '8', // Arabic 8 to English 8
    '٩': '9', // Arabic 9 to English 9
  };

  // Replace Arabic digits with English digits
  arabicToEnglishDigits.forEach((arabicDigit, englishDigit) {
    input = input.replaceAll(arabicDigit, englishDigit);
  });

  return input;
}
