import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran_test/services/localization_service.dart';
import 'package:quran_test/surahs.dart';
import 'package:quran_test/ui/common/base_text_field.dart';
import 'package:quran_test/ui/common/search_select.dart';
import 'package:quran_test/ui/common/ui_helpers.dart';

class SegmentsSelector extends StatefulWidget {
  const SegmentsSelector(
    this.getValue, {
    super.key,
  });
  final Function(Map map) getValue;
  // final Function(Map map) add;
  @override
  State<SegmentsSelector> createState() => _SegmentsSelectorState();
}

class _SegmentsSelectorState extends State<SegmentsSelector> {
  int? firstSurahID;
  int? lastSurahID;

  final firstAyahController = TextEditingController();
  final lastAyahController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    firstAyahController.dispose();
    lastAyahController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SearchSelect<int>(
                items: surahMap.keys.toList(),
                hint: "from_surah".translate(),
                lable: (e) => surahMap[e]!['name'],
                selectElement: (e) {
                  if (context.mounted && e != null) {
                    setState(() {
                      firstSurahID = e;
                      lastSurahID = e;
                      firstAyahController.text = "1";
                      lastAyahController.text = surahMap[e]!['aya'].toString();
                    });
                  } else {
                    setState(() {
                      firstSurahID = null;
                      lastSurahID = null;
                      firstAyahController.text = "";
                      lastAyahController.text = "";
                    });
                  }
                },
                initialSelectedItem: firstSurahID,
                // suffixWidget: const Text(
                //   "من",
                //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                // ),
              ),
            ),
            horizontalSpaceSmall,
            BaseTextField(
              controller: firstAyahController,
              hint: '',
              width: 80,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CustomInputFormatter(
                  maxNumber: surahMap[firstSurahID]?['aya'] ?? 0,
                  onInputPrevented: () {},
                  onInputPassed: (value) {},
                ),
              ],
              nextFocus: true,
              textDirection: TextDirection.ltr,
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SearchSelect<int>(
                items: surahMap.keys.where((s) {
                  if (firstSurahID == null) {
                    return true;
                  }
                  return s >= firstSurahID!;
                }).toList(),
                hint: "to_surah".translate(),
                // items: surahMap.keys.toList(),
                lable: (e) => surahMap[e]!['name'],
                selectElement: (e) {
                  if (context.mounted && e != null) {
                    setState(() {
                      lastSurahID = e;
                      lastAyahController.text = surahMap[e]!['aya'].toString();
                    });
                  } else {
                    setState(() {
                      lastSurahID = null;
                      lastAyahController.text = '';
                    });
                  }
                },
                initialSelectedItem: lastSurahID,
                // suffixWidget: const Text(
                //   "إلى",
                //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                // ),
              ),
            ),
            horizontalSpaceSmall,
            BaseTextField(
              controller: lastAyahController,
              hint: '',
              width: 80,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CustomInputFormatter(
                  maxNumber: surahMap[lastSurahID]?['aya'] ?? 0,
                  onInputPrevented: () {},
                  onInputPassed: (value) {},
                ),
              ],
              textDirection: TextDirection.ltr,
            )
          ],
        ),
        TextButton(
          onPressed: () {
            widget.getValue({
              "first_surah": firstSurahID,
              "last_surah": lastSurahID,
              "first_ayah": int.tryParse(firstAyahController.text),
              "last_ayah": int.tryParse(lastAyahController.text),
            });
          },
          child: Text('add'.translate()),
        ),
      ],
    );
  }
}

class CustomInputFormatter extends TextInputFormatter {
  final int maxNumber;
  final int? minNumber;
  final VoidCallback onInputPrevented;
  final Function(String? value) onInputPassed;

  CustomInputFormatter({
    required this.maxNumber,
    this.minNumber,
    required this.onInputPrevented,
    required this.onInputPassed,
  });

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (oldValue.text.isEmpty && newValue.text == "0") {
      return oldValue;
    }

    if ((int.tryParse(newValue.text) ?? 0) > maxNumber) {
      onInputPrevented();
      return oldValue;
    }
    if (minNumber != null) {
      if ((int.tryParse(newValue.text) ?? 0) < minNumber!) {
        onInputPrevented();
        return oldValue;
      }
    }

    onInputPassed(newValue.text);
    return newValue;
  }
}
