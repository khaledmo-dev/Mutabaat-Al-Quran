import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:quran_test/services/localization_service.dart';
import 'package:quran_test/ui/common/app_colors.dart';
import 'package:quran_test/ui/common/ui_helpers.dart';
import 'package:quran_test/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeDrawer extends ViewModelWidget<HomeViewModel> {
  const HomeDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context, viewModel) {
    return SafeArea(
      child: Drawer(
          child: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          verticalSpaceMedium,
          DrawerTile(
            title: 'results'.translate(),
            icon: IconlyBold.document,
            onTap: viewModel.goToResults,
          ),
          DrawerTile(
            title: 'contact_us'.translate(),
            icon: IconlyBold.call,
            onTap: () => launchUrl(Uri.parse('https://wa.me/201099107801')),
          ),
          DrawerTile(
            title: 'language'.translate(),
            icon: Icons.language,
            onTap: () {
              showModalBottomSheet(
                backgroundColor: Colors.white,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                context: context,
                builder: (context) {
                  return const SetLanguageSheet();
                },
              );
            },
          ),
        ],
      )),
    );
  }
}

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.color,
  });
  final String title;
  final IconData icon;
  final Function onTap;

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: const EdgeInsetsDirectional.all(12.0),
        margin: const EdgeInsetsDirectional.only(bottom: 12.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey[300]!,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsetsDirectional.all(8.0),
              decoration: BoxDecoration(
                color: color ?? kcPrimaryColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 20,
              ),
            ),
            horizontalSpaceSmall,
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
