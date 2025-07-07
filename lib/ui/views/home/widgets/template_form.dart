import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:quran_test/app/app.locator.dart';
import 'package:quran_test/services/localization_service.dart';
import 'package:quran_test/services/template_service.dart';
import 'package:quran_test/surahs.dart';
import 'package:quran_test/ui/common/base_button.dart';
import 'package:quran_test/ui/common/base_text_field.dart';
import 'package:quran_test/ui/common/ui_helpers.dart';
import 'package:collection/collection.dart';
import 'package:quran_test/ui/widgets/common/segments_selector/segments_selector.dart';

class TemplateForm extends StatefulWidget {
  const TemplateForm({super.key});

  @override
  State<TemplateForm> createState() => _TemplateFormState();
}

class _TemplateFormState extends State<TemplateForm> {
  final Set<Map> records = {};
  String name = '';
  String message = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (message.isNotEmpty) WarningBanner(message: message),
              verticalSpaceSmall,
              BaseTextField(
                controller: null,
                hint: 'name'.translate(),
                onChange: (text) {
                  name = text;
                },
              ),
              verticalSpaceSmall,
              SegmentsSelector(
                (map) {
                  if (!map.values.any((value) => (value == null))) {
                    setState(() {
                      records.add(map);
                    });
                  }
                },
              ),
              ...records.mapIndexed(
                (index, e) {
                  var firstSurah = surahMap[e['first_surah']]!['name'];
                  var firstAyah = e['first_ayah'];

                  var lastSurah = surahMap[e['last_surah']]!['name'];
                  var lastAyah = e['last_ayah'];

                  return Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Text("$firstSurah $firstAyah"),
                            const Text(" - "),
                            Text("$lastSurah $lastAyah"),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            records.remove(e);
                          });
                        },
                        icon: const Icon(Icons.delete),
                      )
                    ],
                  );
                },
              ),
              verticalSpaceSmall,
              BaseButton(
                title: 'confirm'.translate(),
                callback: () {
                  message = '';
                  if (records.isEmpty) {
                    message = "click_add_surahs".translate();
                  }
                  if (name.isEmpty) {
                    if (message.isNotEmpty) {
                      message += " - ";
                    }
                    message += "fill_name_field".translate();
                  }

                  setState(() {});
                  if (records.isNotEmpty && name.isNotEmpty) {
                    locator<TemplateService>()
                        .insertTemplate(name, records.toList());
                    Navigator.pop(context);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class WarningBanner extends StatelessWidget {
  final String message;

  const WarningBanner({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.amber.withValues(alpha: 0.2),
        // borderRadius: BorderRadius.circular(8),
        border: const BorderDirectional(
          start: BorderSide(
            color: Colors.amber, // Solid amber left border
            width: 5,
          ),
        ),
      ),
      child: Row(
        children: [
          const Icon(IconlyBold.info_square, color: Colors.amber),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
