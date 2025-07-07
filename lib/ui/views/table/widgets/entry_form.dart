import 'package:flutter/material.dart';
import 'package:quran_test/app/app.locator.dart';
import 'package:quran_test/services/localization_service.dart';
import 'package:quran_test/services/table_service.dart';
import 'package:quran_test/surahs.dart';
import 'package:quran_test/ui/common/base_button.dart';
import 'package:quran_test/ui/common/ui_helpers.dart';
import 'package:quran_test/ui/views/home/widgets/template_form.dart';
import 'package:quran_test/ui/widgets/common/segments_selector/segments_selector.dart';
import 'package:collection/collection.dart';

class EntryForm extends StatefulWidget {
  const EntryForm(this.date,
      {super.key, required this.activityId, required this.records});
  final DateTime date;
  final int activityId;
  final List<Map> records;

  @override
  State<EntryForm> createState() => _EntryFormState();
}

class _EntryFormState extends State<EntryForm> {
  final Set<Map> records = {};
  String message = '';

  @override
  void initState() {
    records.addAll(widget.records);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (message.isNotEmpty) WarningBanner(message: message),
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
                if (records.isEmpty && widget.records.isEmpty) {
                  message = "click_add_surahs".translate();
                  setState(() {});
                  return;
                }
                locator<TableService>().insertEntries(
                  entries: records.toList(),
                  date: widget.date,
                  activityId: widget.activityId,
                );
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
