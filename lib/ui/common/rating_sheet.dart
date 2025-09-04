import 'package:flutter/material.dart';
import 'package:quran_test/app/app.locator.dart';
import 'package:quran_test/data/database.dart';
import 'package:quran_test/services/local_storage_service.dart';
import 'package:quran_test/services/localization_service.dart';
import 'package:quran_test/ui/common/base_button.dart';
import 'package:quran_test/ui/common/ui_helpers.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_launcher/url_launcher.dart';

showRateSheet() async {
  var context = StackedService.navigatorKey!.currentContext!;
  var count = await locator<Database>().managers.entries.count();
  final storageService = locator<LocalStorageService>();

  bool isInDate = storageService.rateDate == null
      ? true
      : (DateTime.parse(storageService.rateDate!).isBefore(DateTime.now()));

  bool hasRated = storageService.hasRated;

  if (context.mounted && count > 2 && isInDate && !hasRated) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Color(0xFFFFD700), Color(0xFFFFD700)],
                  ).createShader(bounds),
                  blendMode: BlendMode.srcIn,
                  child: Image.asset("assets/rating.png", height: 60),
                ),
                verticalSpaceMedium,
                Text("rate_message".translate()),
                verticalSpaceMedium,
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: BaseButton(
                        title: "rate_now".translate(),
                        callback: () async {
                          String packageName =
                              "com.mutabaat.quran"; // replace with your app id

                          final Uri webUri = Uri.parse(
                              "https://play.google.com/store/apps/details?id=$packageName"); // fallback web
                          Navigator.pop(context);
                          await launchUrl(webUri,
                              mode: LaunchMode.externalApplication);

                          storageService.hasRated = true;
                        },
                      ),
                    ),
                    horizontalSpaceSmall,
                    Expanded(
                      flex: 1,
                      child: BaseButton(
                        title: "later".translate(),
                        isFilled: false,
                        callback: () {
                          storageService.rateDate = DateTime.now()
                              .add(const Duration(days: 1))
                              .toString();
                          Navigator.pop(context);
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
