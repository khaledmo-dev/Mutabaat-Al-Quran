import 'package:flutter/cupertino.dart' show CupertinoSwitch;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heroicons/heroicons.dart';
import 'package:quran_test/app/app.locator.dart';
import 'package:quran_test/data/database.dart';
import 'package:quran_test/main.dart';
import 'package:quran_test/services/flash_message_service.dart';
import 'package:quran_test/services/local_storage_service.dart';
import 'package:quran_test/services/localization_service.dart';
import 'package:quran_test/ui/common/app_bar.dart';
import 'package:quran_test/ui/common/app_colors.dart';
import 'package:quran_test/ui/common/ui_helpers.dart';
// import 'package:quran_test/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'more_viewmodel.dart';

class MoreView extends StackedView<MoreViewModel> {
  const MoreView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MoreViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: BaseAppBar(title: Text("more".translate()), enableLeading: false),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Column(
          spacing: 16,
          children: [
            const SizedBox.shrink(),
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    child: MoreTile(
                      title: "share_app".translate(),
                      icon: const HeroIcon(
                        HeroIcons.share,
                        style: HeroIconStyle.solid,
                        color: Colors.white,
                      ),
                      height: double.infinity,
                      color: const Color(0xFF3B82F6),
                      onTap: () {
                        viewModel.share();
                      },
                    ),
                  ),
                  horizontalSpaceSmall,
                  Expanded(
                    child: MoreTile(
                      title: "rate_now".translate(),
                      icon: const HeroIcon(
                        HeroIcons.star,
                        style: HeroIconStyle.solid,
                        color: Colors.white,
                      ),
                      color: const Color(0xFFF59E0B),
                      height: double.infinity,
                      onTap: () {
                        viewModel.rate();
                      },
                    ),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                viewModel.toggleTheme();
              },
              borderRadius: BorderRadius.circular(4.0),
              child: Ink(
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 12.0,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  border:
                      Border.all(color: Theme.of(context).colorScheme.outline),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: kcPrimaryColor.withValues(alpha: .1),
                            borderRadius: BorderRadius.circular(2.0),
                          ),
                          child: const HeroIcon(
                            HeroIcons.moon,
                            style: HeroIconStyle.solid,
                            color: kcPrimaryColor,
                            size: 28,
                          ),
                        ),
                        horizontalSpaceSmall,
                        Text(
                          "dark_theme".translate(),
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    IgnorePointer(
                      child: Transform.scale(
                        scale: .9,
                        child: CupertinoSwitch(
                          value: viewModel.isDark,
                          activeTrackColor: kcPrimaryColor,
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                viewModel.toggleDate();
              },
              borderRadius: BorderRadius.circular(4.0),
              child: Ink(
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 12.0,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  border:
                      Border.all(color: Theme.of(context).colorScheme.outline),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: kcPrimaryColor.withValues(alpha: .1),
                            borderRadius: BorderRadius.circular(2.0),
                          ),
                          child: ShaderMask(
                            shaderCallback: (bounds) => const LinearGradient(
                              colors: [
                                kcPrimaryColor,
                                kcPrimaryColor,
                              ],
                            ).createShader(bounds),
                            blendMode: BlendMode.srcIn,
                            child: Image.asset(
                              "assets/calendar.png",
                              height: 28,
                            ),
                          ),
                        ),
                        horizontalSpaceSmall,
                        Text(
                          "hijri_date".translate(),
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    IgnorePointer(
                      child: Transform.scale(
                        scale: .9,
                        child: CupertinoSwitch(
                          value: viewModel.isHijri,
                          activeTrackColor: kcPrimaryColor,
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            MoreTile(
              title: "language".translate(),
              icon: const HeroIcon(
                HeroIcons.language,
                style: HeroIconStyle.solid,
                color: kcPrimaryColor,
              ),
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(),
                  context: context,
                  builder: (context) {
                    return const SetLanguageSheet();
                  },
                );
              },
            ),
            MoreTile(
              title: "contact_us".translate(),
              icon: const HeroIcon(
                HeroIcons.envelope,
                style: HeroIconStyle.solid,
                color: kcPrimaryColor,
              ),
              onTap: () {
                viewModel.contactUs();
              },
            ),
            MoreTile(
              title: "results".translate(),
              icon: const HeroIcon(
                HeroIcons.documentText,
                style: HeroIconStyle.solid,
                color: kcPrimaryColor,
              ),
              onTap: () {
                viewModel.goToResults();
              },
            ),
            MoreTile(
              title: "backup".translate(),
              icon: const HeroIcon(
                HeroIcons.circleStack,
                style: HeroIconStyle.solid,
                color: kcPrimaryColor,
              ),
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(),
                  context: context,
                  builder: (context) {
                    return const BackupSheet();
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  MoreViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MoreViewModel();
}

class MoreTile extends StatelessWidget {
  const MoreTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.color,
    this.height,
  });
  final String title;
  final Widget icon;
  final Function onTap;

  final Color? color;

  final double? height;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      borderRadius: BorderRadius.circular(4.0),
      child: Ink(
        padding: const EdgeInsetsDirectional.all(12.0),
        decoration: BoxDecoration(
          border: color != null
              ? null
              : Border.all(color: Theme.of(context).colorScheme.outline),
          borderRadius: BorderRadius.circular(4.0),
          color: color,
        ),
        height: height,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsetsDirectional.all(8.0),
              decoration: BoxDecoration(
                color: (color ?? kcPrimaryColor).withValues(alpha: .1),
                borderRadius: BorderRadius.circular(2.0),
              ),
              child: icon,
            ),
            horizontalSpaceSmall,
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: color != null ? Colors.white : null,
                  fontWeight: color != null ? FontWeight.bold : null,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Lang {
  final String name;
  final String code;
  final String image;

  Lang({required this.name, required this.code, required this.image});
}

class BackupSheet extends StatelessWidget {
  const BackupSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final flashMessageService = locator<FlashMessageService>();
    final databaseService = locator<Database>();
    final dialogService = locator<DialogService>();
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("backup".translate(), style: const TextStyle(fontSize: 20)),
            verticalSpaceMedium,
            MoreTile(
              title: "export_backup".translate(),
              icon: const HeroIcon(
                HeroIcons.arrowUpTray,
                style: HeroIconStyle.solid,
                color: kcPrimaryColor,
              ),
              onTap: () async {
                if (context.mounted) {
                  Navigator.pop(context);
                }
                var value = await databaseService.exportData();

                if (value) {
                  flashMessageService.showMessage(
                    title: "success".translate(),
                    message: 'export_success'.translate(),
                    type: FlashMessageType.success,
                  );
                } else {
                  flashMessageService.showMessage(
                    title: "error".translate(),
                    message: "export_failed".translate(),
                    type: FlashMessageType.danger,
                  );
                }
              },
            ),
            verticalSpaceSmall,
            MoreTile(
              title: "import_backup".translate(),
              icon: const HeroIcon(
                HeroIcons.arrowDownTray,
                style: HeroIconStyle.solid,
                color: kcPrimaryColor,
              ),
              onTap: () async {
                var result = await dialogService.showConfirmationDialog(
                  barrierDismissible: true,
                  title: "import_backup_message".translate(),
                  cancelTitle: "delete_data".translate(),
                  confirmationTitle: "keep_data".translate(),
                );
                if (context.mounted) {
                  Navigator.pop(context);
                }
                if (result != null) {
                  var value = await databaseService.importData(
                      keepOld: result.confirmed);

                  if (value) {
                    flashMessageService.showMessage(
                      title: "success".translate(),
                      message: 'import_success'.translate(),
                      type: FlashMessageType.success,
                    );
                  } else {
                    flashMessageService.showMessage(
                      title: "error".translate(),
                      message: "import_failed".translate(),
                      type: FlashMessageType.danger,
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SetLanguageSheet extends StatefulWidget {
  const SetLanguageSheet({super.key});
  @override
  State<SetLanguageSheet> createState() => _SetLanguageSheetState();
}

class _SetLanguageSheetState extends State<SetLanguageSheet> {
  final LocalStorageService localStorage = locator<LocalStorageService>();
  final List<Lang> langs = [
    Lang(name: 'العربية', code: 'ar', image: 'arab.svg'),
    Lang(name: 'English', code: 'en', image: 'gb.svg'),
    Lang(name: 'Bahasa Indonesia', code: 'id', image: 'id.svg'),
    Lang(name: 'اُردُو', code: 'ur', image: 'pk.svg'),
  ];

  late String lang;

  @override
  void initState() {
    super.initState();
    lang = localStorage.lang;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: langs.map((l) {
            return GestureDetector(
              onTap: () async {
                await locator<LocalizationService>().changeLanguage(l.code);

                setState(() {
                  lang = l.code;
                  localStorage.lang = lang;
                  languageNotifier.value = lang;
                });
                if (context.mounted) {
                  Navigator.of(context).pop();
                }
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 12.0,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).inputDecorationTheme.fillColor,
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: SvgPicture.asset(
                            "assets/flags/${l.image}",
                            height: 42,
                            width: 42,
                          ),
                        ),
                        horizontalSpaceSmall,
                        Text(l.name),
                      ],
                    ),
                    IgnorePointer(
                      child: Radio(
                        value: true,
                        groupValue: l.code == lang,
                        onChanged: (value) {},
                      ),
                    )
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
