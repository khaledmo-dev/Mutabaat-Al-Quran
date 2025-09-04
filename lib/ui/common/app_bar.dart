import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({
    super.key,
    this.actions,
    this.enableLeading = true,
    this.title,
    this.leading,
  });
  final Widget? title;
  final List<Widget>? actions;
  final bool enableLeading;
  final Widget? leading;
  @override
  Widget build(BuildContext context) {
    Theme.of(context);

    bool isEnglish = Localizations.localeOf(context).languageCode == 'en';

    return AppBar(
      title: title,
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0.5),
        child: Container(
          color: Theme.of(context).colorScheme.outline, // Border color
          height: .5,
        ),
      ),
      actions: actions?.map((e) => Center(child: e)).toList(),
      leading: enableLeading
          ? Center(
              child: leading ??
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: HeroIcon(
                      isEnglish
                          ? HeroIcons.arrowLeftCircle
                          : HeroIcons.arrowRightCircle,
                      style: HeroIconStyle.solid,
                    ),
                  ),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
